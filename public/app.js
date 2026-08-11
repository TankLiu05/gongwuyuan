const modules = ["言语理解", "数量关系", "判断推理", "资料分析", "常识判断"];
const state = {
  daily_logs: [],
  wrong_questions: [],
  current_affairs_docs: [],
  ai_reviews: [],
  documents: [],
  existing_docx: [],
  materials: [],
  questions: [],
  knowledge: [],
  shenlun_reviews: [],
  chat_sessions: [],
  stats: {},
  selectedDate: ""
};

const $ = selector => document.querySelector(selector);
const $$ = selector => [...document.querySelectorAll(selector)];

document.addEventListener("DOMContentLoaded", () => {
  buildReasoningInputs();
  bindTabs();
  bindForms();
  bindUpload();
  loadState();
});

function bindTabs() {
  $$(".tab").forEach(button => {
    button.addEventListener("click", () => {
      $$(".tab").forEach(tab => tab.classList.remove("active"));
      $$(".panel").forEach(panel => panel.classList.remove("active"));
      button.classList.add("active");
      $(`#${button.dataset.tab}`).classList.add("active");
    });
  });
}

function bindForms() {
  $("#dailyForm").addEventListener("submit", saveDailyLog);
  $("#wrongForm").addEventListener("submit", saveWrongQuestion);
  $("#importSelectedButton").addEventListener("click", importSelectedDocs);
  $("#generateQuestionsButton").addEventListener("click", generateQuestions);
  $("#shenlunForm").addEventListener("submit", submitShenlun);
  $("#chatForm").addEventListener("submit", sendChat);
  $("#aiReviewButton").addEventListener("click", createAiReview);
  $("#aiReviewButtonPanel").addEventListener("click", createAiReview);
  $("#librarySearch").addEventListener("input", renderLibrary);
  $("#dateSelect").addEventListener("change", event => {
    state.selectedDate = event.target.value;
    render();
  });
  $("#prevDateButton").addEventListener("click", () => moveSelectedDate(-1));
  $("#nextDateButton").addEventListener("click", () => moveSelectedDate(1));
  $("#latestDateButton").addEventListener("click", () => {
    state.selectedDate = availableDates()[0] || "";
    render();
  });
}

function bindUpload() {
  const zone = $("#dropZone");
  const input = $("#fileInput");
  zone.addEventListener("click", () => input.click());
  input.addEventListener("change", () => input.files[0] && uploadDocx(input.files[0]));
  ["dragenter", "dragover"].forEach(name => zone.addEventListener(name, event => {
    event.preventDefault();
    zone.classList.add("dragging");
  }));
  ["dragleave", "drop"].forEach(name => zone.addEventListener(name, event => {
    event.preventDefault();
    zone.classList.remove("dragging");
  }));
  zone.addEventListener("drop", event => {
    const file = event.dataTransfer.files[0];
    if (file) uploadDocx(file);
  });
}

function buildReasoningInputs() {
  $("#dailyForm [name='log_date']").value = today();
  $("#reasoningInputs").innerHTML = modules.map(module => `
    <div class="module-row">
      <strong>${escapeHtml(module)}</strong>
      <input type="number" min="0" step="1" name="${module}-correct" value="0" aria-label="${module}正确数">
      <input type="number" min="0" step="1" name="${module}-wrong" value="0" aria-label="${module}错误数">
    </div>
  `).join("");
}

async function loadState() {
  try {
    Object.assign(state, await api("/api/state"));
    ensureSelectedDate();
    render();
  } catch (error) {
    toast(error.message);
  }
}

async function uploadDocx(file) {
  if (!/^每日时政\d{1,2}\.\d{1,2}\.docx$/i.test(file.name)) {
    toast("文件名必须类似：每日时政8.10.docx");
    return;
  }
  $("#uploadMessage").textContent = "正在上传并解析...";
  const form = new FormData();
  form.append("file", file);
  try {
    const next = await apiForm("/api/documents/upload", form);
    state.selectedDate = next.imported?.doc_date || state.selectedDate;
    await loadState();
    $("#uploadMessage").textContent = `已导入 ${next.uploaded}`;
    toast("Word 已解析入库");
  } catch (error) {
    $("#uploadMessage").textContent = error.message;
    toast(error.message);
  }
}

