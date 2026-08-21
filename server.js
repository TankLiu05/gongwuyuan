const http = require("node:http");
const fs = require("node:fs");
const path = require("node:path");
const crypto = require("node:crypto");
const { exec, execFile } = require("node:child_process");
const { DatabaseSync } = require("node:sqlite");

const ROOT = __dirname;
const CONTENT_ROOT = path.resolve(ROOT, "..");
const PUBLIC_DIR = path.join(ROOT, "public");
const DATA_DIR = path.join(ROOT, "data");
const EXPORT_DIR = path.join(ROOT, "exports");
const DB_PATH = path.join(DATA_DIR, "study.sqlite");
const PARSER_PATH = path.join(ROOT, "scripts", "parse_docx.py");
const PYTHON = process.env.PYTHON || "python3";
const {
  parseDailyDigest,
  digestFilename,
  toKnowledgeItems
} = require("./scripts/parse_daily_digest");
const { writeImportSqlFile } = require("./scripts/write_import_sql");

fs.mkdirSync(DATA_DIR, { recursive: true });
fs.mkdirSync(EXPORT_DIR, { recursive: true });
const SQL_IMPORT_DIR = path.join(ROOT, "sql", "imports");
fs.mkdirSync(SQL_IMPORT_DIR, { recursive: true });

const env = {
  ...loadEnv(path.join(CONTENT_ROOT, ".env")),
  ...loadEnv(path.join(ROOT, ".env"))
};
const PORT = Number(env.PORT || process.env.PORT || 4783);

const db = new DatabaseSync(DB_PATH);
db.exec(`
  PRAGMA journal_mode = WAL;
  PRAGMA foreign_keys = ON;

  CREATE TABLE IF NOT EXISTS daily_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    log_date TEXT NOT NULL UNIQUE,
    study_minutes INTEGER NOT NULL DEFAULT 0,
    reasoning_json TEXT NOT NULL DEFAULT '{}',
    essay_note TEXT NOT NULL DEFAULT '',
    affairs_note TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS wrong_questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    module TEXT NOT NULL,
    question_type TEXT NOT NULL DEFAULT '',
    prompt TEXT NOT NULL,
    correct_answer TEXT NOT NULL DEFAULT '',
    my_answer TEXT NOT NULL DEFAULT '',
    reason TEXT NOT NULL DEFAULT '',
    tags TEXT NOT NULL DEFAULT '',
    review_status TEXT NOT NULL DEFAULT 'pending',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS current_affairs_docs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    filename TEXT NOT NULL UNIQUE,
    doc_date TEXT NOT NULL,
    tags TEXT NOT NULL DEFAULT '',
    review_status TEXT NOT NULL DEFAULT 'unread',
    notes TEXT NOT NULL DEFAULT '',
    size_bytes INTEGER NOT NULL DEFAULT 0,
    mtime_ms INTEGER NOT NULL DEFAULT 0,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS ai_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    review_date TEXT NOT NULL,
    content TEXT NOT NULL,
    prompt TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS app_settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS source_documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    filename TEXT NOT NULL UNIQUE,
    file_path TEXT NOT NULL,
    doc_date TEXT NOT NULL DEFAULT '',
    file_hash TEXT NOT NULL DEFAULT '',
    status TEXT NOT NULL DEFAULT 'pending',
    parse_summary TEXT NOT NULL DEFAULT '{}',
    ai_validation TEXT NOT NULL DEFAULT '',
    error_message TEXT NOT NULL DEFAULT '',
    imported_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS affairs_articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    document_id INTEGER NOT NULL,
    article_order INTEGER NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    source TEXT NOT NULL DEFAULT '',
    doc_date TEXT NOT NULL DEFAULT '',
    tags TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(document_id) REFERENCES source_documents(id) ON DELETE CASCADE
  );

  CREATE TABLE IF NOT EXISTS practice_questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    document_id INTEGER,
    question_order INTEGER NOT NULL DEFAULT 0,
    source_type TEXT NOT NULL DEFAULT 'document',
    question_type TEXT NOT NULL DEFAULT '单选',
    prompt TEXT NOT NULL,
    options_json TEXT NOT NULL DEFAULT '[]',
    answer TEXT NOT NULL DEFAULT '',
    explanation TEXT NOT NULL DEFAULT '',
    tags TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(document_id) REFERENCES source_documents(id) ON DELETE SET NULL
  );

  CREATE TABLE IF NOT EXISTS knowledge_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    document_id INTEGER NOT NULL,
    item_order INTEGER NOT NULL,
    category TEXT NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    tags TEXT NOT NULL DEFAULT '',
    memory_status TEXT NOT NULL DEFAULT 'learning',
    last_reviewed_at TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(document_id) REFERENCES source_documents(id) ON DELETE CASCADE
  );
`);

ensureColumn("knowledge_items", "memory_status", "TEXT NOT NULL DEFAULT 'learning'");
ensureColumn("knowledge_items", "last_reviewed_at", "TEXT NOT NULL DEFAULT ''");
ensureColumn("knowledge_items", "topic", "TEXT NOT NULL DEFAULT ''");
ensureColumn("knowledge_items", "kind", "TEXT NOT NULL DEFAULT ''");
ensureColumn("knowledge_items", "fingerprint", "TEXT NOT NULL DEFAULT ''");
ensureColumn("practice_questions", "doc_date", "TEXT NOT NULL DEFAULT ''");
ensureColumn("practice_questions", "user_answer", "TEXT NOT NULL DEFAULT ''");
ensureColumn("practice_questions", "answer_status", "TEXT NOT NULL DEFAULT ''");

db.exec(`
  CREATE TABLE IF NOT EXISTS content_kinds_meta (
    kind TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    tab TEXT NOT NULL DEFAULT 'memory'
  );
  INSERT OR IGNORE INTO content_kinds_meta (kind, label, tab) VALUES
    ('material', '时政材料', 'materials'),
    ('question', '题目', 'questions'),
    ('history', '历史上的今天', 'memory'),
    ('common', '常识', 'memory'),
    ('term', '词语', 'idioms'),
    ('idiom', '成语', 'idioms'),
    ('award', '颁奖辞', 'memory'),
    ('extension', '拓展', 'memory'),
    ('quote', '金句', 'memory');
`);

db.exec(`
  CREATE TABLE IF NOT EXISTS shenlun_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_type TEXT NOT NULL DEFAULT '',
    prompt TEXT NOT NULL,
    materials TEXT NOT NULL,
    answer TEXT NOT NULL,
    max_score INTEGER NOT NULL DEFAULT 20,
    score TEXT NOT NULL DEFAULT '',
    key_points TEXT NOT NULL DEFAULT '',
    missing_points TEXT NOT NULL DEFAULT '',
    polished_answer TEXT NOT NULL DEFAULT '',
    ai_raw TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS chat_sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    context_json TEXT NOT NULL DEFAULT '{}',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS chat_messages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id INTEGER NOT NULL,
    role TEXT NOT NULL,
    content TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(session_id) REFERENCES chat_sessions(id) ON DELETE CASCADE
  );
`);

scanCurrentAffairsDocs();

const server = http.createServer(async (req, res) => {
  try {
    const url = new URL(req.url, `http://${req.headers.host}`);
    if (url.pathname.startsWith("/api/")) {
      await handleApi(req, res, url);
      return;
    }
    serveStatic(req, res, url);
  } catch (error) {
    sendJson(res, error.status || 500, { error: error.message || "服务异常" });
  }
});

