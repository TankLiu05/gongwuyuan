/**
 * 解析微信「每日积累」摘抄：只取成语 / 金句 / 常识判断，忽略新闻头条。
 */

function parseDailyDigest(rawText, answerText = "", fallbackDate = "") {
  const text = String(rawText || "").replace(/\r\n/g, "\n").trim();
  const answerBlock = String(answerText || "").replace(/\r\n/g, "\n").trim();
  const warnings = [];

  if (!text) {
    return {
      doc_date: fallbackDate || "",
      idioms: [],
      quotes: [],
      questions: [],
      warnings: ["正文为空"]
    };
  }

  const docDate = extractDigestDate(text) || normalizeDateInput(fallbackDate) || "";
  if (!docDate) warnings.push("未能识别日期，请手动填写");

  const idiomSection = sliceSection(text, /成语积累/, [/金句积累/, /常识判断/, /^PS[：:]/i]);
  const quoteSection = sliceSection(text, /金句积累/, [/常识判断/, /^PS[：:]/i]);
  const quizSection = sliceSection(text, /常识判断/, [/^PS[：:]/i]);

  const idioms = parseIdioms(idiomSection);
  const quotes = parseQuotes(quoteSection);
  const questions = parseQuiz(quizSection, answerBlock);

  if (!idioms.length) warnings.push("未解析到成语");
  if (!quotes.length) warnings.push("未解析到金句");
  if (!questions.length) warnings.push("未解析到常识判断题");
  if (questions.length && !questions[0].answer) warnings.push("未解析到正确答案，请粘贴答案解析");

  return { doc_date: docDate, idioms, quotes, questions, warnings };
}

function extractDigestDate(text) {
  const bracket = text.match(/〔\s*(\d{4})[.\-/年](\d{1,2})[.\-/月](\d{1,2})日?\s*〕/);
  if (bracket) return toIsoDate(bracket[1], bracket[2], bracket[3]);
  const loose = text.match(/(\d{4})[.\-/年](\d{1,2})[.\-/月](\d{1,2})日?/);
  if (loose) return toIsoDate(loose[1], loose[2], loose[3]);
  return "";
}

function normalizeDateInput(value) {
  const text = String(value || "").trim();
  if (/^\d{4}-\d{2}-\d{2}$/.test(text)) return text;
  const m = text.match(/^(\d{4})[.\-/](\d{1,2})[.\-/](\d{1,2})$/);
  if (m) return toIsoDate(m[1], m[2], m[3]);
  return "";
}

function toIsoDate(y, m, d) {
  return `${y}-${String(Number(m)).padStart(2, "0")}-${String(Number(d)).padStart(2, "0")}`;
}

function sliceSection(text, startRe, endRes) {
  const lines = text.split("\n");
  const start = lines.findIndex(line => startRe.test(line.trim()));
  if (start === -1) return "";
  const collected = [];
  for (let i = start + 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (endRes.some(re => re.test(line))) break;
    collected.push(lines[i]);
  }
  return collected.join("\n").trim();
}

function parseIdioms(section) {
  if (!section) return [];
  const items = [];
  const lines = expandNumberedLines(section);
  for (const line of lines) {
    const cleaned = line
      .replace(/^[\d０-９]+[\.．、\s]+/, "")
      .replace(/^[○•·\-—]+\s*/, "")
      .trim();
    if (!cleaned) continue;
    const match = cleaned.match(/^(.{2,12}?)\s*[：:]\s*(.+)$/);
    if (!match) continue;
    const title = normalizeTypo(match[1].trim());
    const body = normalizeTypo(match[2].trim());
    if (title.length < 2 || title.length > 12) continue;
    items.push({
      category: "成语",
      kind: "idiom",
      title,
      body,
      topic: "成语积累",
      tags: "成语"
    });
  }
  return items;
}

