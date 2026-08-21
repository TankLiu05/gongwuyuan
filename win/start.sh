#!/usr/bin/env bash
# Windows Git Bash 启动脚本（Electron 桌面窗；关窗即停）
cd "$(dirname "$0")/.."

if ! command -v node >/dev/null 2>&1; then
  echo "未找到 Node.js，请先安装（建议 22+）并确保 node 在 PATH 中。"
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "未找到 npm，请随 Node.js 一并安装。"
  exit 1
fi

if [ ! -d node_modules/electron ]; then
  echo "首次使用桌面版，正在安装依赖（npm install）…"
  ELECTRON_MIRROR="${ELECTRON_MIRROR:-https://npmmirror.com/mirrors/electron/}" npm install
  if [ $? -ne 0 ]; then
    echo "npm install 失败，请检查网络后重试。"
    exit 1
  fi
fi

echo "正在启动公考学习追踪（桌面版）…"
echo "关闭窗口右上角叉号即可停止服务。"
npm start
