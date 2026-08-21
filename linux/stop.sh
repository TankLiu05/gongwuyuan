#!/usr/bin/env bash
# Linux 服务器网页端停止
set -euo pipefail
cd "$(dirname "$0")/.."

PORT="${PORT:-4783}"
PID_FILE="data/server.pid"

stop_pid() {
  local pid="$1"
  [ -n "$pid" ] || return 0
  if kill -0 "$pid" 2>/dev/null; then
    echo "正在停止 PID $pid …"
    kill "$pid" 2>/dev/null || true
    for _ in 1 2 3 4 5; do
      kill -0 "$pid" 2>/dev/null || break
      sleep 0.3
    done
    if kill -0 "$pid" 2>/dev/null; then
      kill -9 "$pid" 2>/dev/null || true
    fi
  fi
}

STOPPED=0

if [ -f "$PID_FILE" ]; then
  PID="$(cat "$PID_FILE" 2>/dev/null || true)"
  if [ -n "${PID:-}" ]; then
    stop_pid "$PID"
    STOPPED=1
  fi
  rm -f "$PID_FILE"
fi

# 兜底：按端口清理残留
PIDS=""
if command -v lsof >/dev/null 2>&1; then
  PIDS="$(lsof -ti tcp:"$PORT" 2>/dev/null || true)"
elif command -v ss >/dev/null 2>&1 && command -v fuser >/dev/null 2>&1; then
  PIDS="$(fuser "${PORT}/tcp" 2>/dev/null | tr -s ' ' '\n' | grep -E '^[0-9]+$' || true)"
fi

if [ -n "${PIDS:-}" ]; then
  for pid in $PIDS; do
    stop_pid "$pid"
    STOPPED=1
  done
fi

if [ "$STOPPED" -eq 1 ]; then
  echo "已停止。"
else
  echo "公考学习追踪没有在运行。"
fi
