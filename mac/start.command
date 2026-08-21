#!/bin/zsh
cd "$(dirname "$0")/.."

if ! command -v node >/dev/null 2>&1; then
  echo "未找到 Node.js，请先安装（建议 22+）并确保 node 在 PATH 中。"
  echo
  echo "可以关闭这个窗口。"
  read -r
  exit 1
fi

if [ ! -d node_modules/electron ]; then
  echo "首次使用桌面版，正在安装依赖（npm install）…"
  # 国内网络下载 Electron 二进制易超时，默认走 npmmirror
  ELECTRON_MIRROR="${ELECTRON_MIRROR:-https://npmmirror.com/mirrors/electron/}" npm install
  if [ $? -ne 0 ]; then
    echo "npm install 失败，请检查网络后重试。"
    echo
    echo "可以关闭这个窗口。"
    read -r
    exit 1
  fi
fi

echo "正在启动公考学习追踪（桌面版）…"
npm start
