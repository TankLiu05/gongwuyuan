/**
 * 把一次导入对应的数据写成可回放的 SQL 文件。
 * 用 filename 定位 document，避免写死 SQLite 自增 id。
 */

const fs = require("node:fs");
const path = require("node:path");

function ensureDir(dir) {
  fs.mkdirSync(dir, { recursive: true });
}

function sqlString(value) {
  if (value === null || value === undefined) return "''";
  return `'${String(value).replace(/'/g, "''")}'`;
}

function sqlInt(value) {
  const n = Number(value);
  return Number.isFinite(n) ? String(Math.trunc(n)) : "0";
}

function safeSqlBasename(name) {
  return String(name || "import")
    .replace(/[\\/:*?"<>|]/g, "_")
    .replace(/\s+/g, "_")
    .slice(0, 120);
}

function docIdExpr(filename) {
  return `(SELECT id FROM source_documents WHERE filename = ${sqlString(filename)})`;
}

function buildSourceDocumentUpsertSql({ filename, fullPath, docDate, hash, summary, aiValidation }) {
  return [
    `INSERT INTO source_documents`,
    `  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)`,
    `VALUES (`,
    `  ${sqlString(filename)},`,
    `  ${sqlString(fullPath)},`,
    `  ${sqlString(docDate)},`,
    `  ${sqlString(hash)},`,
    `  'imported',`,
    `  ${sqlString(JSON.stringify(summary || {}))},`,
    `  ${sqlString(aiValidation || "")},`,
    `  '',`,
    `  CURRENT_TIMESTAMP`,
    `)`,
    `ON CONFLICT(filename) DO UPDATE SET`,
    `  file_path = excluded.file_path,`,
    `  doc_date = excluded.doc_date,`,
    `  file_hash = excluded.file_hash,`,
    `  status = 'imported',`,
    `  parse_summary = excluded.parse_summary,`,
    `  ai_validation = excluded.ai_validation,`,
    `  error_message = '',`,
    `  imported_at = CURRENT_TIMESTAMP,`,
    `  updated_at = CURRENT_TIMESTAMP;`
  ].join("\n");
}

function buildArticleInsertSql(filename, item, docDate) {
  return [
    `INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)`,
    `VALUES (`,
    `  ${docIdExpr(filename)},`,
    `  ${sqlInt(item.order)},`,
    `  ${sqlString(item.title)},`,
    `  ${sqlString(item.body)},`,
    `  ${sqlString(item.source || "")},`,
    `  ${sqlString(docDate)},`,
    `  ${sqlString(item.tags || "")}`,
    `);`
  ].join("\n");
}

function buildQuestionInsertSql(filename, item, docDate, sourceType) {
  return [
    `INSERT INTO practice_questions`,
    `  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)`,
    `VALUES (`,
    `  ${docIdExpr(filename)},`,
    `  ${sqlInt(item.order || item.question_order || 0)},`,
    `  ${sqlString(sourceType)},`,
    `  ${sqlString(item.question_type || "单选")},`,
    `  ${sqlString(item.prompt)},`,
    `  ${sqlString(JSON.stringify(item.options || []))},`,
    `  ${sqlString(item.answer || "")},`,
    `  ${sqlString(item.explanation || "")},`,
    `  ${sqlString(item.tags || "")},`,
    `  ${sqlString(docDate)}`,
    `);`
  ].join("\n");
}

function buildKnowledgeInsertSql(filename, item) {
  return [
    `INSERT INTO knowledge_items`,
    `  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)`,
    `VALUES (`,
    `  ${docIdExpr(filename)},`,
    `  ${sqlInt(item.order)},`,
    `  ${sqlString(item.category)},`,
    `  ${sqlString(item.title)},`,
    `  ${sqlString(item.body)},`,
    `  ${sqlString(item.tags || "")},`,
    `  ${sqlString(item.topic || "")},`,
    `  ${sqlString(item.kind || "")},`,
    `  ${sqlString(item.fingerprint || "")},`,
    `  ${sqlString(item.memory_status || "learning")},`,
    `  ${sqlString(item.last_reviewed_at || "")}`,
    `);`
  ].join("\n");
}

function writeImportSqlFile(sqlDir, {
  kind,
  filename,
  fullPath,
  docDate,
  hash,
  summary,
  aiValidation,
  articles = [],
  questions = [],
  knowledge = [],
  questionSourceType = "document",
  clearQuestionsAll = false,
  stableName = false
}) {
  ensureDir(sqlDir);
  const stamp = new Date().toISOString().replace(/[:.]/g, "-");
  const base = stableName
    ? `${docDate || "unknown"}__${safeSqlBasename(filename)}.sql`
    : `${docDate || "unknown"}__${safeSqlBasename(filename)}__${stamp}.sql`;
  const filePath = path.join(sqlDir, base);
  const lines = [
    `-- Auto-generated import SQL`,
    `-- kind: ${kind}`,
    `-- filename: ${filename}`,
    `-- doc_date: ${docDate}`,
    `-- generated_at: ${new Date().toISOString()}`,
    ``,
    `BEGIN;`,
    ``,
    buildSourceDocumentUpsertSql({ filename, fullPath, docDate, hash, summary, aiValidation }),
    ``,
    `DELETE FROM affairs_articles WHERE document_id = ${docIdExpr(filename)};`,
    clearQuestionsAll
      ? `DELETE FROM practice_questions WHERE document_id = ${docIdExpr(filename)};`
      : `DELETE FROM practice_questions WHERE document_id = ${docIdExpr(filename)} AND source_type = 'document';`,
    `DELETE FROM knowledge_items WHERE document_id = ${docIdExpr(filename)};`,
    ``
  ];

  for (const item of articles) {
    lines.push(buildArticleInsertSql(filename, item, docDate), ``);
  }
  for (const item of questions) {
    const sourceType = item.source_type || questionSourceType;
    lines.push(buildQuestionInsertSql(filename, item, docDate, sourceType), ``);
  }
  for (const item of knowledge) {
    lines.push(buildKnowledgeInsertSql(filename, item), ``);
  }

  lines.push(`COMMIT;`, ``);
  fs.writeFileSync(filePath, lines.join("\n"), "utf8");
  return filePath;
}

module.exports = {
  writeImportSqlFile,
  sqlString,
  safeSqlBasename
};