function parseQuotes(section) {
  if (!section) return [];
  const items = [];
  const blocks = section.split(/(?=适用主题\s*[：:])/);
  for (const block of blocks) {
    const text = block.trim();
    if (!text) continue;
    const topicMatch = text.match(/适用主题\s*[：:]\s*([^\n]+)/);
    if (!topicMatch) continue;
    const topic = topicMatch[1].trim();
    const body = normalizeTypo(
      text
        .replace(/适用主题\s*[：:]\s*[^\n]+/, "")
        .replace(/^["“]|["”]$/g, "")
        .replace(/\s+/g, " ")
        .trim()
    );
    if (!body) continue;
    items.push({
      category: "金句",
      kind: "quote",
      title: `金句 · ${topic}`,
      body,
      topic,
      tags: "金句"
    });
  }
  return items;
}

function parseQuiz(section, answerBlock) {
  if (!section) return [];
  const lines = section
    .split("\n")
    .map(line => line.trim())
    .filter(Boolean)
    .filter(line => !/^PS[：:]/i.test(line) && !line.includes("同学做完") && !line.includes("要积累"));

  if (!lines.length) return [];

  const options = [];
  const promptLines = [];
  for (const line of lines) {
    const opt = line.match(/^([A-Da-d])[\.．、\s]*(.+)$/);
    if (opt) {
      options.push({ key: opt[1].toUpperCase(), text: opt[2].trim() });
    } else if (!options.length) {
      promptLines.push(line);
    }
  }

  if (!promptLines.length || options.length < 2) return [];

  const prompt = promptLines.join("").replace(/\s+/g, "");
  const merged = `${answerBlock}\n${section}`;
  const answer = extractAnswerKey(merged);
  const explanation = normalizeTypo(answerBlock || extractInlineExplanation(section));

  return [{
    question_type: "单选",
    prompt,
    options,
    answer,
    explanation,
    tags: "常识判断"
  }];
}

function extractAnswerKey(text) {
  const patterns = [
    /故正确答案为\s*([A-D])/i,
    /正确答案[为是：:\s]*([A-D])/i,
    /答案[为是：:\s]*([A-D])/i,
    /选\s*([A-D])/i
  ];
  for (const re of patterns) {
    const match = text.match(re);
    if (match) return match[1].toUpperCase();
  }
  return "";
}

function extractInlineExplanation(section) {
  const idx = section.search(/本题考查|正确答案|故正确答案/);
  if (idx === -1) return "";
  return section.slice(idx).trim();
}

function expandNumberedLines(section) {
  const rawLines = section.split("\n").map(line => line.trim()).filter(Boolean);
  const out = [];
  for (const line of rawLines) {
    const parts = line.split(/(?=\d+[\.．、])/).map(part => part.trim()).filter(Boolean);
    if (parts.length > 1 && parts.every(part => /^\d+[\.．、]/.test(part))) {
      out.push(...parts);
    } else {
      out.push(line);
    }
  }
  return out;
}

function normalizeTypo(text) {
  return String(text || "")
    .replace(/改烃/g, "更改")
    .replace(/关键当\s+口/g, "关键当口")
    .replace(/[ \t]+/g, " ")
    .trim();
}

function digestFilename(docDate) {
  const m = String(docDate || "").match(/^(\d{4})-(\d{2})-(\d{2})$/);
  if (!m) return "每日积累";
  return `每日积累${Number(m[2])}.${Number(m[3])}`;
}

function toKnowledgeItems(parsed) {
  const items = [];
  let order = 1;
  for (const item of parsed.idioms || []) {
    items.push({
      order: order++,
      category: item.category,
      title: item.title,
      body: item.body,
      topic: item.topic,
      tags: item.tags,
      kind: item.kind,
      fingerprint: `成语||${item.title}|${item.body.slice(0, 80)}`
    });
  }
  for (const item of parsed.quotes || []) {
    items.push({
      order: order++,
      category: item.category,
      title: item.title,
      body: item.body,
      topic: item.topic,
      tags: item.tags,
      kind: item.kind,
      fingerprint: `金句|${item.topic}|${item.title}|${item.body.slice(0, 80)}`
    });
  }
  return items;
}

module.exports = {
  parseDailyDigest,
  digestFilename,
  toKnowledgeItems,
  normalizeDateInput
};
