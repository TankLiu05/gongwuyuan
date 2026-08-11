#!/bin/zsh
PORT=4783
PIDS=$(lsof -ti tcp:$PORT)

if [ -z "$PIDS" ]; then
  echo "公考学习追踪没有在运行。"
else
  echo "正在停止公考学习追踪..."
  kill $PIDS
  echo "已停止。"
fi

echo
echo "可以关闭这个窗口。"
