#!/usr/bin/env bash
# 仅回放 sql/imports → SQLite（不启服务）。服务运行中请先 stop。
set -euo pipefail
cd "$(dirname "$0")/.."

PID_FILE="data/server.pid"
if [ -f "$PID_FILE" ]; then
  OLD_PID="$(cat "$PID_FILE" 2>/dev/null || true)"
  if [ -n "${OLD_PID:-}" ] && kill -0 "$OLD_PID" 2>/dev/null; then
    echo "服务正在运行（PID $OLD_PID）。请先：bash linux/stop.sh"
    exit 1
  fi
fi

if ! command -v node >/dev/null 2>&1; then
  echo "未找到 Node.js（建议 22+）。"
  exit 1
fi

mkdir -p data
node server.js --init-db-only
node scripts/apply_import_sql.js
echo "完成。需要启动服务时：bash linux/start.sh"
