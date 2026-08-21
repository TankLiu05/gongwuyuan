@echo off
chcp 65001 >nul
set PORT=4783

for /f "tokens=5" %%p in ('netstat -ano ^| findstr /R /C:":%PORT% .*LISTENING"') do (
  echo 正在停止公考学习追踪 PID %%p ...
  taskkill /PID %%p /F >nul 2>nul
)

echo 已停止或未在运行。
pause