server.on("error", error => {
  console.error(error.message);
  process.exit(1);
});

server.listen(PORT, "127.0.0.1", () => {
  const url = `http://127.0.0.1:${PORT}`;
  console.log(`公考学习追踪已启动: ${url}`);
  if (process.argv.includes("--open")) openBrowser(url);
});

async function handleApi(req, res, url) {
  const method = req.method || "GET";

  if (method === "GET" && url.pathname === "/api/state") return sendJson(res, 200, getState());
  if (method === "GET" && url.pathname === "/api/documents") return sendJson(res, 200, getDocumentsState());
  if (method === "GET" && url.pathname === "/api/materials") return sendJson(res, 200, { materials: getMaterials() });
  if (method === "GET" && url.pathname === "/api/questions") return sendJson(res, 200, { questions: getQuestions() });
  if (method === "GET" && url.pathname === "/api/knowledge") return sendJson(res, 200, { knowledge: getKnowledge() });
  if (method === "GET" && url.pathname === "/api/chat/sessions") return sendJson(res, 200, { sessions: getChatSessions() });

  const knowledgeMatch = url.pathname.match(/^\/api\/knowledge\/(\d+)$/);
  if (method === "PATCH" && knowledgeMatch) {
    const body = await readJson(req);
    const status = toText(body.memory_status);
    if (!["learning", "mastered"].includes(status)) throw httpError("memory_status 只能是 learning 或 mastered", 400);
    db.prepare(`
      UPDATE knowledge_items
      SET memory_status = ?, last_reviewed_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).run(status, Number(knowledgeMatch[1]));
    return sendJson(res, 200, { knowledge: getKnowledge() });
  }

  const questionMatch = url.pathname.match(/^\/api\/questions\/(\d+)\/answer$/);
  if (method === "POST" && questionMatch) {
    const body = await readJson(req);
    const userAnswer = toText(body.answer).toUpperCase();
    const row = db.prepare("SELECT id, answer FROM practice_questions WHERE id = ?").get(Number(questionMatch[1]));
    if (!row) throw httpError("题目不存在", 404);
    const correct = toText(row.answer).toUpperCase();
    const answerStatus = !correct ? "unknown" : userAnswer === correct ? "correct" : "wrong";
    db.prepare(`
      UPDATE practice_questions
      SET user_answer = ?, answer_status = ?
      WHERE id = ?
    `).run(userAnswer, answerStatus, row.id);
    return sendJson(res, 200, { questions: getQuestions(), result: { answer_status: answerStatus, correct_answer: correct } });
  }

  if (method === "POST" && url.pathname === "/api/documents/reparse-all") {
    const files = listExistingDocx();
    const results = [];
    for (const item of files) {
      try {
        const imported = await importDocument(path.join(CONTENT_ROOT, item.filename), { skipAi: true });
        results.push({ filename: item.filename, ok: true, summary: imported.summary });
      } catch (error) {
        results.push({ filename: item.filename, ok: false, error: error.message });
      }
    }
    return sendJson(res, 200, { reparsed: results.length, results, state: getState() });
  }

  if (method === "POST" && url.pathname === "/api/daily-log") {
    const body = await readJson(req);
    db.prepare(`
      INSERT INTO daily_logs (log_date, study_minutes, reasoning_json, essay_note, affairs_note, updated_at)
      VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)
      ON CONFLICT(log_date) DO UPDATE SET
        study_minutes = excluded.study_minutes,
        reasoning_json = excluded.reasoning_json,
        essay_note = excluded.essay_note,
        affairs_note = excluded.affairs_note,
        updated_at = CURRENT_TIMESTAMP
    `).run(
      requireDate(body.log_date),
      toInt(body.study_minutes),
      JSON.stringify(normalizeReasoning(body.reasoning)),
      toText(body.essay_note),
      toText(body.affairs_note)
    );
    return sendJson(res, 200, getState());
  }

  if (method === "POST" && url.pathname === "/api/wrong-question") {
    const body = await readJson(req);
    db.prepare(`
      INSERT INTO wrong_questions
        (module, question_type, prompt, correct_answer, my_answer, reason, tags, review_status, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)
    `).run(
      requiredText(body.module, "模块不能为空"),
      toText(body.question_type),
      requiredText(body.prompt, "题干不能为空"),
      toText(body.correct_answer),
      toText(body.my_answer),
      toText(body.reason),
      toText(body.tags),
      validStatus(body.review_status, ["pending", "reviewing", "mastered"], "pending")
    );
    return sendJson(res, 200, getState());
  }

  const wrongMatch = url.pathname.match(/^\/api\/wrong-question\/(\d+)$/);
  if (method === "PATCH" && wrongMatch) {
    const body = await readJson(req);
    db.prepare(`
      UPDATE wrong_questions SET
        module = COALESCE(?, module),
        question_type = COALESCE(?, question_type),
        prompt = COALESCE(?, prompt),
        correct_answer = COALESCE(?, correct_answer),
        my_answer = COALESCE(?, my_answer),
        reason = COALESCE(?, reason),
        tags = COALESCE(?, tags),
        review_status = COALESCE(?, review_status),
        updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).run(
      optionalText(body.module),
      optionalText(body.question_type),
      optionalText(body.prompt),
      optionalText(body.correct_answer),
      optionalText(body.my_answer),
      optionalText(body.reason),
      optionalText(body.tags),
      body.review_status ? validStatus(body.review_status, ["pending", "reviewing", "mastered"], "pending") : null,
      Number(wrongMatch[1])
    );
    return sendJson(res, 200, getState());
  }

  if (method === "POST" && url.pathname === "/api/current-affairs/rescan") {
    scanCurrentAffairsDocs();
    return sendJson(res, 200, getState());
  }

  const affairsMatch = url.pathname.match(/^\/api\/current-affairs\/(\d+)$/);
  if (method === "PATCH" && affairsMatch) {
    const body = await readJson(req);
    db.prepare(`
      UPDATE current_affairs_docs SET
        tags = COALESCE(?, tags),
        review_status = COALESCE(?, review_status),
        notes = COALESCE(?, notes),
        updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).run(
      optionalText(body.tags),
      body.review_status ? validStatus(body.review_status, ["unread", "reviewing", "done"], "unread") : null,
      optionalText(body.notes),
      Number(affairsMatch[1])
    );
    return sendJson(res, 200, getState());
  }

  if (method === "POST" && url.pathname === "/api/documents/upload") {
    const result = await handleDocumentUpload(req);
    return sendJson(res, 200, result);
  }

  if (method === "POST" && url.pathname === "/api/documents/import-existing") {
    const body = await readJson(req);
    const filenames = Array.isArray(body.filenames) ? body.filenames : [];
    const imported = [];
    for (const filename of filenames) imported.push(await importExistingDocument(filename));
    return sendJson(res, 200, { imported, ...getDocumentsState() });
  }

  if (method === "POST" && url.pathname === "/api/daily-digest/preview") {
    const body = await readJson(req);
    const parsed = parseDailyDigest(body.text, body.answer_text, body.doc_date);
    return sendJson(res, 200, {
      parsed,
      summary: summarizeDailyDigest(parsed)
    });
  }

  if (method === "POST" && url.pathname === "/api/daily-digest/import") {
    const body = await readJson(req);
    const result = importDailyDigest(body);
    return sendJson(res, 200, result);
  }

  if (method === "POST" && url.pathname === "/api/ai/review") {
    const state = getState();
    const prompt = buildAiPrompt(state);
    const content = await requestAiText([
      { role: "system", content: "你是一个务实的公考备考教练，只给清晰、可执行的中文建议。" },
      { role: "user", content: prompt }
    ], { max_tokens: 900 });
    db.prepare("INSERT INTO ai_reviews (review_date, content, prompt) VALUES (?, ?, ?)").run(formatDate(new Date()), content, prompt);
    return sendJson(res, 200, getState());
  }

  if (method === "POST" && url.pathname === "/api/ai/generate-questions") {
    const body = await readJson(req);
    const result = await generateAiQuestions(body);
    return sendJson(res, 200, result);
  }

  if (method === "POST" && url.pathname === "/api/ai/shenlun-review") {
    const body = await readJson(req);
    const result = await reviewShenlun(body);
    return sendJson(res, 200, result);
  }

  if (method === "POST" && url.pathname === "/api/chat") {
    const body = await readJson(req);
    const result = await chatWithContext(body);
    return sendJson(res, 200, result);
  }

  if (method === "GET" && url.pathname === "/api/export/json") {
    const payload = JSON.stringify(getState(), null, 2);
    const file = `study-export-${timestampForFile()}.json`;
    fs.writeFileSync(path.join(EXPORT_DIR, file), payload);
    return sendDownload(res, "application/json; charset=utf-8", file, payload);
  }

  if (method === "GET" && url.pathname === "/api/export/csv") {
    const payload = buildCsvExport(getState());
    const file = `study-export-${timestampForFile()}.csv`;
    fs.writeFileSync(path.join(EXPORT_DIR, file), payload);
    return sendDownload(res, "text/csv; charset=utf-8", file, payload);
  }

  sendJson(res, 404, { error: "接口不存在" });
}

async function handleDocumentUpload(req) {
  const buffer = await readBuffer(req, 25 * 1024 * 1024);
  const contentType = req.headers["content-type"] || "";
  const boundary = contentType.match(/boundary=(?:"([^"]+)"|([^;]+))/)?.[1] || contentType.match(/boundary=(?:"([^"]+)"|([^;]+))/)?.[2];
  if (!boundary) throw httpError("上传格式错误：缺少 multipart boundary", 400);
  const parts = parseMultipart(buffer, boundary);
  const file = parts.find(part => part.filename);
  if (!file) throw httpError("没有找到上传文件", 400);
  const filename = safeDocxFilename(file.filename);
  const target = path.join(CONTENT_ROOT, filename);
  if (fs.existsSync(target)) fs.unlinkSync(target);
  fs.writeFileSync(target, file.content);
  const imported = await importDocument(target);
  return { uploaded: filename, imported, ...getDocumentsState() };
}

async function importExistingDocument(filename) {
  const safeName = safeDocxFilename(filename);
  const fullPath = path.join(CONTENT_ROOT, safeName);
  if (!fs.existsSync(fullPath)) throw httpError(`文件不存在：${safeName}`, 404);
  return importDocument(fullPath);
}

async function importDocument(fullPath, options = {}) {
  const filename = path.basename(fullPath);
  const stat = fs.statSync(fullPath);
  const hash = crypto.createHash("sha256").update(fs.readFileSync(fullPath)).digest("hex");
  let parsed;
  try {
    parsed = await parseDocx(fullPath);
  } catch (error) {
    upsertFailedDocument(filename, fullPath, hash, error.message);
    throw httpError(`解析失败：${error.message}`, 422);
  }

  const summary = {
    paragraphs: parsed.paragraphs?.length || 0,
    articles: parsed.articles?.length || 0,
    questions: parsed.questions?.length || 0,
    knowledge: parsed.knowledge?.length || 0,
    warnings: parsed.warnings || []
  };
  const aiValidation = options.skipAi
    ? `本地规则重解析完成${(parsed.warnings || []).length ? `；提示：${parsed.warnings.join("；")}` : ""}`
    : await validateParsedDocument(parsed).catch(error => `AI 校验跳过：${error.message}`);
  const replaced = replaceDocumentRows({
    filename,
    fullPath,
    docDate: parsed.doc_date || dateFromFilename(filename) || formatDate(stat.mtime),
    hash,
    summary,
    aiValidation,
    parsed
  });
  scanCurrentAffairsDocs();
  const docDate = parsed.doc_date || dateFromFilename(filename) || formatDate(stat.mtime);
  return {
    id: replaced.id,
    filename,
    doc_date: docDate,
    summary,
    ai_validation: aiValidation,
    sql_path: replaced.sql_path
  };
}

function knowledgeFingerprint(item) {
  if (item.fingerprint) return toText(item.fingerprint);
  return `${toText(item.category)}|${toText(item.topic)}|${toText(item.title)}|${toText(item.body).slice(0, 80)}`;
}

function replaceDocumentRows({ filename, fullPath, docDate, hash, summary, aiValidation, parsed }) {
  let doc = db.prepare("SELECT id FROM source_documents WHERE filename = ?").get(filename);
  const priorMemory = new Map();
  if (doc) {
    for (const row of db.prepare(`
      SELECT fingerprint, category, title, body, memory_status, last_reviewed_at
      FROM knowledge_items WHERE document_id = ?
    `).all(doc.id)) {
      const keys = [
        toText(row.fingerprint),
        `${toText(row.category)}|${toText(row.title)}`,
        `${toText(row.category)}|${toText(row.title)}|${toText(row.body).slice(0, 80)}`
      ].filter(Boolean);
      for (const key of keys) {
        if (!priorMemory.has(key)) {
          priorMemory.set(key, {
            memory_status: row.memory_status || "learning",
            last_reviewed_at: row.last_reviewed_at || ""
          });
        }
      }
    }
  }

  if (!doc) {
    const result = db.prepare(`
      INSERT INTO source_documents
        (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, updated_at)
      VALUES (?, ?, ?, ?, 'imported', ?, ?, CURRENT_TIMESTAMP)
    `).run(filename, fullPath, docDate, hash, JSON.stringify(summary), aiValidation);
    doc = { id: Number(result.lastInsertRowid) };
  } else {
    db.prepare("DELETE FROM affairs_articles WHERE document_id = ?").run(doc.id);
    db.prepare("DELETE FROM practice_questions WHERE document_id = ? AND source_type = 'document'").run(doc.id);
    db.prepare("DELETE FROM knowledge_items WHERE document_id = ?").run(doc.id);
    db.prepare(`
      UPDATE source_documents SET
        file_path = ?, doc_date = ?, file_hash = ?, status = 'imported',
        parse_summary = ?, ai_validation = ?, error_message = '',
        imported_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).run(fullPath, docDate, hash, JSON.stringify(summary), aiValidation, doc.id);
  }

  const articleStmt = db.prepare(`
    INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `);
  const articlesForSql = [];
  for (const item of parsed.articles || []) {
    const row = {
      order: toInt(item.order),
      title: toText(item.title),
      body: toText(item.body),
      source: toText(item.source),
      tags: toText(item.tags)
    };
    articleStmt.run(doc.id, row.order, row.title, row.body, row.source, docDate, row.tags);
    articlesForSql.push(row);
  }

  const questionStmt = db.prepare(`
    INSERT INTO practice_questions
      (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
    VALUES (?, ?, 'document', ?, ?, ?, ?, ?, ?, ?)
  `);
  const questionsForSql = [];
  for (const item of parsed.questions || []) {
    const row = {
      order: toInt(item.order),
      question_type: toText(item.question_type) || "单选",
      prompt: toText(item.prompt),
      options: item.options || [],
      answer: toText(item.answer),
      explanation: toText(item.explanation),
      tags: toText(item.tags)
    };
    questionStmt.run(
      doc.id,
      row.order,
      row.question_type,
      row.prompt,
      JSON.stringify(row.options),
      row.answer,
      row.explanation,
      row.tags,
      docDate
    );
    questionsForSql.push(row);
  }

  const knowledgeStmt = db.prepare(`
    INSERT INTO knowledge_items
      (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `);
  const knowledgeForSql = [];
  for (const item of parsed.knowledge || []) {
    const fingerprint = knowledgeFingerprint(item);
    const prior = priorMemory.get(fingerprint)
      || priorMemory.get(`${toText(item.category)}|${toText(item.title)}`)
      || { memory_status: "learning", last_reviewed_at: "" };
    const row = {
      order: toInt(item.order),
      category: toText(item.category),
      title: toText(item.title),
      body: toText(item.body),
      tags: toText(item.tags),
      topic: toText(item.topic),
      kind: toText(item.kind),
      fingerprint,
      memory_status: prior.memory_status,
      last_reviewed_at: prior.last_reviewed_at
    };
    knowledgeStmt.run(
      doc.id,
      row.order,
      row.category,
      row.title,
      row.body,
      row.tags,
      row.topic,
      row.kind,
      row.fingerprint,
      row.memory_status,
      row.last_reviewed_at
    );
    knowledgeForSql.push(row);
  }

  const sqlPath = writeImportSqlFile(SQL_IMPORT_DIR, {
    kind: "docx",
    filename,
    fullPath,
    docDate,
    hash,
    summary,
    aiValidation,
    articles: articlesForSql,
    questions: questionsForSql,
    knowledge: knowledgeForSql,
    questionSourceType: "document",
    clearQuestionsAll: false
  });
  doc.sql_path = path.relative(ROOT, sqlPath);
  return { id: doc.id, sql_path: doc.sql_path };
}

