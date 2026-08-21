#!/usr/bin/env bash
# Windows Git Bash 启动脚本
cd "$(dirname "$0")/.."

if ! command -v node >/dev/null 2>&1; then
  echo "未找到 Node.js，请先安装并确保 node 在 PATH 中。"
  exit 1
fi

echo "正在启动公考学习追踪..."
node server.js --open
