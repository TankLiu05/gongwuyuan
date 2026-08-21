@echo off
chcp 65001 >nul
cd /d "%~dp0\.."

where node >nul 2>nul
if errorlevel 1 (
  echo 未找到 Node.js，请先安装（建议 22+）并确保 node 在 PATH 中。
  pause
  exit /b 1
)

where npm >nul 2>nul
if errorlevel 1 (
  echo 未找到 npm，请随 Node.js 一并安装。
  pause
  exit /b 1
)

if not exist "node_modules\electron\" (
  echo 首次使用桌面版，正在安装依赖（npm install）…
  set "ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/"
  call npm install
  if errorlevel 1 (
    echo npm install 失败，请检查网络后重试。
    pause
    exit /b 1
  )
)

echo 正在启动公考学习追踪（桌面版）…
echo 关闭窗口右上角叉号即可停止服务。
call npm start
if errorlevel 1 (
  echo 启动失败。
  pause
)