function summarizeDailyDigest(parsed) {
  return {
    idioms: parsed.idioms?.length || 0,
    quotes: parsed.quotes?.length || 0,
    questions: parsed.questions?.length || 0,
    warnings: parsed.warnings || []
  };
}

function importDailyDigest(body) {
  const text = requiredText(body.text, "请粘贴每日积累正文");
  const answerText = toText(body.answer_text);
  const parsed = parseDailyDigest(text, answerText, body.doc_date);
  const docDate = requireDate(parsed.doc_date || body.doc_date);
  parsed.doc_date = docDate;

  const knowledge = toKnowledgeItems(parsed);
  const questions = parsed.questions || [];
  if (!knowledge.length && !questions.length) {
    throw httpError(`未能解析出可写入内容${parsed.warnings?.length ? `：${parsed.warnings.join("；")}` : ""}`, 422);
  }

  const filename = digestFilename(docDate);
  const fullPath = `manual://${filename}`;
  const hash = crypto.createHash("sha256").update(`${docDate}\n${text}\n${answerText}`).digest("hex");
  const summary = {
    source: "daily-digest",
    ...summarizeDailyDigest(parsed),
    knowledge: knowledge.length
  };

  let doc = db.prepare("SELECT id FROM source_documents WHERE filename = ?").get(filename);
  const priorMemory = new Map();
  if (doc) {
    for (const row of db.prepare(`
      SELECT fingerprint, category, title, body, memory_status, last_reviewed_at
      FROM knowledge_items WHERE document_id = ?
    `).all(doc.id)) {
      const keys = [
        toText(row.fingerprint),
        `${toText(row.category)}|${toText(row.title)}`,
        `${toText(row.category)}|${toText(row.title)}|${toText(row.body).slice(0, 80)}`
      ].filter(Boolean);
      for (const key of keys) {
        if (!priorMemory.has(key)) {
          priorMemory.set(key, {
            memory_status: row.memory_status || "learning",
            last_reviewed_at: row.last_reviewed_at || ""
          });
        }
      }
    }
  }

  if (!doc) {
    const result = db.prepare(`
      INSERT INTO source_documents
        (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, updated_at)
      VALUES (?, ?, ?, ?, 'imported', ?, ?, CURRENT_TIMESTAMP)
    `).run(filename, fullPath, docDate, hash, JSON.stringify(summary), "每日积累手工写入");
    doc = { id: Number(result.lastInsertRowid) };
  } else {
    db.prepare("DELETE FROM practice_questions WHERE document_id = ?").run(doc.id);
    db.prepare("DELETE FROM knowledge_items WHERE document_id = ?").run(doc.id);
    db.prepare(`
      UPDATE source_documents SET
        file_path = ?, doc_date = ?, file_hash = ?, status = 'imported',
        parse_summary = ?, ai_validation = ?, error_message = '',
        imported_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).run(fullPath, docDate, hash, JSON.stringify(summary), "每日积累手工写入", doc.id);
  }

  const knowledgeStmt = db.prepare(`
    INSERT INTO knowledge_items
      (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `);
  const knowledgeForSql = [];
  for (const item of knowledge) {
    const fingerprint = knowledgeFingerprint(item);
    const prior = priorMemory.get(fingerprint)
      || priorMemory.get(`${toText(item.category)}|${toText(item.title)}`)
      || { memory_status: "learning", last_reviewed_at: "" };
    const row = {
      order: toInt(item.order),
      category: toText(item.category),
      title: toText(item.title),
      body: toText(item.body),
      tags: toText(item.tags),
      topic: toText(item.topic),
      kind: toText(item.kind),
      fingerprint,
      memory_status: prior.memory_status,
      last_reviewed_at: prior.last_reviewed_at
    };
    knowledgeStmt.run(
      doc.id,
      row.order,
      row.category,
      row.title,
      row.body,
      row.tags,
      row.topic,
      row.kind,
      row.fingerprint,
      row.memory_status,
      row.last_reviewed_at
    );
    knowledgeForSql.push(row);
  }

  const questionStmt = db.prepare(`
    INSERT INTO practice_questions
      (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
    VALUES (?, ?, 'digest', ?, ?, ?, ?, ?, ?, ?)
  `);
  const questionsForSql = [];
  questions.forEach((item, index) => {
    const row = {
      order: index + 1,
      question_type: toText(item.question_type) || "单选",
      prompt: toText(item.prompt),
      options: item.options || [],
      answer: toText(item.answer),
      explanation: toText(item.explanation),
      tags: toText(item.tags) || "常识判断"
    };
    questionStmt.run(
      doc.id,
      row.order,
      row.question_type,
      row.prompt,
      JSON.stringify(row.options),
      row.answer,
      row.explanation,
      row.tags,
      docDate
    );
    questionsForSql.push(row);
  });

  const sqlPath = writeImportSqlFile(SQL_IMPORT_DIR, {
    kind: "daily-digest",
    filename,
    fullPath,
    docDate,
    hash,
    summary,
    aiValidation: "每日积累手工写入",
    articles: [],
    questions: questionsForSql,
    knowledge: knowledgeForSql,
    questionSourceType: "digest",
    clearQuestionsAll: true
  });

  return {
    filename,
    doc_date: docDate,
    summary,
    sql_path: path.relative(ROOT, sqlPath),
    parsed: {
      idioms: parsed.idioms,
      quotes: parsed.quotes,
      questions: parsed.questions,
      warnings: parsed.warnings
    },
    state: getState()
  };
}

function upsertFailedDocument(filename, fullPath, hash, message) {
  db.prepare(`
    INSERT INTO source_documents
      (filename, file_path, file_hash, status, error_message, updated_at)
    VALUES (?, ?, ?, 'parse_error', ?, CURRENT_TIMESTAMP)
    ON CONFLICT(filename) DO UPDATE SET
      file_path = excluded.file_path,
      file_hash = excluded.file_hash,
      status = 'parse_error',
      error_message = excluded.error_message,
      updated_at = CURRENT_TIMESTAMP
  `).run(filename, fullPath, hash, message);
}

function parseDocx(fullPath) {
  return new Promise((resolve, reject) => {
    execFile(PYTHON, [PARSER_PATH, fullPath], { maxBuffer: 10 * 1024 * 1024 }, (error, stdout, stderr) => {
      if (error) {
        reject(new Error((stderr || error.message).trim()));
        return;
      }
      try {
        resolve(JSON.parse(stdout));
      } catch (parseError) {
        reject(new Error(`解析脚本返回非 JSON：${parseError.message}`));
      }
    });
  });
}

async function validateParsedDocument(parsed) {
  if (!hasAiKey()) {
    const warnings = parsed.warnings?.length ? `；规则提示：${parsed.warnings.join("；")}` : "";
    return `未配置 DeepSeek key，已完成本地规则解析${warnings}`;
  }
  const prompt = [
    "请校验这份每日时政 Word 的规则解析结果，只输出简短中文结论。",
    "重点检查：热点材料标题是否明显异常、题目数量和参考答案是否一致、是否有常识/成语/词语条目可能漏切。",
    JSON.stringify({
      filename: parsed.filename,
      doc_date: parsed.doc_date,
      articles: (parsed.articles || []).map(x => x.title),
      question_count: (parsed.questions || []).length,
      answers: (parsed.questions || []).map(x => x.answer),
      knowledge: (parsed.knowledge || []).map(x => `${x.category}:${x.title}`),
      warnings: parsed.warnings || []
    }, null, 2)
  ].join("\n");
  return requestAiText([
    { role: "system", content: "你是严谨的数据导入校验员，只指出问题和可用标签，不改写原文。" },
    { role: "user", content: prompt }
  ], { max_tokens: 500 });
}

async function generateAiQuestions(body) {
  const documentId = Number(body.document_id || 0) || null;
  const docDate = toText(body.doc_date);
  const count = Math.min(Math.max(Number(body.count || 5), 1), 10);
  const articles = documentId
    ? getMaterials().filter(item => item.document_id === documentId)
    : docDate
      ? getMaterials().filter(item => item.doc_date === docDate)
    : getMaterials().slice(0, 8);
  if (!articles.length) throw httpError("没有可用于出题的时政材料，请先导入 Word。", 400);

  const prompt = [
    `请基于以下时政材料生成 ${count} 道公考风格选择题。`,
    "只输出 JSON 数组，每项字段：question_type（单选或多选）、prompt、options（[{key,text}]）、answer、explanation、tags。",
    "题目必须来自材料事实，不要编造材料外事实。",
    JSON.stringify(articles.map(item => ({ title: item.title, body: item.body.slice(0, 800), source: item.source })), null, 2)
  ].join("\n");
  const content = await requestAiText([
    { role: "system", content: "你是公考时政命题老师，输出必须是可解析 JSON。" },
    { role: "user", content: prompt }
  ], { max_tokens: 1800, temperature: 0.2 });
  const generated = parseJsonArrayFromText(content);
  const stmt = db.prepare(`
    INSERT INTO practice_questions
      (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
    VALUES (?, ?, 'ai_generated', ?, ?, ?, ?, ?, ?, ?)
  `);
  generated.forEach((item, index) => {
    stmt.run(
      documentId,
      index + 1,
      toText(item.question_type) || "单选",
      requiredText(item.prompt, "AI 题目缺少题干"),
      JSON.stringify(Array.isArray(item.options) ? item.options : []),
      toText(item.answer),
      toText(item.explanation),
      Array.isArray(item.tags) ? item.tags.join(",") : toText(item.tags),
      docDate || (articles[0]?.doc_date || "")
    );
  });
  return { generated_count: generated.length, questions: getQuestions() };
}

async function reviewShenlun(body) {
  const maxScore = Number(body.max_score || 20) || 20;
  const promptText = requiredText(body.prompt, "申论题干不能为空");
  const materials = requiredText(body.materials, "申论材料不能为空");
  const answer = requiredText(body.answer, "作答内容不能为空");
  const prompt = [
    "请按公务员申论阅卷标准批改。输出必须包含：",
    `1. 总分（满分 ${maxScore} 分）；2. 分项评分；3. 命中得分点；4. 漏点；5. 表达和结构问题；6. 优化答案。`,
    "批改必须基于题干和材料，不要凭空增加材料外要点。",
    `题型：${toText(body.question_type) || "未指定"}`,
    `题干：${promptText}`,
    `材料：${materials}`,
    `考生作答：${answer}`
  ].join("\n\n");
  const content = await requestAiText([
    { role: "system", content: "你是严格、务实的申论阅卷老师，按材料找点，按题型评分。" },
    { role: "user", content: prompt }
  ], { max_tokens: 2000, temperature: 0.2 });

  const score = content.match(/(?:总分|得分)[：:\s]*([0-9]+(?:\.[0-9]+)?\s*\/\s*[0-9]+|[0-9]+(?:\.[0-9]+)?\s*分?)/)?.[1] || "";
  const result = db.prepare(`
    INSERT INTO shenlun_reviews
      (question_type, prompt, materials, answer, max_score, score, key_points, missing_points, polished_answer, ai_raw)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `).run(
    toText(body.question_type),
    promptText,
    materials,
    answer,
    maxScore,
    score,
    extractSection(content, ["命中得分点", "得分点"]),
    extractSection(content, ["漏点", "遗漏"]),
    extractSection(content, ["优化答案", "修改稿"]),
    content
  );
  return { id: Number(result.lastInsertRowid), review: getShenlunReviews()[0] };
}

async function chatWithContext(body) {
  if (!hasAiKey()) throw httpError("请先在 .env 里填写 DEEPSEEK_API_KEY", 400);
  const message = requiredText(body.message, "消息不能为空");
  const context = buildSelectedContext(body.context || {});
  let sessionId = Number(body.session_id || 0);
  if (!sessionId) {
    const result = db.prepare("INSERT INTO chat_sessions (title, context_json) VALUES (?, ?)").run(message.slice(0, 30), JSON.stringify(body.context || {}));
    sessionId = Number(result.lastInsertRowid);
  }
  db.prepare("INSERT INTO chat_messages (session_id, role, content) VALUES (?, 'user', ?)").run(sessionId, message);
  const answer = await requestAiText([
    { role: "system", content: "你是本地公考学习助手。优先使用用户勾选的资料上下文回答，资料不足时说明不足。" },
    { role: "user", content: `${context}\n\n用户问题：${message}` }
  ], { max_tokens: 1600 });
  db.prepare("INSERT INTO chat_messages (session_id, role, content) VALUES (?, 'assistant', ?)").run(sessionId, answer);
  db.prepare("UPDATE chat_sessions SET updated_at = CURRENT_TIMESTAMP WHERE id = ?").run(sessionId);
  return { session_id: sessionId, answer, sessions: getChatSessions() };
}

function getState() {
  const dailyLogs = db.prepare("SELECT * FROM daily_logs ORDER BY log_date DESC").all().map(row => ({
    ...row,
    reasoning: safeJson(row.reasoning_json, {})
  }));
  const wrongQuestions = db.prepare("SELECT * FROM wrong_questions ORDER BY updated_at DESC, id DESC").all();
  const currentAffairsDocs = db.prepare("SELECT * FROM current_affairs_docs ORDER BY doc_date DESC, filename DESC").all();
  const aiReviews = db.prepare("SELECT * FROM ai_reviews ORDER BY created_at DESC, id DESC LIMIT 20").all();
  const documents = getDocuments();
  const materials = getMaterials();
  const questions = getQuestions();
  const knowledge = getKnowledge();
  const shenlunReviews = getShenlunReviews();
  return {
    daily_logs: dailyLogs,
    wrong_questions: wrongQuestions,
    current_affairs_docs: currentAffairsDocs,
    ai_reviews: aiReviews,
    documents,
    existing_docx: listExistingDocx(),
    materials,
    questions,
    knowledge,
    shenlun_reviews: shenlunReviews,
    chat_sessions: getChatSessions(),
    stats: buildStats(dailyLogs, wrongQuestions, currentAffairsDocs, { documents, materials, questions, knowledge, shenlunReviews })
  };
}

function getDocumentsState() {
  return { documents: getDocuments(), existing_docx: listExistingDocx() };
}

function getDocuments() {
  return db.prepare("SELECT * FROM source_documents ORDER BY doc_date DESC, filename DESC").all().map(row => ({
    ...row,
    parse_summary: safeJson(row.parse_summary, {})
  }));
}

function getMaterials() {
  return db.prepare(`
    SELECT a.*, d.filename
    FROM affairs_articles a
    JOIN source_documents d ON d.id = a.document_id
    ORDER BY a.doc_date DESC, a.article_order ASC
  `).all();
}

function getQuestions() {
  return db.prepare(`
    SELECT q.*, d.filename
    FROM practice_questions q
    LEFT JOIN source_documents d ON d.id = q.document_id
    ORDER BY q.created_at DESC, q.document_id DESC, q.question_order ASC
  `).all().map(row => ({ ...row, options: safeJson(row.options_json, []) }));
}

function getKnowledge() {
  return db.prepare(`
    SELECT k.*, d.filename, d.doc_date
    FROM knowledge_items k
    JOIN source_documents d ON d.id = k.document_id
    ORDER BY d.doc_date DESC, k.item_order ASC
  `).all();
}

function getShenlunReviews() {
  return db.prepare("SELECT * FROM shenlun_reviews ORDER BY created_at DESC, id DESC").all();
}

function getChatSessions() {
  const sessions = db.prepare("SELECT * FROM chat_sessions ORDER BY updated_at DESC, id DESC").all();
  const stmt = db.prepare("SELECT * FROM chat_messages WHERE session_id = ? ORDER BY id ASC");
  return sessions.map(session => ({
    ...session,
    context: safeJson(session.context_json, {}),
    messages: stmt.all(session.id)
  }));
}

function buildStats(dailyLogs, wrongQuestions, currentAffairsDocs, extra) {
  const today = formatDate(new Date());
  const last7 = dailyLogs.filter(log => daysBetween(log.log_date, today) >= 0 && daysBetween(log.log_date, today) < 7);
  let correct = 0;
  let wrong = 0;
  const moduleWrong = new Map();
  for (const log of last7) {
    for (const item of Object.values(log.reasoning || {})) {
      correct += toInt(item.correct);
      wrong += toInt(item.wrong);
    }
  }
  for (const question of wrongQuestions) moduleWrong.set(question.module, (moduleWrong.get(question.module) || 0) + 1);
  const weakest = [...moduleWrong.entries()].sort((a, b) => b[1] - a[1])[0];

  const answered = extra.questions.filter(q => q.answer_status === "correct" || q.answer_status === "wrong");
  const quizCorrect = answered.filter(q => q.answer_status === "correct").length;
  const masteryTotal = extra.knowledge.length;
  const masteryDone = extra.knowledge.filter(item => item.memory_status === "mastered").length;
  const byCategory = {};
  for (const item of extra.knowledge) {
    const key = item.category || "其他";
    byCategory[key] = (byCategory[key] || 0) + 1;
  }
  const dates = [...new Set(extra.documents.map(doc => doc.doc_date).filter(Boolean))].sort();
  const recentDates = dates.slice(-14);
  const volumeByDate = recentDates.map(date => {
    const docIds = new Set(extra.documents.filter(doc => doc.doc_date === date).map(doc => doc.id));
    return {
      date,
      materials: extra.materials.filter(item => docIds.has(item.document_id)).length,
      questions: extra.questions.filter(item => docIds.has(item.document_id)).length,
      knowledge: extra.knowledge.filter(item => docIds.has(item.document_id)).length
    };
  });

  return {
    streak_days: calculateStreak(dailyLogs),
    seven_day_accuracy: correct + wrong > 0 ? Math.round((correct / (correct + wrong)) * 100) : null,
    weakest_module: weakest ? weakest[0] : "暂无",
    pending_review_count: wrongQuestions.filter(q => q.review_status !== "mastered").length,
    unread_affairs_count: currentAffairsDocs.filter(doc => doc.review_status !== "done").length,
    imported_documents: extra.documents.length,
    material_count: extra.materials.length,
    question_count: extra.questions.length,
    knowledge_count: extra.knowledge.length,
    idiom_count: extra.knowledge.filter(isIdiomItem).length,
    common_sense_count: extra.knowledge.filter(isMemoryItem).length,
    memory_learning_count: extra.knowledge.filter(item => isMemoryItem(item) && item.memory_status !== "mastered").length,
    memory_mastered_count: masteryDone,
    mastery_rate: masteryTotal ? Math.round((masteryDone / masteryTotal) * 100) : 0,
    quiz_answered: answered.length,
    quiz_accuracy: answered.length ? Math.round((quizCorrect / answered.length) * 100) : null,
    knowledge_by_category: byCategory,
    volume_by_date: volumeByDate,
    shenlun_review_count: extra.shenlunReviews.length,
    today
  };
}

function isIdiomItem(item) {
  const cat = String(item.category || "").trim();
  const kind = String(item.kind || "").trim();
  if (kind === "idiom" || kind === "term") return true;
  return cat === "成语" || cat === "词语" || cat === "辨析";
}

function isMemoryItem(item) {
  return !isIdiomItem(item);
}

function scanCurrentAffairsDocs() {
  const files = listExistingDocx();
  const stmt = db.prepare(`
    INSERT INTO current_affairs_docs (filename, doc_date, size_bytes, mtime_ms, updated_at)
    VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)
    ON CONFLICT(filename) DO UPDATE SET
      doc_date = excluded.doc_date,
      size_bytes = excluded.size_bytes,
      mtime_ms = excluded.mtime_ms,
      updated_at = CURRENT_TIMESTAMP
  `);
  for (const item of files) stmt.run(item.filename, item.doc_date, item.size_bytes, item.mtime_ms);
}

function listExistingDocx() {
  return fs.readdirSync(CONTENT_ROOT)
    .filter(name => /^每日时政\d{1,2}\.\d{1,2}\.docx$/i.test(name))
    .map(filename => {
      const fullPath = path.join(CONTENT_ROOT, filename);
      const stat = fs.statSync(fullPath);
      const imported = db.prepare("SELECT id, status FROM source_documents WHERE filename = ?").get(filename);
      return {
        filename,
        doc_date: dateFromFilename(filename) || formatDate(stat.mtime),
        size_bytes: stat.size,
        mtime_ms: Math.round(stat.mtimeMs),
        imported_id: imported?.id || null,
        imported_status: imported?.status || ""
      };
    })
    .sort((a, b) => b.doc_date.localeCompare(a.doc_date) || b.filename.localeCompare(a.filename));
}

async function requestAiText(messages, options = {}) {
  const key = env.DEEPSEEK_API_KEY || process.env.DEEPSEEK_API_KEY;
  if (!hasAiKey()) throw httpError("请先在 .env 里填写 DEEPSEEK_API_KEY", 400);
  const baseUrl = (env.DEEPSEEK_BASE_URL || "https://api.deepseek.com").replace(/\/+$/, "");
  const model = env.DEEPSEEK_MODEL || "deepseek-v4-flash";
  const response = await fetch(`${baseUrl}/chat/completions`, {
    method: "POST",
    headers: { "Authorization": `Bearer ${key}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      model,
      messages,
      temperature: options.temperature ?? 0.3,
      max_tokens: options.max_tokens || 1000
    })
  });
  if (!response.ok) {
    const text = await response.text();
    throw httpError(`DeepSeek 调用失败：${response.status} ${text.slice(0, 200)}`, 502);
  }
  const payload = await response.json();
  return payload.choices?.[0]?.message?.content?.trim() || "模型没有返回内容。";
}