async function importSelectedDocs() {
  const filenames = $$("[data-existing-doc]:checked").map(input => input.value);
  if (!filenames.length) {
    toast("请先选择文件");
    return;
  }
  const button = $("#importSelectedButton");
  setBusy(button, true);
  try {
    const next = await api("/api/documents/import-existing", { method: "POST", body: { filenames } });
    Object.assign(state, next);
    await loadState();
    toast(`已导入 ${filenames.length} 个文件`);
  } catch (error) {
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

async function saveDailyLog(event) {
  event.preventDefault();
  const form = event.currentTarget;
  const data = new FormData(form);
  const reasoning = {};
  for (const module of modules) {
    reasoning[module] = {
      correct: Number(data.get(`${module}-correct`) || 0),
      wrong: Number(data.get(`${module}-wrong`) || 0)
    };
  }
  await submit(form, "/api/daily-log", {
    log_date: data.get("log_date"),
    study_minutes: data.get("study_minutes"),
    reasoning,
    essay_note: data.get("essay_note"),
    affairs_note: data.get("affairs_note")
  }, "今日打卡已保存");
}

async function saveWrongQuestion(event) {
  event.preventDefault();
  const form = event.currentTarget;
  await submit(form, "/api/wrong-question", Object.fromEntries(new FormData(form).entries()), "错题已加入");
  form.reset();
}

async function submitShenlun(event) {
  event.preventDefault();
  const form = event.currentTarget;
  await submit(form, "/api/ai/shenlun-review", Object.fromEntries(new FormData(form).entries()), "申论批改已保存");
}

async function submit(form, url, payload, message) {
  const button = form.querySelector("button[type='submit']");
  setBusy(button, true);
  try {
    const next = await api(url, { method: "POST", body: payload });
    if (next.review) await loadState();
    else Object.assign(state, next);
    render();
    toast(message);
  } catch (error) {
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

async function generateQuestions() {
  const button = $("#generateQuestionsButton");
  setBusy(button, true);
  try {
    const documentId = Number($("#generateDocSelect").value || 0) || undefined;
    const next = await api("/api/ai/generate-questions", { method: "POST", body: { document_id: documentId, doc_date: state.selectedDate, count: 5 } });
    state.questions = next.questions;
    ensureSelectedDate();
    renderQuestions();
    toast(`已生成 ${next.generated_count} 道题`);
  } catch (error) {
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

async function sendChat(event) {
  event.preventDefault();
  const form = event.currentTarget;
  const message = new FormData(form).get("message");
  const payload = { message, context: readChatContext() };
  appendChatMessage("user", message);
  setBusy(form.querySelector("button"), true);
  try {
    const next = await api("/api/chat", { method: "POST", body: payload });
    state.chat_sessions = next.sessions;
    appendChatMessage("assistant", next.answer);
    form.reset();
  } catch (error) {
    appendChatMessage("assistant", error.message);
    toast(error.message);
  } finally {
    setBusy(form.querySelector("button"), false);
  }
}

async function createAiReview() {
  const buttons = [$("#aiReviewButton"), $("#aiReviewButtonPanel")];
  buttons.forEach(button => setBusy(button, true));
  $("#aiMessage").textContent = "正在生成复盘...";
  try {
    Object.assign(state, await api("/api/ai/review", { method: "POST" }));
    render();
    toast("AI 复盘已生成");
  } catch (error) {
    $("#aiMessage").textContent = error.message;
    toast(error.message);
  } finally {
    buttons.forEach(button => setBusy(button, false));
  }
}

async function updateWrong(id, patch) {
  try {
    Object.assign(state, await api(`/api/wrong-question/${id}`, { method: "PATCH", body: patch }));
    render();
    toast("错题状态已更新");
  } catch (error) {
    toast(error.message);
  }
}

function render() {
  ensureSelectedDate();
  renderStats();
  renderDateFilter();
  renderImport();
  renderLibrary();
  renderQuestions();
  renderShenlun();
  renderChatContext();
  renderDaily();
  renderWrong();
  renderReviews();
}

function renderStats() {
  $("#docCount").textContent = filteredDocuments().length;
  $("#materialCount").textContent = filteredMaterials().length;
  $("#questionCount").textContent = filteredQuestions().length;
  $("#knowledgeCount").textContent = filteredKnowledge().length;
  $("#shenlunCount").textContent = state.stats.shenlun_review_count || 0;
}

function renderDateFilter() {
  const dates = availableDates();
  $("#dateSelect").innerHTML = dates.length ? dates.map(date =>
    `<option value="${date}" ${date === state.selectedDate ? "selected" : ""}>${date}</option>`
  ).join("") : `<option value="">暂无资料</option>`;
  const currentDocs = filteredDocuments();
  $("#selectedDateLabel").textContent = state.selectedDate
    ? `${state.selectedDate} · ${currentDocs.map(doc => doc.filename).join("、") || "未导入文档"}`
    : "暂无资料";
  const index = dates.indexOf(state.selectedDate);
  $("#prevDateButton").disabled = index === -1 || index >= dates.length - 1;
  $("#nextDateButton").disabled = index <= 0;
  $("#latestDateButton").disabled = !dates.length || index === 0;
  $("#libraryScopeText").textContent = state.selectedDate
    ? `当前只显示 ${state.selectedDate} 的材料和知识条目。`
    : "导入资料后可按日期查看。";
  $("#questionScopeText").textContent = state.selectedDate
    ? `当前只显示 ${state.selectedDate} 的题目；AI 出题默认使用这一天的材料。`
    : "导入资料后可按日期查看题目。";
}

function renderImport() {
  $("#existingDocsList").innerHTML = state.existing_docx.length ? state.existing_docx.map(doc => `
    <label class="check-row">
      <input type="checkbox" data-existing-doc value="${escapeAttr(doc.filename)}">
      <span>
        <strong>${escapeHtml(doc.filename)}</strong>
        <small>${escapeHtml(doc.doc_date)} · ${formatBytes(doc.size_bytes)} · ${doc.imported_id ? "已导入" : "未导入"}</small>
      </span>
    </label>
  `).join("") : `<div class="empty">大目录里还没有每日时政 Word 文件。</div>`;

  $("#documentsList").innerHTML = state.documents.length ? state.documents.map(doc => `
    <article class="item-card">
      <h3>${escapeHtml(doc.filename)}</h3>
      <div class="meta">${escapeHtml(doc.doc_date)} · ${escapeHtml(doc.status)} · 材料 ${doc.parse_summary.articles || 0} · 题目 ${doc.parse_summary.questions || 0} · 常识/成语 ${doc.parse_summary.knowledge || 0}</div>
      <p>${escapeHtml(doc.ai_validation || doc.error_message || "暂无校验信息")}</p>
    </article>
  `).join("") : `<div class="empty">还没有导入记录。</div>`;
}

function renderLibrary() {
  const keyword = ($("#librarySearch").value || "").trim().toLowerCase();
  const match = text => !keyword || String(text || "").toLowerCase().includes(keyword);
  const materials = filteredMaterials().filter(item => match([item.title, item.body, item.tags, item.filename].join(" ")));
  const knowledge = filteredKnowledge().filter(item => match([item.category, item.title, item.body, item.tags, item.filename].join(" ")));
  $("#materialsList").innerHTML = materials.length ? materials.map(item => `
    <article class="item-card">
      <h3>${escapeHtml(item.title)}</h3>
      <div class="meta">${escapeHtml(item.filename)} · ${escapeHtml(item.source || "未标来源")}</div>
      <p>${escapeHtml(item.body)}</p>
    </article>
  `).join("") : `<div class="empty">没有匹配的时政材料。</div>`;
  $("#knowledgeList").innerHTML = knowledge.length ? knowledge.map(item => `
    <article class="item-card">
      <h3>${escapeHtml(item.category)} · ${escapeHtml(item.title)}</h3>
      <div class="meta">${escapeHtml(item.filename || "")}</div>
      <p>${escapeHtml(item.body)}</p>
    </article>
  `).join("") : `<div class="empty">没有匹配的常识或成语。</div>`;
}

function renderQuestions() {
  const docs = filteredDocuments();
  $("#generateDocSelect").innerHTML = `<option value="">当前日期全部材料</option>` + docs.map(doc =>
    `<option value="${doc.id}">${escapeHtml(doc.filename)}</option>`
  ).join("");
  const questions = filteredQuestions();
  $("#questionsList").innerHTML = questions.length ? questions.map(q => `
    <article class="item-card question-card">
      <h3>${escapeHtml(q.question_type)} · ${escapeHtml(q.filename || "AI 生成")}</h3>
      <p>${escapeHtml(q.prompt)}</p>
      <div class="options">${(q.options || []).map(option => `
        <label class="option-row">
          <input type="${q.question_type === "多选" ? "checkbox" : "radio"}" name="q-${q.id}">
          <span>${escapeHtml(option.key)}. ${escapeHtml(option.text)}</span>
        </label>
      `).join("")}</div>
      <details>
        <summary>查看答案</summary>
        <div class="meta">答案：${escapeHtml(q.answer || "未解析")}</div>
        <p>${escapeHtml(q.explanation || "")}</p>
      </details>
    </article>
  `).join("") : `<div class="empty">这一天还没有题目。先导入当天 Word，或用 AI 生成题。</div>`;
}

function renderShenlun() {
  $("#shenlunList").innerHTML = state.shenlun_reviews.length ? state.shenlun_reviews.map(item => `
    <article class="review-item">
      <h3>${escapeHtml(item.question_type || "申论批改")} · ${escapeHtml(item.score || "未提取分数")}</h3>
      ${escapeHtml(item.ai_raw)}
    </article>
  `).join("") : `<div class="empty">还没有申论批改记录。</div>`;
}

function renderChatContext() {
  const docs = filteredDocuments().map(doc => checkItem("document_ids", doc.id, `文档：${doc.filename}`));
  const questions = filteredQuestions().slice(0, 20).map(q => checkItem("question_ids", q.id, `题目：${q.prompt.slice(0, 28)}`));
  const knowledge = filteredKnowledge().slice(0, 20).map(k => checkItem("knowledge_ids", k.id, `${k.category}：${k.title}`));
  const shenlun = state.shenlun_reviews.slice(0, 10).map(s => checkItem("shenlun_ids", s.id, `申论：${s.prompt.slice(0, 28)}`));
  $("#chatContextList").innerHTML = [...docs, ...questions, ...knowledge, ...shenlun].join("") || `<div class="empty">导入资料或完成批改后可勾选上下文。</div>`;
}

function availableDates() {
  return [...new Set([
    ...state.documents.map(doc => doc.doc_date),
    ...state.existing_docx.filter(doc => doc.imported_id).map(doc => doc.doc_date)
  ].filter(Boolean))].sort((a, b) => b.localeCompare(a));
}

function ensureSelectedDate(preferredDate) {
  const dates = availableDates();
  if (preferredDate && dates.includes(preferredDate)) {
    state.selectedDate = preferredDate;
    return;
  }
  if (!state.selectedDate || !dates.includes(state.selectedDate)) {
    state.selectedDate = dates[0] || "";
  }
}

function moveSelectedDate(delta) {
  const dates = availableDates();
  const index = dates.indexOf(state.selectedDate);
  const next = index + delta;
  if (next >= 0 && next < dates.length) {
    state.selectedDate = dates[next];
    render();
  }
}

function filteredDocuments() {
  return state.selectedDate ? state.documents.filter(doc => doc.doc_date === state.selectedDate) : [];
}

function filteredMaterials() {
  const ids = new Set(filteredDocuments().map(doc => doc.id));
  return state.materials.filter(item => ids.has(item.document_id));
}

function filteredQuestions() {
  const ids = new Set(filteredDocuments().map(doc => doc.id));
  return state.questions.filter(item => ids.has(item.document_id));
}

function filteredKnowledge() {
  const ids = new Set(filteredDocuments().map(doc => doc.id));
  return state.knowledge.filter(item => ids.has(item.document_id));
}

function renderDaily() {
  const rows = state.daily_logs.slice(0, 8);
  $("#dailyList").innerHTML = rows.length ? rows.map(log => {
    const total = Object.values(log.reasoning || {}).reduce((sum, item) => sum + Number(item.correct || 0) + Number(item.wrong || 0), 0);
    const wrong = Object.values(log.reasoning || {}).reduce((sum, item) => sum + Number(item.wrong || 0), 0);
    return `<div class="row-item"><div><strong>${escapeHtml(log.log_date)}</strong><div class="meta">${log.study_minutes} 分钟 · 行测 ${total} 题 · 错 ${wrong} 题</div></div></div>`;
  }).join("") : `<div class="empty">还没有打卡记录。</div>`;
}

function renderWrong() {
  $("#wrongList").innerHTML = state.wrong_questions.length ? state.wrong_questions.map(q => `
    <article class="item-card">
      <h3>${escapeHtml(q.module)} · ${escapeHtml(q.question_type || "未分类题型")}</h3>
      <p>${escapeHtml(q.prompt)}</p>
      <div class="meta">正确答案：${escapeHtml(q.correct_answer || "未填")} · 我的错误：${escapeHtml(q.my_answer || "未填")}</div>
      <div class="meta">错因：${escapeHtml(q.reason || "未填")}</div>
      <div class="chip-row">
        ${tagChips(q.tags)}
        <select class="status-select" data-wrong-id="${q.id}" aria-label="错题复习状态">
          <option value="pending" ${q.review_status === "pending" ? "selected" : ""}>待二刷</option>
          <option value="reviewing" ${q.review_status === "reviewing" ? "selected" : ""}>复习中</option>
          <option value="mastered" ${q.review_status === "mastered" ? "selected" : ""}>已掌握</option>
        </select>
      </div>
    </article>
  `).join("") : `<div class="empty">还没有错题记录。</div>`;
  $$("[data-wrong-id]").forEach(select => {
    select.addEventListener("change", () => updateWrong(select.dataset.wrongId, { review_status: select.value }));
  });
}

function renderReviews() {
  $("#aiMessage").textContent = state.ai_reviews.length ? "" : "还没有 AI 复盘。";
  $("#reviewList").innerHTML = state.ai_reviews.length ? state.ai_reviews.map(review => `
    <article class="review-item">
      <h3>${escapeHtml(review.review_date)} 复盘</h3>
      ${escapeHtml(review.content)}
    </article>
  `).join("") : "";
}

function readChatContext() {
  const result = {};
  $$("[data-context]:checked").forEach(input => {
    const key = input.dataset.context;
    result[key] ||= [];
    result[key].push(Number(input.value));
  });
  return result;
}

function appendChatMessage(role, content) {
  const target = $("#chatMessages");
  target.insertAdjacentHTML("beforeend", `<div class="chat-message ${role}">${escapeHtml(content)}</div>`);
  target.scrollTop = target.scrollHeight;
}

function checkItem(type, id, label) {
  return `<label class="check-row"><input type="checkbox" data-context="${type}" value="${id}"><span>${escapeHtml(label)}</span></label>`;
}

async function api(url, options = {}) {
  const response = await fetch(url, {
    method: options.method || "GET",
    headers: options.body ? { "Content-Type": "application/json" } : undefined,
    body: options.body ? JSON.stringify(options.body) : undefined
  });
  const payload = await response.json();
  if (!response.ok) throw new Error(payload.error || "请求失败");
  return payload;
}

async function apiForm(url, form) {
  const response = await fetch(url, { method: "POST", body: form });
  const payload = await response.json();
  if (!response.ok) throw new Error(payload.error || "上传失败");
  return payload;
}

function setBusy(button, busy) {
  if (!button) return;
  button.disabled = busy;
}

function toast(message) {
  const target = $("#toast");
  target.textContent = message;
  target.classList.add("show");
  clearTimeout(toast.timer);
  toast.timer = setTimeout(() => target.classList.remove("show"), 2800);
}

function tagChips(tags) {
  const list = String(tags || "").split(/[,，]/).map(tag => tag.trim()).filter(Boolean);
  return list.length ? list.map(tag => `<span class="chip">${escapeHtml(tag)}</span>`).join("") : `<span class="chip">无标签</span>`;
}

function formatBytes(bytes) {
  const value = Number(bytes || 0);
  return value > 1024 ? `${Math.round(value / 1024)} KB` : `${value} B`;
}

function today() {
  const date = new Date();
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
}

function escapeHtml(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function escapeAttr(value) {
  return escapeHtml(value).replaceAll("\n", " ");
}
