const state = {
  documents: [],
  existing_docx: [],
  materials: [],
  questions: [],
  knowledge: [],
  chat_sessions: [],
  stats: {},
  selectedDate: "",
  viewScope: "day",
  memoryIndex: 0,
  memoryRevealed: false
};

const $ = selector => document.querySelector(selector);
const $$ = selector => [...document.querySelectorAll(selector)];

document.addEventListener("DOMContentLoaded", () => {
  bindTabs();
  bindForms();
  bindUpload();
  document.body.classList.add("fit-dashboard");
  loadState();
});

function bindTabs() {
  $$(".tab").forEach(button => {
    button.addEventListener("click", () => activateTab(button.dataset.tab));
  });
}

function activateTab(tabId) {
  $$(".tab").forEach(tab => tab.classList.toggle("active", tab.dataset.tab === tabId));
  $$(".panel").forEach(panel => panel.classList.toggle("active", panel.id === tabId));
  document.body.classList.toggle("fit-dashboard", tabId === "today");
  if (tabId === "memory") {
    state.memoryIndex = 0;
    state.memoryRevealed = false;
    renderMemory();
  }
}

function bindForms() {
  $("#importSelectedButton").addEventListener("click", importSelectedDocs);
  $("#reparseAllButton")?.addEventListener("click", reparseAllDocs);
  $("#digestPreviewButton")?.addEventListener("click", previewDailyDigest);
  $("#digestForm")?.addEventListener("submit", importDailyDigest);
  $("#generateQuestionsButton").addEventListener("click", generateQuestions);
  $("#chatForm").addEventListener("submit", sendChat);
  $("#materialsSearch").addEventListener("input", renderMaterials);
  $("#idiomsSearch").addEventListener("input", renderIdioms);
  $("#viewScopeSelect").addEventListener("change", event => {
    state.viewScope = event.target.value === "all" ? "all" : "day";
    state.memoryIndex = 0;
    state.memoryRevealed = false;
    render();
  });
  $("#memoryStatusFilter").addEventListener("change", () => {
    state.memoryIndex = 0;
    state.memoryRevealed = false;
    renderMemory();
  });
  $("#dateSelect").addEventListener("change", event => {
    state.selectedDate = event.target.value;
    if (state.viewScope === "all") state.viewScope = "day";
    state.memoryIndex = 0;
    state.memoryRevealed = false;
    render();
  });
  $("#prevDateButton").addEventListener("click", () => {
    if (state.viewScope === "all") state.viewScope = "day";
    moveSelectedDate(-1);
  });
  $("#nextDateButton").addEventListener("click", () => {
    if (state.viewScope === "all") state.viewScope = "day";
    moveSelectedDate(1);
  });
  $("#latestDateButton").addEventListener("click", () => {
    state.viewScope = "day";
    state.selectedDate = availableDates()[0] || "";
    state.memoryIndex = 0;
    state.memoryRevealed = false;
    render();
  });
  $("#dashboardRoot").addEventListener("click", event => {
    const button = event.target.closest("[data-jump]");
    if (button) activateTab(button.dataset.jump);
  });
  $("#memoryDeck").addEventListener("click", event => {
    const action = event.target.closest("[data-memory-action]")?.dataset.memoryAction;
    if (!action) return;
    handleMemoryAction(action);
  });
  $("#memoryList").addEventListener("click", event => {
    const button = event.target.closest("[data-memory-id]");
    if (!button) return;
    updateMemoryStatus(Number(button.dataset.memoryId), button.dataset.memoryStatus);
  });
  $("#questionsList").addEventListener("click", event => {
    const button = event.target.closest("[data-check-question]");
    if (!button) return;
    checkQuestion(Number(button.dataset.checkQuestion));
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
    $("#uploadMessage").textContent = `已导入 ${next.uploaded}${next.imported?.sql_path ? `；SQL：${next.imported.sql_path}` : ""}`;
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
    await api("/api/documents/import-existing", { method: "POST", body: { filenames } });
    await loadState();
    toast(`已导入 ${filenames.length} 个文件`);
  } catch (error) {
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

async function reparseAllDocs() {
  const button = $("#reparseAllButton");
  if (!confirm("将按新规则重新解析上级目录全部 Word，并尽量保留记忆状态。继续？")) return;
  setBusy(button, true);
  $("#uploadMessage").textContent = "正在全部重解析，请稍候...";
  try {
    const next = await api("/api/documents/reparse-all", { method: "POST", body: {} });
    Object.assign(state, next.state || {});
    ensureSelectedDate();
    render();
    const failed = (next.results || []).filter(item => !item.ok).length;
    $("#uploadMessage").textContent = `重解析完成：${next.reparsed} 个，失败 ${failed} 个`;
    toast(failed ? `完成，有 ${failed} 个失败` : "全部重解析完成");
  } catch (error) {
    $("#uploadMessage").textContent = error.message;
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

function digestPayload() {
  return {
    doc_date: ($("#digestDate")?.value || "").trim(),
    text: ($("#digestText")?.value || "").trim(),
    answer_text: ($("#digestAnswer")?.value || "").trim()
  };
}

async function previewDailyDigest() {
  const button = $("#digestPreviewButton");
  const payload = digestPayload();
  if (!payload.text) {
    toast("请先粘贴正文摘抄");
    return;
  }
  setBusy(button, true);
  $("#digestMessage").textContent = "正在分析...";
  try {
    const next = await api("/api/daily-digest/preview", { method: "POST", body: payload });
    if (next.parsed?.doc_date && $("#digestDate")) $("#digestDate").value = next.parsed.doc_date;
    renderDigestPreview(next.parsed, next.summary);
    const warn = (next.summary?.warnings || []).join("；");
    $("#digestMessage").textContent = warn ? `分析完成（提示：${warn}）` : "分析完成，确认无误后点「写入」";
  } catch (error) {
    $("#digestMessage").textContent = error.message;
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

async function importDailyDigest(event) {
  event.preventDefault();
  const button = $("#digestImportButton");
  const payload = digestPayload();
  if (!payload.text) {
    toast("请先粘贴正文摘抄");
    return;
  }
  if (!payload.doc_date) {
    toast("请填写学习日期");
    return;
  }
  setBusy(button, true);
  $("#digestMessage").textContent = "正在写入...";
  try {
    const next = await api("/api/daily-digest/import", { method: "POST", body: payload });
    Object.assign(state, next.state || {});
    state.selectedDate = next.doc_date || state.selectedDate;
    ensureSelectedDate();
    render();
    renderDigestPreview(next.parsed, next.summary);
    $("#digestMessage").textContent = `已写入 ${next.filename}（成语 ${next.summary.idioms} · 金句 ${next.summary.quotes} · 题 ${next.summary.questions}）${next.sql_path ? `；SQL：${next.sql_path}` : ""}`;
    toast("每日积累已写入");
  } catch (error) {
    $("#digestMessage").textContent = error.message;
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

function renderDigestPreview(parsed, summary) {
  const root = $("#digestPreview");
  if (!root) return;
  if (!parsed) {
    root.className = "digest-preview empty";
    root.textContent = "分析后会在这里显示成语、金句、题目结构。";
    return;
  }
  const idioms = parsed.idioms || [];
  const quotes = parsed.quotes || [];
  const questions = parsed.questions || [];
  root.className = "digest-preview";
  root.innerHTML = `
    <div class="meta">日期 ${escapeHtml(parsed.doc_date || "未识别")} · 成语 ${summary?.idioms ?? idioms.length} · 金句 ${summary?.quotes ?? quotes.length} · 题 ${summary?.questions ?? questions.length}</div>
    ${idioms.length ? `<div class="digest-section"><h3>成语</h3><ul>${idioms.map(item => `<li><strong>${escapeHtml(item.title)}</strong>：${escapeHtml(item.body)}</li>`).join("")}</ul></div>` : ""}
    ${quotes.length ? `<div class="digest-section"><h3>金句</h3><ul>${quotes.map(item => `<li><strong>${escapeHtml(item.topic || item.title)}</strong><p>${escapeHtml(item.body)}</p></li>`).join("")}</ul></div>` : ""}
    ${questions.length ? `<div class="digest-section"><h3>常识判断</h3>${questions.map(q => `
      <p><strong>${escapeHtml(q.prompt)}</strong></p>
      <ul>${(q.options || []).map(opt => `<li>${escapeHtml(opt.key)}. ${escapeHtml(opt.text)}</li>`).join("")}</ul>
      <p class="meta">答案：${escapeHtml(q.answer || "未解析")}</p>
      ${q.explanation ? `<p>${escapeHtml(q.explanation)}</p>` : ""}
    `).join("")}</div>` : ""}
    ${(parsed.warnings || []).length ? `<p class="meta">提示：${escapeHtml(parsed.warnings.join("；"))}</p>` : ""}
  `;
}

function syncDigestDateInput() {
  const input = $("#digestDate");
  if (!input) return;
  if (!input.value) input.value = state.selectedDate || todayIsoLocal();
}

function todayIsoLocal() {
  const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
}

async function generateQuestions() {
  const button = $("#generateQuestionsButton");
  setBusy(button, true);
  try {
    const documentId = Number($("#generateDocSelect").value || 0) || undefined;
    const next = await api("/api/ai/generate-questions", {
      method: "POST",
      body: { document_id: documentId, doc_date: state.selectedDate, count: 5 }
    });
    state.questions = next.questions;
    ensureSelectedDate();
    renderQuestions();
    renderDashboard();
    renderStats();
    toast(`已生成 ${next.generated_count} 道题`);
  } catch (error) {
    toast(error.message);
  } finally {
    setBusy(button, false);
  }
}

async function checkQuestion(id) {
  const card = $(`[data-question-id="${id}"]`);
  if (!card) return;
  const selected = [...card.querySelectorAll("input:checked")].map(input => input.value).sort().join("");
  if (!selected) {
    toast("请先选择选项");
    return;
  }
  try {
    const next = await api(`/api/questions/${id}/answer`, {
      method: "POST",
      body: { answer: selected }
    });
    state.questions = next.questions;
    renderQuestions();
    renderDashboard();
    renderStats();
    toast(next.result.answer_status === "correct" ? "回答正确" : `回答有误，正确答案 ${next.result.correct_answer || "未解析"}`);
  } catch (error) {
    toast(error.message);
  }
}

async function sendChat(event) {
  event.preventDefault();
  const form = event.currentTarget;
  const message = new FormData(form).get("message");
  const payload = { message, context: autoChatContext() };
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

function autoChatContext() {
  return {
    document_ids: filteredDocuments().map(doc => doc.id),
    question_ids: filteredQuestions().slice(0, 12).map(q => q.id),
    knowledge_ids: filteredKnowledge().slice(0, 12).map(item => item.id)
  };
}

async function handleMemoryAction(action) {
  const items = memoryQueue();
  const current = items[state.memoryIndex];
  if (!current) return;
  if (action === "reveal") {
    state.memoryRevealed = true;
    renderMemoryDeck(items);
    return;
  }
  if (action === "prev") {
    state.memoryIndex = Math.max(0, state.memoryIndex - 1);
    state.memoryRevealed = false;
    renderMemoryDeck(items);
    return;
  }
  if (action === "next") {
    state.memoryIndex = Math.min(items.length - 1, state.memoryIndex + 1);
    state.memoryRevealed = false;
    renderMemoryDeck(items);
    return;
  }
  if (action === "learning" || action === "mastered") {
    await updateMemoryStatus(current.id, action);
  }
}

async function updateMemoryStatus(id, memoryStatus) {
  try {
    const next = await api(`/api/knowledge/${id}`, {
      method: "PATCH",
      body: { memory_status: memoryStatus }
    });
    state.knowledge = next.knowledge;
    const queue = memoryQueue();
    if (state.memoryIndex >= queue.length) state.memoryIndex = Math.max(0, queue.length - 1);
    state.memoryRevealed = false;
    renderMemory();
    renderStats();
    renderDashboard();
    toast(memoryStatus === "mastered" ? "已标记为掌握" : "继续复习");
  } catch (error) {
    toast(error.message);
  }
}

function render() {
  ensureSelectedDate();
  syncDigestDateInput();
  renderStats();
  renderDateFilter();
  renderDashboard();
  renderMaterials();
  renderQuestions();
  renderIdioms();
  renderMemory();
  renderImport();
}

function isAllScope() {
  return state.viewScope === "all";
}

function dayBundle() {
  const materials = filteredMaterials();
  const questions = filteredQuestions();
  const idioms = filteredIdioms();
  const memory = filteredMemoryItems();
  const mastered = memory.filter(item => item.memory_status === "mastered").length;
  const answered = questions.filter(q => q.answer_status === "correct" || q.answer_status === "wrong");
  const correct = answered.filter(q => q.answer_status === "correct").length;
  const totalUnits = materials.length + questions.length + idioms.length + memory.length;
  const doneUnits = mastered + correct;
  const completion = totalUnits ? Math.round((doneUnits / totalUnits) * 100) : 0;
  return { materials, questions, idioms, memory, mastered, answered, correct, totalUnits, doneUnits, completion };
}

function renderStats() {
  const day = dayBundle();
  const scopeLabel = isAllScope() ? "全部信息" : (state.selectedDate || "暂无日期");
  $("#topbarSummary").innerHTML = `
    <span>${isAllScope() ? "全部完成度" : "当日完成度"}</span>
    <strong>${day.completion}%</strong>
    <span>${scopeLabel} · 记忆点 ${day.memory.length} · 成语 ${day.idioms.length}</span>
  `;
}

function renderDateFilter() {
  const dates = availableDates();
  const scopeSelect = $("#viewScopeSelect");
  if (scopeSelect) scopeSelect.value = state.viewScope;

  $("#dateSelect").innerHTML = dates.length
    ? dates.map(date => `<option value="${date}" ${date === state.selectedDate ? "selected" : ""}>${date}</option>`).join("")
    : `<option value="">暂无资料</option>`;

  const currentDocs = isAllScope()
    ? state.documents
    : filteredDocuments();
  $("#selectedDateLabel").textContent = isAllScope()
    ? `全部信息 · 共 ${state.documents.length} 份 Word`
    : state.selectedDate
      ? `${state.selectedDate} · ${currentDocs.map(doc => doc.filename).join("、") || "未导入文档"}`
      : "暂无资料";

  const index = dates.indexOf(state.selectedDate);
  const dateLocked = isAllScope();
  $("#prevDateButton").disabled = dateLocked || index === -1 || index >= dates.length - 1;
  $("#nextDateButton").disabled = dateLocked || index <= 0;
  $("#latestDateButton").disabled = dateLocked || !dates.length || index === 0;
  $("#dateSelect").disabled = dateLocked;

  const scopeHint = isAllScope() ? "全部日期" : (state.selectedDate || "当天");
  $("#todayScopeText").textContent = isAllScope()
    ? "正在查看全部导入资料的汇总。"
    : state.selectedDate
      ? `当前日期 ${state.selectedDate}：材料 / 题目 / 成语 / 常识已按结构拆开。`
      : "导入资料后可按日期学习。";
  $("#materialsScopeText").textContent = `显示${scopeHint}的时政热点材料。`;
  $("#questionScopeText").textContent = isAllScope()
    ? "显示全部题目；AI 出题仍建议先切回某一天。"
    : state.selectedDate
      ? `只显示 ${state.selectedDate} 的题目；可作答计分，也可 AI 出题。`
      : "导入资料后可查看题目。";
  $("#idiomsScopeText").textContent = `显示${scopeHint}的成语条目（含每日积累，不含常识）。`;
  $("#memoryScopeText").textContent = `复习${scopeHint}的常识、金句、历史与颁奖辞（不含成语）。`;
}

function renderDashboard() {
  const day = dayBundle();
  const stats = state.stats || {};
  const categoryMap = {
    材料: day.materials.length,
    题目: day.questions.length,
    成语: day.idioms.length,
    常识记忆: day.memory.length,
    待记: day.memory.filter(item => item.memory_status !== "mastered").length
  };
  const maxBar = Math.max(...Object.values(categoryMap), 1);
  const volume = (stats.volume_by_date || []).slice(-14);
  const maxVolume = Math.max(...volume.map(item => item.materials + item.questions + item.knowledge), 1);
  const circumference = 2 * Math.PI * 54;
  const offset = circumference * (1 - day.completion / 100);

  const jumps = [
    { jump: "materials", title: "时政材料", count: day.materials.length, desc: "读当天热点原文" },
    { jump: "questions", title: "题目", count: day.questions.length, desc: "作答或 AI 出题" },
    { jump: "idioms", title: "成语", count: day.idioms.length, desc: "成语 / 词语 / 每日积累" },
    { jump: "memory", title: "常识记忆", count: day.memory.length, desc: "常识、金句与历史上的今天" },
    { jump: "chat", title: "问 AI", count: "→", desc: "基于当天内容答疑" },
    { jump: "import", title: "导入", count: state.documents.length, desc: "Word 或每日积累写入" }
  ];

  $("#dashboardRoot").innerHTML = `
    <div class="dash-top">
      <div class="dash-hero">
        <div class="gauge" aria-label="当日完成度 ${day.completion}%">
          <svg viewBox="0 0 120 120">
            <defs>
              <linearGradient id="gaugeGradient" x1="0%" y1="0%" x2="100%" y2="0%">
                <stop offset="0%" stop-color="#0f766e"></stop>
                <stop offset="100%" stop-color="#2f6fed"></stop>
              </linearGradient>
            </defs>
            <circle class="gauge-track" cx="60" cy="60" r="54"></circle>
            <circle class="gauge-value" cx="60" cy="60" r="54"
              stroke-dasharray="${circumference}"
              stroke-dashoffset="${offset}"></circle>
          </svg>
          <div class="gauge-label">
            <strong>${day.completion}%</strong>
            <span>当日完成</span>
          </div>
        </div>
        <div class="dash-hero-copy">
          <h3>${escapeHtml(isAllScope() ? "全部信息" : (state.selectedDate || "尚未导入"))}</h3>
          <p>
            ${day.totalUnits} 单元 · 材料 ${day.materials.length} · 题 ${day.questions.length} · 成语 ${day.idioms.length} · 常识 ${day.memory.length}
            · 已掌握 ${day.mastered} · 作答 ${day.correct}/${day.answered.length || 0}
            · 全库 ${stats.mastery_rate ?? 0}% · Word ${stats.imported_documents || 0}
          </p>
          <div class="metric-row">
            ${Object.entries(categoryMap).map(([label, value]) => `
              <article class="metric"><span>${escapeHtml(label)}</span><strong>${value}</strong></article>
            `).join("")}
          </div>
        </div>
      </div>
    </div>

    <div class="dash-grid">
      <section class="dash-panel">
        <h3>当日结构占比</h3>
        <div class="bar-chart">
          ${Object.entries(categoryMap).map(([label, value]) => `
            <div class="bar-row">
              <span>${escapeHtml(label)}</span>
              <div class="bar-track"><div class="bar-fill" style="width:${Math.round(value / maxBar * 100)}%"></div></div>
              <strong>${value}</strong>
            </div>
          `).join("")}
        </div>
      </section>
      <section class="dash-panel">
        <div class="dash-panel-head">
          <h3>近两周导入体量</h3>
          <div class="legend">
            <span><i style="background:#0f766e"></i>材料</span>
            <span><i style="background:#2f6fed"></i>题目</span>
            <span><i style="background:#c45c26"></i>知识</span>
          </div>
        </div>
        <div class="volume-chart">
          ${volume.map(item => {
            const total = item.materials + item.questions + item.knowledge;
            const pct = Math.max(total ? Math.round(total / maxVolume * 100) : 6, 6);
            const m = total ? Math.round(item.materials / total * 100) : 0;
            const q = total ? Math.round(item.questions / total * 100) : 0;
            const k = Math.max(0, 100 - m - q);
            return `
              <div class="volume-col" title="${item.date} 材料${item.materials}/题${item.questions}/知识${item.knowledge}">
                <div class="volume-stack" style="height:${pct}%">
                  ${total ? `
                    <div class="volume-seg materials" style="height:${m}%"></div>
                    <div class="volume-seg questions" style="height:${q}%"></div>
                    <div class="volume-seg knowledge" style="height:${k}%"></div>
                  ` : `<div class="volume-seg materials" style="height:100%;opacity:.25"></div>`}
                </div>
                <small>${escapeHtml(item.date.slice(5))}</small>
              </div>
            `;
          }).join("") || `<div class="empty">导入后显示趋势</div>`}
        </div>
      </section>
    </div>

    <div class="jump-grid">
      ${jumps.map(card => `
        <button type="button" class="jump-tile" data-jump="${card.jump}">
          <span>${escapeHtml(card.title)}</span>
          <strong>${escapeHtml(card.count)}</strong>
          <small>${escapeHtml(card.desc)}</small>
        </button>
      `).join("")}
    </div>
  `;
}

function renderMaterials() {
  const keyword = ($("#materialsSearch").value || "").trim().toLowerCase();
  const match = text => !keyword || String(text || "").toLowerCase().includes(keyword);
  const materials = filteredMaterials().filter(item => match([item.title, item.body, item.tags, item.source, item.filename].join(" ")));
  $("#materialsList").innerHTML = materials.length ? materials.map(item => `
    <article class="item-card">
      <h3>${escapeHtml(item.title)}</h3>
      <div class="meta">${escapeHtml(item.doc_date || "")} · ${escapeHtml(item.filename)} · ${escapeHtml(item.source || "未标来源")}</div>
      <p>${escapeHtml(item.body)}</p>
    </article>
  `).join("") : `<div class="empty">当前范围还没有时政材料。</div>`;
}

function renderQuestions() {
  const docs = filteredDocuments();
  $("#generateDocSelect").innerHTML = `<option value="">当前日期全部材料</option>` + docs.map(doc =>
    `<option value="${doc.id}">${escapeHtml(doc.filename)}</option>`
  ).join("");
  const questions = filteredQuestions();
  $("#questionsList").innerHTML = questions.length ? questions.map(q => {
    const status = q.answer_status || "";
    const badge = status === "correct"
      ? `<span class="answer-badge">已答对</span>`
      : status === "wrong"
        ? `<span class="answer-badge wrong">已答错 · 正解 ${escapeHtml(q.answer || "")}</span>`
        : "";
    return `
    <article class="item-card question-card" data-question-id="${q.id}">
      <h3>${escapeHtml(q.question_type)} · ${escapeHtml(q.filename || "AI 生成")} ${badge}</h3>
      <p>${escapeHtml(q.prompt)}</p>
      <div class="options">${(q.options || []).map(option => {
        const selected = String(q.user_answer || "").includes(option.key);
        let klass = "";
        if (status && selected && status === "correct") klass = "is-correct";
        if (status && selected && status === "wrong") klass = "is-wrong";
        if (status === "wrong" && String(q.answer || "").includes(option.key)) klass = "is-correct";
        return `
        <label class="option-row ${klass}">
          <input type="${q.question_type === "多选" ? "checkbox" : "radio"}" name="q-${q.id}" value="${escapeAttr(option.key)}">
          <span>${escapeHtml(option.key)}. ${escapeHtml(option.text)}</span>
        </label>
      `;
      }).join("")}</div>
      <div class="question-actions">
        <button type="button" class="primary" data-check-question="${q.id}">提交答案</button>
      </div>
      <details>
        <summary>查看答案与解析</summary>
        <div class="meta">答案：${escapeHtml(q.answer || "未解析")}</div>
        <p>${escapeHtml(q.explanation || "")}</p>
      </details>
    </article>
  `;
  }).join("") : `<div class="empty">当前范围还没有题目。先导入 Word，或切回某一天后用 AI 生成题。</div>`;
}

function renderIdioms() {
  const keyword = ($("#idiomsSearch").value || "").trim().toLowerCase();
  const match = text => !keyword || String(text || "").toLowerCase().includes(keyword);
  const idioms = filteredIdioms().filter(item => match([item.category, item.title, item.body, item.tags, item.topic, item.filename].join(" ")));
  $("#idiomsList").innerHTML = idioms.length ? idioms.map(item => `
    <article class="item-card">
      <h3>${escapeHtml(item.title)}</h3>
      <div class="meta">
        <span class="topic-tag">${escapeHtml(item.category)}</span>
        ${item.topic ? `<span class="topic-tag">${escapeHtml(item.topic)}</span>` : ""}
        ${escapeHtml(item.filename || "")}
      </div>
      <p>${escapeHtml(item.body)}</p>
    </article>
  `).join("") : `<div class="empty">当前范围还没有成语条目。仅当 Word 出现【成语】【词语】【辨析】段时才会进入本栏；【常识】内容在「常识记忆」。</div>`;
}

function renderMemory() {
  const items = memoryQueue();
  if (state.memoryIndex >= items.length) state.memoryIndex = Math.max(0, items.length - 1);
  renderMemoryDeck(items);
  const listItems = memoryListItems();
  $("#memoryList").innerHTML = listItems.length ? listItems.map(item => `
    <article class="item-card">
      <h3>${escapeHtml(item.category)} · ${escapeHtml(item.title)}</h3>
      <div class="meta">
        ${item.topic ? `<span class="topic-tag">${escapeHtml(item.topic)}</span>` : ""}
        ${escapeHtml(item.doc_date || "")} · ${escapeHtml(item.filename || "")} · ${item.memory_status === "mastered" ? "已掌握" : "待记"}
      </div>
      <p>${escapeHtml(item.body)}</p>
      <div class="chip-row">
        <button type="button" data-memory-id="${item.id}" data-memory-status="learning">标为待记</button>
        <button type="button" class="primary" data-memory-id="${item.id}" data-memory-status="mastered">标为掌握</button>
      </div>
    </article>
  `).join("") : `<div class="empty">当前筛选下没有常识记忆点。</div>`;
}

function renderMemoryDeck(items) {
  if (!items.length) {
    $("#memoryDeck").innerHTML = `<div class="empty">没有可复习的卡片。可切换「全部日期」或把状态改为「全部」。</div>`;
    return;
  }
  const item = items[state.memoryIndex];
  $("#memoryDeck").innerHTML = `
    <article class="memory-card ${state.memoryRevealed ? "revealed" : ""}">
      <div class="memory-progress">${state.memoryIndex + 1} / ${items.length}</div>
      <div class="memory-category">${escapeHtml(item.category)}${item.topic ? ` · ${escapeHtml(item.topic)}` : ""}</div>
      <h3>${escapeHtml(item.title)}</h3>
      <div class="meta">${escapeHtml(item.doc_date || "")} · ${escapeHtml(item.filename || "")}</div>
      ${state.memoryRevealed
        ? `<p class="memory-body">${escapeHtml(item.body)}</p>`
        : `<button type="button" class="primary" data-memory-action="reveal">显示记忆点</button>`}
      <div class="memory-actions">
        <button type="button" data-memory-action="prev" ${state.memoryIndex === 0 ? "disabled" : ""}>上一张</button>
        <button type="button" data-memory-action="learning">还不熟</button>
        <button type="button" class="primary" data-memory-action="mastered">记住了</button>
        <button type="button" data-memory-action="next" ${state.memoryIndex >= items.length - 1 ? "disabled" : ""}>下一张</button>
      </div>
    </article>
  `;
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
      <div class="meta">${escapeHtml(doc.doc_date)} · ${escapeHtml(doc.status)} · 材料 ${doc.parse_summary.articles || 0} · 题目 ${doc.parse_summary.questions || 0} · 知识点 ${doc.parse_summary.knowledge || 0}</div>
      <p>${escapeHtml(doc.ai_validation || doc.error_message || "暂无校验信息")}</p>
    </article>
  `).join("") : `<div class="empty">还没有导入记录。</div>`;
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
    state.memoryIndex = 0;
    state.memoryRevealed = false;
    render();
  }
}

function filteredDocuments() {
  if (isAllScope()) return state.documents;
  return state.selectedDate ? state.documents.filter(doc => doc.doc_date === state.selectedDate) : [];
}

function filteredMaterials() {
  if (isAllScope()) return state.materials;
  const ids = new Set(filteredDocuments().map(doc => doc.id));
  return state.materials.filter(item => ids.has(item.document_id));
}

function filteredQuestions() {
  if (isAllScope()) return state.questions;
  const ids = new Set(filteredDocuments().map(doc => doc.id));
  const date = state.selectedDate;
  return state.questions.filter(item => ids.has(item.document_id) || (item.doc_date && item.doc_date === date));
}

function filteredKnowledge() {
  if (isAllScope()) return state.knowledge;
  const ids = new Set(filteredDocuments().map(doc => doc.id));
  return state.knowledge.filter(item => ids.has(item.document_id));
}

function isIdiomItem(item) {
  const cat = String(item.category || "").trim();
  const kind = String(item.kind || "").trim();
  if (kind === "idiom" || kind === "term") return true;
  return cat === "成语" || cat === "词语" || cat === "辨析";
}

function filteredIdioms() {
  return filteredKnowledge().filter(isIdiomItem);
}

function filteredMemoryItems() {
  return filteredKnowledge().filter(item => !isIdiomItem(item));
}

function memorySourceItems() {
  return filteredMemoryItems();
}

function memoryListItems() {
  const status = $("#memoryStatusFilter")?.value || "learning";
  return memorySourceItems().filter(item => status === "all" || (item.memory_status || "learning") === status);
}

function memoryQueue() {
  return memoryListItems();
}

function appendChatMessage(role, content) {
  const target = $("#chatMessages");
  target.insertAdjacentHTML("beforeend", `<div class="chat-message ${role}">${escapeHtml(content)}</div>`);
  target.scrollTop = target.scrollHeight;
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

function formatBytes(bytes) {
  const value = Number(bytes || 0);
  return value > 1024 ? `${Math.round(value / 1024)} KB` : `${value} B`;
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