function hasAiKey() {
  const key = env.DEEPSEEK_API_KEY || process.env.DEEPSEEK_API_KEY;
  return Boolean(key && key !== "你的key" && key !== "请填入你的DeepSeek key");
}

function buildSelectedContext(context) {
  const pieces = [];
  const documentIds = toIdList(context.document_ids);
  const questionIds = toIdList(context.question_ids);
  const knowledgeIds = toIdList(context.knowledge_ids);
  const shenlunIds = toIdList(context.shenlun_ids);

  if (documentIds.length) {
    const ids = placeholders(documentIds);
    pieces.push("【时政材料】");
    pieces.push(...db.prepare(`
      SELECT a.title, a.body, a.source, d.filename
      FROM affairs_articles a JOIN source_documents d ON d.id = a.document_id
      WHERE a.document_id IN (${ids}) ORDER BY a.doc_date DESC, a.article_order ASC
    `).all(...documentIds).map(x => `${x.filename}｜${x.title}\n${x.body.slice(0, 1200)}\n来源：${x.source}`));
  }
  if (questionIds.length) {
    const ids = placeholders(questionIds);
    pieces.push("【题目】");
    pieces.push(...db.prepare(`SELECT prompt, options_json, answer, explanation FROM practice_questions WHERE id IN (${ids})`).all(...questionIds)
      .map(x => `${x.prompt}\n选项：${JSON.stringify(safeJson(x.options_json, []))}\n答案：${x.answer}\n解析：${x.explanation}`));
  }
  if (knowledgeIds.length) {
    const ids = placeholders(knowledgeIds);
    pieces.push("【常识/成语】");
    pieces.push(...db.prepare(`SELECT category, title, body FROM knowledge_items WHERE id IN (${ids})`).all(...knowledgeIds)
      .map(x => `${x.category}｜${x.title}\n${x.body.slice(0, 1200)}`));
  }
  if (shenlunIds.length) {
    const ids = placeholders(shenlunIds);
    pieces.push("【申论批改记录】");
    pieces.push(...db.prepare(`SELECT prompt, answer, ai_raw FROM shenlun_reviews WHERE id IN (${ids})`).all(...shenlunIds)
      .map(x => `题干：${x.prompt}\n作答：${x.answer}\n批改：${x.ai_raw.slice(0, 1200)}`));
  }
  return pieces.length ? pieces.join("\n\n") : "【资料上下文】用户未选择资料。";
}

