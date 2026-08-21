#!/usr/bin/env node
/**
 * 按文件名顺序回放 sql/imports/*.sql，使 SQLite 与仓库内 SQL 一致。
 * 用法：node scripts/apply_import_sql.js
 * 建议先：node server.js --init-db-only
 */

const fs = require("node:fs");
const path = require("node:path");
const { DatabaseSync } = require("node:sqlite");

const ROOT = path.resolve(__dirname, "..");
const DB_PATH = path.join(ROOT, "data", "study.sqlite");
const SQL_DIR = path.join(ROOT, "sql", "imports");

function main() {
  if (!fs.existsSync(SQL_DIR)) {
    console.log(`无 SQL 目录：${SQL_DIR}，跳过。`);
    return;
  }

  const files = fs
    .readdirSync(SQL_DIR)
    .filter(name => name.endsWith(".sql"))
    .sort((a, b) => a.localeCompare(b, "en"));

  if (!files.length) {
    console.log("sql/imports 下没有 .sql 文件，跳过。");
    return;
  }

  fs.mkdirSync(path.dirname(DB_PATH), { recursive: true });
  const db = new DatabaseSync(DB_PATH);

  try {
    db.prepare("SELECT 1 FROM source_documents LIMIT 1").get();
  } catch {
    console.error("数据库表尚未初始化。请先执行：node server.js --init-db-only");
    process.exit(1);
  }

  let ok = 0;
  let failed = 0;
  for (const name of files) {
    const full = path.join(SQL_DIR, name);
    const sql = fs.readFileSync(full, "utf8");
    try {
      db.exec(sql);
      ok += 1;
      console.log(`✓ ${name}`);
    } catch (error) {
      failed += 1;
      console.error(`✗ ${name}: ${error.message}`);
    }
  }

  console.log(`SQL 回放完成：成功 ${ok}，失败 ${failed}，共 ${files.length}`);
  if (failed) process.exit(1);
}

main();
