#!/usr/bin/env bash
# Linux 服务器网页端启动（后台运行，浏览器访问）
# 每次启动都会：停旧进程 → 回放 sql/imports → 再启动
set -euo pipefail
cd "$(dirname "$0")/.."

PORT="${PORT:-4783}"
# 服务器对外访问需监听 0.0.0.0；本机仅本地可改为 127.0.0.1
HOST="${HOST:-0.0.0.0}"
PID_FILE="data/server.pid"
LOG_FILE="data/server.log"
APPLY_SQL="${APPLY_SQL:-1}"

if ! command -v node >/dev/null 2>&1; then
  echo "未找到 Node.js，请先安装（建议 22+）并确保 node 在 PATH 中。"
  exit 1
fi

mkdir -p data

# 先停旧进程，避免「已在运行」时跳过 SQL
if [ -x linux/stop.sh ]; then
  bash linux/stop.sh || true
else
  if [ -f "$PID_FILE" ]; then
    OLD_PID="$(cat "$PID_FILE" 2>/dev/null || true)"
    if [ -n "${OLD_PID:-}" ] && kill -0 "$OLD_PID" 2>/dev/null; then
      kill "$OLD_PID" 2>/dev/null || true
      sleep 0.5
    fi
    rm -f "$PID_FILE"
  fi
fi

# 端口仍被占用时再清一次
if command -v ss >/dev/null 2>&1; then
  if ss -ltn "sport = :$PORT" 2>/dev/null | grep -q ":$PORT"; then
    echo "端口 $PORT 仍被占用，尝试清理…"
    if command -v fuser >/dev/null 2>&1; then
      fuser -k "${PORT}/tcp" 2>/dev/null || true
    elif command -v lsof >/dev/null 2>&1; then
      lsof -ti tcp:"$PORT" | xargs -r kill 2>/dev/null || true
    fi
    sleep 0.5
  fi
fi

if [ "$APPLY_SQL" = "1" ]; then
  echo "======== 1/3 初始化表结构 ========"
  node server.js --init-db-only
  echo "======== 2/3 回放 sql/imports ========"
  SQL_COUNT="$(find sql/imports -maxdepth 1 -name '*.sql' 2>/dev/null | wc -l | tr -d ' ')"
  echo "找到 ${SQL_COUNT} 个 .sql 文件"
  if [ "${SQL_COUNT}" = "0" ]; then
    echo "警告：sql/imports 下没有 .sql，请确认已 git pull 且 SQL 已入库。"
  fi
  node scripts/apply_import_sql.js
  echo "======== 3/3 启动服务 ========"
else
  echo "已跳过 SQL 回放（APPLY_SQL=0）"
fi

echo "正在后台启动公考学习追踪（网页端）…"
echo "  HOST=$HOST  PORT=$PORT"
echo "  日志：$LOG_FILE"

nohup env HOST="$HOST" PORT="$PORT" node server.js >>"$LOG_FILE" 2>&1 &
echo $! >"$PID_FILE"

sleep 0.8
if kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  echo "已启动 PID $(cat "$PID_FILE")"
  echo "浏览器访问：http://服务器IP:$PORT  （本机可用 http://127.0.0.1:$PORT）"
  echo "停止：bash linux/stop.sh"
  # 简单校验库里是否有导入文档
  node -e "
    const { DatabaseSync } = require('node:sqlite');
    const db = new DatabaseSync('data/study.sqlite');
    const n = db.prepare('SELECT COUNT(*) AS c FROM source_documents').get().c;
    const k = db.prepare('SELECT COUNT(*) AS c FROM knowledge_items').get().c;
    const q = db.prepare('SELECT COUNT(*) AS c FROM practice_questions').get().c;
    console.log('库内统计：文档 ' + n + '，常识/词语 ' + k + '，题目 ' + q);
  " 2>/dev/null || true
else
  echo "启动失败，请查看日志：$LOG_FILE"
  rm -f "$PID_FILE"
  exit 1
fi