function buildAiPrompt(state) {
  const latestLogs = state.daily_logs.slice(0, 7).map(log => ({
    日期: log.log_date,
    分钟: log.study_minutes,
    行测: log.reasoning,
    申论: log.essay_note,
    时政: log.affairs_note
  }));
  const recentWrong = state.wrong_questions.slice(0, 12).map(q => ({
    模块: q.module,
    题型: q.question_type,
    错因: q.reason,
    状态: q.review_status,
    标签: q.tags
  }));
  const unreadAffairs = state.current_affairs_docs.filter(doc => doc.review_status !== "done").slice(0, 12);
  return [
    "请根据下面的本地学习数据，输出今日复盘、明日安排、错题二刷建议和时政复习提醒。",
    `数据看板：${JSON.stringify(state.stats, null, 2)}`,
    `近7日打卡：${JSON.stringify(latestLogs, null, 2)}`,
    `近期错题：${JSON.stringify(recentWrong, null, 2)}`,
    `未完成时政：${JSON.stringify(unreadAffairs, null, 2)}`
  ].join("\n");
}

function serveStatic(req, res, url) {
  let pathname = decodeURIComponent(url.pathname);
  if (pathname === "/") pathname = "/index.html";
  const fullPath = path.normalize(path.join(PUBLIC_DIR, pathname));
  if (!fullPath.startsWith(PUBLIC_DIR)) return sendText(res, 403, "Forbidden");
  if (!fs.existsSync(fullPath) || fs.statSync(fullPath).isDirectory()) return sendText(res, 404, "Not found");
  res.writeHead(200, { "Content-Type": mimeType(fullPath), "Cache-Control": "no-store" });
  fs.createReadStream(fullPath).pipe(res);
}

