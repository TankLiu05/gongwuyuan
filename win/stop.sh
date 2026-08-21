#!/usr/bin/env bash
# Windows Git Bash 停止脚本
PORT=4783
cd "$(dirname "$0")/.."

if command -v netstat >/dev/null 2>&1; then
  PIDS=$(netstat -ano 2>/dev/null | tr -d '\r' | awk -v p=":$PORT" '$0 ~ p && /LISTENING/ {print $NF}' | sort -u)
else
  echo "无法检测占用端口 $PORT 的进程。"
  exit 1
fi

if [ -z "$PIDS" ]; then
  echo "公考学习追踪没有在运行。"
else
  echo "正在停止公考学习追踪..."
  echo "$PIDS" | while read -r pid; do
    [ -n "$pid" ] || continue
    taskkill //PID "$pid" //F >/dev/null 2>&1 || true
  done
  echo "已停止。"
fi
