# 公考学习追踪

本地运行的公考学习工具，包含每日时政 Word 导入解析、资料库、题库、申论批改、AI 对话、每日打卡和错题本。

## 启动

1. 在 `study/.env` 中填写 DeepSeek key。
2. 双击 `study/start.command` 启动。
3. 浏览器访问 `http://127.0.0.1:4783`。

## 停止

双击 `study/stop.command`。

## 数据

SQLite 数据保存在 `study/data/`，导出文件保存在 `study/exports/`，这些本地数据不会提交到 Git。