function readJson(req) {
  return new Promise((resolve, reject) => {
    let data = "";
    req.on("data", chunk => {
      data += chunk;
      if (data.length > 1_000_000) {
        reject(httpError("请求体过大", 413));
        req.destroy();
      }
    });
    req.on("end", () => {
      if (!data) return resolve({});
      try {
        resolve(JSON.parse(data));
      } catch {
        reject(httpError("JSON 格式错误", 400));
      }
    });
    req.on("error", reject);
  });
}

function readBuffer(req, maxBytes) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    let size = 0;
    req.on("data", chunk => {
      size += chunk.length;
      if (size > maxBytes) {
        reject(httpError("文件过大", 413));
        req.destroy();
        return;
      }
      chunks.push(chunk);
    });
    req.on("end", () => resolve(Buffer.concat(chunks)));
    req.on("error", reject);
  });
}

function parseMultipart(buffer, boundary) {
  const parts = [];
  const delimiter = Buffer.from(`--${boundary}`);
  let cursor = buffer.indexOf(delimiter);
  while (cursor !== -1) {
    cursor += delimiter.length;
    if (buffer.slice(cursor, cursor + 2).toString() === "--") break;
    if (buffer.slice(cursor, cursor + 2).toString() === "\r\n") cursor += 2;
    const next = buffer.indexOf(delimiter, cursor);
    if (next === -1) break;
    let part = buffer.slice(cursor, next);
    if (part.slice(-2).toString() === "\r\n") part = part.slice(0, -2);
    const headerEnd = part.indexOf(Buffer.from("\r\n\r\n"));
    if (headerEnd !== -1) {
      const headerText = part.slice(0, headerEnd).toString("utf8");
      const content = part.slice(headerEnd + 4);
      const name = headerText.match(/name="([^"]+)"/)?.[1] || "";
      const filename = headerText.match(/filename="([^"]*)"/)?.[1] || "";
      parts.push({ name, filename, content });
    }
    cursor = next;
  }
  return parts;
}

