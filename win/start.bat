@echo off
chcp 65001 >nul
cd /d "%~dp0\.."

where node >nul 2>nul
if errorlevel 1 (
  echo 未找到 Node.js，请先安装并确保 node 在 PATH 中。
  pause
  exit /b 1
)

echo 正在启动公考学习追踪...
node server.js --open
if errorlevel 1 (
  echo 启动失败。
  pause
)
