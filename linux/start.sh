#!/usr/bin/env bash
# Linux 服务器网页端启动（后台运行，浏览器访问）
set -euo pipefail
cd "$(dirname "$0")/.."

PORT="${PORT:-4783}"
# 服务器对外访问需监听 0.0.0.0；本机仅本地可改为 127.0.0.1
HOST="${HOST:-0.0.0.0}"
PID_FILE="data/server.pid"
LOG_FILE="data/server.log"

if ! command -v node >/dev/null 2>&1; then
  echo "未找到 Node.js，请先安装（建议 22+）并确保 node 在 PATH 中。"
  exit 1
fi

mkdir -p data

if [ -f "$PID_FILE" ]; then
  OLD_PID="$(cat "$PID_FILE" 2>/dev/null || true)"
  if [ -n "${OLD_PID:-}" ] && kill -0 "$OLD_PID" 2>/dev/null; then
    echo "已在运行（PID $OLD_PID）。访问：http://服务器IP:$PORT"
    echo "如需重启，先执行：bash linux/stop.sh"
    exit 0
  fi
  rm -f "$PID_FILE"
fi

# 端口已被占用时提示
if command -v ss >/dev/null 2>&1; then
  if ss -ltn "sport = :$PORT" 2>/dev/null | grep -q ":$PORT"; then
    echo "端口 $PORT 已被占用，请先 bash linux/stop.sh 或更换 PORT。"
    exit 1
  fi
elif command -v lsof >/dev/null 2>&1; then
  if lsof -ti tcp:"$PORT" >/dev/null 2>&1; then
    echo "端口 $PORT 已被占用，请先 bash linux/stop.sh 或更换 PORT。"
    exit 1
  fi
fi

echo "正在后台启动公考学习追踪（网页端）…"
echo "  HOST=$HOST  PORT=$PORT"
echo "  日志：$LOG_FILE"

nohup env HOST="$HOST" PORT="$PORT" node server.js >>"$LOG_FILE" 2>&1 &
echo $! >"$PID_FILE"

sleep 0.5
if kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  echo "已启动 PID $(cat "$PID_FILE")"
  echo "浏览器访问：http://服务器IP:$PORT  （本机可用 http://127.0.0.1:$PORT）"
  echo "停止：bash linux/stop.sh"
else
  echo "启动失败，请查看日志：$LOG_FILE"
  rm -f "$PID_FILE"
  exit 1
fi