function loadEnv(file) {
  if (!fs.existsSync(file)) return {};
  const result = {};
  for (const line of fs.readFileSync(file, "utf8").split(/\r?\n/)) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith("#")) continue;
    const index = trimmed.indexOf("=");
    if (index === -1) continue;
    const key = trimmed.slice(0, index).trim();
    let value = trimmed.slice(index + 1).trim();
    if ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'"))) value = value.slice(1, -1);
    result[key] = value;
  }
  return result;
}

function buildCsvExport(state) {
  return [
    csvSection("daily_logs", ["log_date", "study_minutes", "reasoning", "essay_note", "affairs_note"], state.daily_logs),
    csvSection("wrong_questions", ["id", "module", "question_type", "prompt", "correct_answer", "my_answer", "reason", "tags", "review_status"], state.wrong_questions),
    csvSection("source_documents", ["id", "filename", "doc_date", "status", "ai_validation"], state.documents),
    csvSection("affairs_articles", ["id", "filename", "title", "body", "source", "tags"], state.materials),
    csvSection("practice_questions", ["id", "filename", "source_type", "question_type", "prompt", "answer", "explanation", "tags"], state.questions),
    csvSection("knowledge_items", ["id", "filename", "category", "title", "body", "tags"], state.knowledge),
    csvSection("shenlun_reviews", ["id", "question_type", "prompt", "score", "ai_raw", "created_at"], state.shenlun_reviews)
  ].join("\n\n");
}

