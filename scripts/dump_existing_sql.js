#!/usr/bin/env node
/**
 * 把 SQLite 里已有导入数据回写成 sql/imports/*.sql
 * 用法：node scripts/dump_existing_sql.js
 */

const fs = require("node:fs");
const path = require("node:path");
const { DatabaseSync } = require("node:sqlite");
const { writeImportSqlFile } = require("./write_import_sql");

const ROOT = path.resolve(__dirname, "..");
const DB_PATH = path.join(ROOT, "data", "study.sqlite");
const SQL_DIR = path.join(ROOT, "sql", "imports");

function safeJson(text, fallback) {
  try {
    return JSON.parse(text);
  } catch {
    return fallback;
  }
}

function main() {
  if (!fs.existsSync(DB_PATH)) {
    console.error(`找不到数据库：${DB_PATH}`);
    process.exit(1);
  }

  const db = new DatabaseSync(DB_PATH);
  const docs = db.prepare(`
    SELECT id, filename, file_path, doc_date, file_hash, parse_summary, ai_validation, status
    FROM source_documents
    WHERE status = 'imported'
    ORDER BY doc_date ASC, id ASC
  `).all();

  const articleStmt = db.prepare(`
    SELECT article_order AS "order", title, body, source, tags
    FROM affairs_articles
    WHERE document_id = ?
    ORDER BY article_order ASC, id ASC
  `);
  const questionStmt = db.prepare(`
    SELECT question_order AS "order", source_type, question_type, prompt, options_json, answer, explanation, tags
    FROM practice_questions
    WHERE document_id = ?
    ORDER BY question_order ASC, id ASC
  `);
  const knowledgeStmt = db.prepare(`
    SELECT item_order AS "order", category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at
    FROM knowledge_items
    WHERE document_id = ?
    ORDER BY item_order ASC, id ASC
  `);

  const written = [];
  for (const doc of docs) {
    const isDigest = String(doc.filename || "").startsWith("每日积累");
    const articles = articleStmt.all(doc.id);
    const questions = questionStmt.all(doc.id).map(row => ({
      order: row.order,
      source_type: row.source_type || (isDigest ? "digest" : "document"),
      question_type: row.question_type || "单选",
      prompt: row.prompt,
      options: safeJson(row.options_json, []),
      answer: row.answer || "",
      explanation: row.explanation || "",
      tags: row.tags || ""
    }));
    const knowledge = knowledgeStmt.all(doc.id);

    const sqlPath = writeImportSqlFile(SQL_DIR, {
      kind: isDigest ? "daily-digest-backfill" : "docx-backfill",
      filename: doc.filename,
      fullPath: doc.file_path || "",
      docDate: doc.doc_date || "",
      hash: doc.file_hash || "",
      summary: safeJson(doc.parse_summary, {}),
      aiValidation: doc.ai_validation || "",
      articles,
      questions,
      knowledge,
      questionSourceType: isDigest ? "digest" : "document",
      clearQuestionsAll: true,
      stableName: true
    });
    written.push({
      filename: doc.filename,
      doc_date: doc.doc_date,
      articles: articles.length,
      questions: questions.length,
      knowledge: knowledge.length,
      sql: path.relative(ROOT, sqlPath)
    });
  }

  console.log(`已写出 ${written.length} 个 SQL 文件到 sql/imports/`);
  for (const item of written) {
    console.log(`- ${item.sql} (材料 ${item.articles} / 题 ${item.questions} / 知识 ${item.knowledge})`);
  }
}

main();
