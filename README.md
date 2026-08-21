# 公考学习追踪

本地单机工具，把「每日时政」Word 解析成结构化资料，按日期分开学习：

- **时政材料**：热点原文
- **题目**：Word 原题（可作答计分）+ 可选 AI 出题
- **成语**：Word【成语】【词语】【辨析】段落，以及「每日积累」写入的成语
- **常识记忆**：【常识】、「历史上的今天」、颁奖辞、金句等翻卡复习（与成语严格分开）
- **每日积累**：在导入页粘贴微信摘抄（成语 / 金句 / 常识判断），先分析再写入
- **仪表盘**：当日完成度、结构占比、近两周体量
- **问 AI**：默认带上当天材料、题目、常识作上下文

导入时会按 Word 章节自动拆分；若解析规则更新，可在「导入」页点 **全部重解析**。

不依赖 npm 安装，无账号体系，数据都在本机。

## 环境要求

- [Node.js](https://nodejs.org/)（建议 22+，需支持内置 `node:sqlite`）
- Python 3（用于解析 `.docx`）
- DeepSeek API Key（AI 出题、对话需要；只导入浏览可不配）

## 目录说明

```
study/
├── mac/                 # macOS 启动 / 停止
│   ├── start.command
│   └── stop.command
├── win/                 # Windows 启动 / 停止
│   ├── start.bat
│   ├── stop.bat
│   ├── start.sh         # Git Bash 备用
│   └── stop.sh
├── public/              # 前端页面
├── scripts/
│   ├── parse_docx.py
│   ├── parse_daily_digest.js
│   └── write_import_sql.js
├── server.js            # 本地服务
├── .env.example         # 环境变量模板
├── data/                # SQLite（本地，不入库）
├── sql/imports/         # 每次导入生成的可回放 SQL
└── exports/             # 导出文件（本地，不入库）
```

上级目录（`每日时政/`）里的 `每日时政M.D.docx` 是内容源；本仓库是工具层。

每次导入 Word 或「每日积累」时，除写入 SQLite 外，还会在 `sql/imports/` 生成对应 `.sql`（可用 `filename` 定位文档，便于重放）。

## 首次配置

1. 复制环境变量模板：

```bash
cp .env.example .env
```

2. 编辑 `.env`，至少填写：

```env
DEEPSEEK_API_KEY=你的key
DEEPSEEK_BASE_URL=https://api.deepseek.com
DEEPSEEK_MODEL=deepseek-v4-flash
PORT=4783
```

也可把 `.env` 放在上级 `每日时政/` 目录，工具会一并读取。

## 启动

### macOS

双击 `mac/start.command`  
（若提示无法打开：系统设置 → 隐私与安全性 → 仍要打开；或在终端执行 `chmod +x mac/*.command`）

### Windows

双击 `win/start.bat`  
或在 Git Bash 中：

```bash
bash win/start.sh
```

启动后会打开浏览器；也可手动访问：

```
http://127.0.0.1:4783
```

## 停止

- macOS：双击 `mac/stop.command`
- Windows：双击 `win/stop.bat`（或 `bash win/stop.sh`）

## 怎么用

1. **导入**  
   - 文件名需类似：`每日时政8.10.docx`  
   - 可拖拽上传，或勾选上级目录里已有 Word 批量导入  
   - 同名文件会覆盖上级目录中的原文件  
   - **每日积累**：粘贴微信摘抄正文 + 答案解析 → 点「分析」预览 → 确认后「写入」

2. **按日期切换**  
   顶部选日期后，材料 / 题目 / 成语 / 常识都只显示当天内容。

3. **仪表盘**  
   看当天完成度、结构占比和近两周导入体量，点卡片跳到对应栏目。

4. **常识记忆**  
   翻卡复习；可标「还不熟 / 记住了」；支持「仅当天 / 全部日期」和「待记 / 已掌握」筛选。

5. **问 AI**  
   自动带上当天已导入的材料、题目、常识，无需手动勾选上下文。

6. **全部重解析**  
   解析规则升级后，在导入页一键按新规则重建库（尽量保留记忆状态）。

## 数据与隐私

| 路径 | 说明 |
|------|------|
| `data/study.sqlite` | 导入结果、记忆状态、对话等 |
| `exports/` | 历史导出（若有） |
| `.env` | API Key，勿提交到 Git |

以上本地目录已在 `.gitignore` 中忽略。

## 常见问题

**启动报找不到 node**  
安装 Node.js，并确认终端里 `node -v` 可用。

**导入失败 / 解析失败**  
确认系统能运行 `python3`；Word 需是标准 `.docx`，且文件名符合 `每日时政月.日.docx`。

**成语栏为空**  
仅当 Word 出现【成语】【词语】【辨析】段时才会进入成语栏。【常识】（含「山的雅称」这类）一律在「常识记忆」，不会串过去。

**AI 相关按钮报错**  
检查 `.env` 里的 `DEEPSEEK_API_KEY` 是否填写正确、网络能否访问 DeepSeek。