function csvSection(name, columns, rows) {
  return [`# ${name}`, columns.join(","), ...rows.map(row => columns.map(col => csvCell(typeof row[col] === "object" ? JSON.stringify(row[col]) : row[col])).join(","))].join("\n");
}

function sendJson(res, status, payload) {
  res.writeHead(status, { "Content-Type": "application/json; charset=utf-8" });
  res.end(JSON.stringify(payload));
}

function sendText(res, status, payload) {
  res.writeHead(status, { "Content-Type": "text/plain; charset=utf-8" });
  res.end(payload);
}

function sendDownload(res, type, filename, payload) {
  res.writeHead(200, { "Content-Type": type, "Content-Disposition": `attachment; filename="${filename}"` });
  res.end(payload);
}

function mimeType(file) {
  return {
    ".html": "text/html; charset=utf-8",
    ".css": "text/css; charset=utf-8",
    ".js": "text/javascript; charset=utf-8",
    ".json": "application/json; charset=utf-8"
  }[path.extname(file)] || "application/octet-stream";
}

function calculateStreak(dailyLogs) {
  const logged = new Set(dailyLogs.filter(log => log.study_minutes > 0 || log.essay_note || log.affairs_note).map(log => log.log_date));
  let count = 0;
  const cursor = new Date();
  while (logged.has(formatDate(cursor))) {
    count += 1;
    cursor.setDate(cursor.getDate() - 1);
  }
  return count;
}

function normalizeReasoning(value) {
  const modules = ["言语理解", "数量关系", "判断推理", "资料分析", "常识判断"];
  const source = value && typeof value === "object" ? value : {};
  const result = {};
  for (const module of modules) result[module] = { correct: toInt(source[module]?.correct), wrong: toInt(source[module]?.wrong) };
  return result;
}

function formatDate(date) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
}

function dateFromFilename(filename) {
  const match = filename.match(/^每日时政(\d{1,2})\.(\d{1,2})\.docx$/i);
  if (!match) return "";
  return `${new Date().getFullYear()}-${String(Number(match[1])).padStart(2, "0")}-${String(Number(match[2])).padStart(2, "0")}`;
}

function timestampForFile() {
  return new Date().toISOString().replace(/[-:]/g, "").replace(/\..+/, "").replace("T", "-");
}

function daysBetween(dateText, todayText) {
  return Math.floor((new Date(`${todayText}T00:00:00`) - new Date(`${dateText}T00:00:00`)) / 86400000);
}

function safeJson(text, fallback) {
  try {
    return JSON.parse(text);
  } catch {
    return fallback;
  }
}

function parseJsonArrayFromText(text) {
  const fenced = text.match(/```(?:json)?\s*([\s\S]*?)```/i)?.[1];
  const raw = fenced || text.slice(text.indexOf("["), text.lastIndexOf("]") + 1);
  const parsed = JSON.parse(raw);
  if (!Array.isArray(parsed)) throw httpError("AI 返回不是 JSON 数组", 502);
  return parsed;
}

function extractSection(text, labels) {
  const lines = text.split(/\r?\n/);
  const start = lines.findIndex(line => labels.some(label => line.includes(label)));
  if (start === -1) return "";
  const collected = [];
  for (let i = start; i < lines.length; i++) {
    if (i > start && /^#{1,6}\s|^\d+[\.、]\s*|^[一二三四五六七八九十]+[、.]/.test(lines[i])) break;
    collected.push(lines[i]);
  }
  return collected.join("\n").trim();
}

function safeDocxFilename(filename) {
  const base = path.basename(String(filename || ""));
  if (!/^每日时政\d{1,2}\.\d{1,2}\.docx$/i.test(base)) throw httpError("文件名必须类似：每日时政8.10.docx", 400);
  return base;
}

function requireDate(value) {
  const text = requiredText(value, "日期不能为空");
  if (!/^\d{4}-\d{2}-\d{2}$/.test(text)) throw httpError("日期格式必须是 YYYY-MM-DD", 400);
  return text;
}

function requiredText(value, message) {
  const text = toText(value);
  if (!text) throw httpError(message, 400);
  return text;
}

function optionalText(value) {
  return value === undefined ? null : toText(value);
}

function toText(value) {
  return String(value ?? "").trim();
}

function toInt(value) {
  const number = Number(value);
  return Number.isFinite(number) && number > 0 ? Math.round(number) : 0;
}

function validStatus(value, allowed, fallback) {
  const text = toText(value) || fallback;
  return allowed.includes(text) ? text : fallback;
}

function csvCell(value) {
  return `"${String(value ?? "").replaceAll('"', '""')}"`;
}

function toIdList(value) {
  return Array.isArray(value) ? value.map(Number).filter(Number.isFinite) : [];
}

function placeholders(values) {
  return values.map(() => "?").join(",");
}

function httpError(message, status) {
  const error = new Error(message);
  error.status = status;
  return error;
}

function ensureColumn(table, column, definition) {
  const columns = db.prepare(`PRAGMA table_info(${table})`).all().map(row => row.name);
  if (!columns.includes(column)) {
    db.exec(`ALTER TABLE ${table} ADD COLUMN ${column} ${definition}`);
  }
}

function openBrowser(url) {
  const platform = process.platform;
  if (platform === "darwin") exec(`open "${url}"`);
  else if (platform === "win32") exec(`cmd /c start "" "${url}"`);
  else exec(`xdg-open "${url}"`);
}
