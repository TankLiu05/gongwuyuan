#!/usr/bin/env python3
"""Parse 每日时政 .docx into structured articles / questions / knowledge atoms."""
import json
import re
import sys
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

NS = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}

KNOWLEDGE_HEADER_RE = re.compile(
    r"【\s*(常识积累|常识|成语|词语|辨析|颁奖辞|拓展)\s*】"
)
SECTION_ARTICLE_RE = re.compile(r"^[一二三四五六七八九十]+[、.．].*(时政热点|时政要闻|今日时政)")
SECTION_HISTORY_RE = re.compile(r"^[一二三四五六七八九十]+[、.．]\s*历史上的今天")
SECTION_QUESTIONS_RE = re.compile(r"^[一二三四五六七八九十]+[、.．]\s*时政自测题")
ARTICLE_START_RE = re.compile(r"^(\d+)\s*[、.．]\s*(.+)$")
GLUED_ARTICLE_RE = re.compile(r"[）)]\s*(\d+)\s*[、.．]\s*(.+)$")
QUESTION_START_RE = re.compile(
    r"^(\d+)\s*[、.．]?\s*(?:【\s*([^】]+?)\s*】)?\s*(.+)$"
)
OPTION_RE = re.compile(r"^([A-F])\s*[.．、]\s*(.+)$", re.I)
ANSWER_RE = re.compile(r"(\d+)\s*[、.．]\s*([A-Fa-f]+|正确|错误|对|错)")
CN_SECTION_RE = re.compile(r"^([一二三四五六七八九十百]+)\s*[、.．]\s*(.+)$")
NUM_ITEM_RE = re.compile(r"^(\d+)\s*[、.．]\s*(.+)$")
TERM_LINE_RE = re.compile(
    r"^(\d+)\s*[、.．]\s*"
    r"([^\s：:（(]{1,12})"
    r"(?:\s*[（(]([^）)]*)[）)])?"
    r"\s*[：:．.、]\s*"
    r"(.+)$"
)
PINYIN_TERM_RE = re.compile(
    r"^(\d+)\s*[、.．]\s*"
    r"([\u4e00-\u9fff]{1,8})"
    r"\s*[（(]([a-zāáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜü\s]+)[）)]"
    r"\s*[：:．.、]?\s*"
    r"(.+)$",
    re.I,
)
PUNCT_SPLIT_RE = re.compile(r"(?<=[。；;])\s*(?=\d+\s*[、.．])")


def paragraph_text(paragraph):
    parts = []
    for node in paragraph.iter():
        if node.tag == f"{{{NS['w']}}}t" and node.text:
            parts.append(node.text)
        elif node.tag == f"{{{NS['w']}}}tab":
            parts.append(" ")
    return "".join(parts).strip()


def read_paragraphs(path):
    with zipfile.ZipFile(path) as docx:
        xml = docx.read("word/document.xml")
    root = ET.fromstring(xml)
    return [text for text in (paragraph_text(p) for p in root.findall(".//w:p", NS)) if text]


def date_from_text(filename, paragraphs):
    text = "\n".join(paragraphs[:8])
    match = re.search(r"(\d{1,2})月(\d{1,2})日", text) or re.search(
        r"每日时政(\d{1,2})\.(\d{1,2})", filename
    )
    if not match:
        return ""
    year_match = re.search(r"(20\d{2})", text)
    year = year_match.group(1) if year_match else "2026"
    return f"{year}-{int(match.group(1)):02d}-{int(match.group(2)):02d}"


def section_ranges(paragraphs):
    ranges = {}
    knowledge_starts = []
    for i, text in enumerate(paragraphs):
        if SECTION_ARTICLE_RE.match(text) and "articles" not in ranges:
            ranges["articles"] = i
        elif SECTION_HISTORY_RE.match(text) and "history" not in ranges:
            ranges["history"] = i
        elif SECTION_QUESTIONS_RE.match(text) and "questions" not in ranges:
            ranges["questions"] = i
        elif "参考答案" in text and "answers" not in ranges:
            ranges["answers"] = i
        elif KNOWLEDGE_HEADER_RE.search(text):
            knowledge_starts.append(i)
            if "knowledge" not in ranges:
                ranges["knowledge"] = i
    ranges["knowledge_starts"] = knowledge_starts
    return ranges


def end_at(*values):
    vals = [v for v in values if v is not None]
    return min(vals) if vals else None


def finalize_article(item, doc_date):
    body = "\n".join(item.pop("body_lines")).strip()
    source = ""
    match = re.search(r"[（(]时政来源：([^）)]+)[）)]", body)
    if match:
        source = match.group(1).strip()
    return {
        "order": item["order"],
        "title": item["title"],
        "body": body,
        "source": source,
        "doc_date": doc_date,
        "tags": "时政热点",
        "kind": "material",
    }


def maybe_split_glued(line):
    """Split '...来源：人民网）5.下一标题' into body remnant + new article title."""
    match = GLUED_ARTICLE_RE.search(line)
    if not match:
        return line, None
    before = line[: match.start() + 1].strip()
    return before, {"order": int(match.group(1)), "title": match.group(2).strip(), "body_lines": []}


def parse_articles(paragraphs, ranges, doc_date):
    start = ranges.get("articles")
    if start is None:
        return []
    end = end_at(ranges.get("history"), ranges.get("questions"), ranges.get("knowledge")) or len(
        paragraphs
    )
    lines = paragraphs[start + 1 : end]
    articles = []
    current = None
    orphan_buffer = []

    def flush_current():
        nonlocal current
        if current:
            if orphan_buffer and not current["body_lines"]:
                # Rare: title-less block before first numbered item absorbed later.
                pass
            articles.append(finalize_article(current, doc_date))
            current = None

    for line in lines:
        match = ARTICLE_START_RE.match(line)
        if match:
            flush_current()
            current = {
                "order": int(match.group(1)),
                "title": match.group(2).strip(),
                "body_lines": [],
            }
            continue

        body_part, glued = maybe_split_glued(line)
        if current is None:
            orphan_buffer.append(line)
            continue

        if glued:
            if body_part and body_part not in "）)":
                current["body_lines"].append(body_part)
            flush_current()
            current = glued
            continue

        # Recover missing numbers: after a source line, a non-continuation line is a new title.
        if (
            current["body_lines"]
            and re.search(r"[（(]时政来源：", current["body_lines"][-1])
            and not re.match(r"^[（(]|^[A-F][.．、]", line)
            and len(line) <= 60
            and not line.endswith("。")
        ):
            flush_current()
            guessed_order = (articles[-1]["order"] + 1) if articles else 1
            current = {"order": guessed_order, "title": line.strip(), "body_lines": []}
            continue

        current["body_lines"].append(line)

    flush_current()
    # Rebuild consecutive orders if we guessed.
    for idx, article in enumerate(articles, start=1):
        article["order"] = idx
    return articles


def parse_answers(lines):
    text = "\n".join(lines)
    answers = {}
    for number, answer in ANSWER_RE.findall(text):
        answers[int(number)] = answer.upper()
    return answers


def parse_questions(paragraphs, ranges):
    start = ranges.get("questions")
    if start is None:
        return []
    answer_start = ranges.get("answers")
    end = answer_start if answer_start is not None else (ranges.get("knowledge") or len(paragraphs))
    question_lines = paragraphs[start + 1 : end]
    answer_end = ranges.get("knowledge") or len(paragraphs)
    answers = parse_answers(paragraphs[(answer_start or end) : answer_end])

    questions = []
    current = None
    for line in question_lines:
        if "参考答案" in line:
            break
        option = OPTION_RE.match(line)
        # Prefer option match when line is clearly an option.
        if option and current and re.match(r"^[A-F]\s*[.．、]", line, flags=re.I):
            current["options"].append(
                {"key": option.group(1).upper(), "text": option.group(2).strip()}
            )
            continue

        match = QUESTION_START_RE.match(line)
        looks_like_question = False
        if match:
            qtype = (match.group(2) or "").strip()
            rest = match.group(3).strip()
            # Accept "1【单选】..." / "1、【单选】..." / "1.【单选】..."
            if qtype or rest.startswith("【") or "（" in rest or "( " in rest or "（ " in rest:
                looks_like_question = True
            elif re.match(r"^【", rest) or "单选" in line or "多选" in line or "判断" in line:
                looks_like_question = True
            elif current is None or (match.group(1) and int(match.group(1)) == len(questions) + 1):
                # Numbered stem without bracket type, common in some days.
                looks_like_question = bool(re.search(r"[（(]\s*[）)]|[（(]_+[）)]|_{2,}", rest)) or (
                    len(rest) > 12 and not OPTION_RE.match(line)
                )

        if match and looks_like_question:
            if current:
                questions.append(current)
            q_order = int(match.group(1))
            q_type = (match.group(2) or "").strip()
            prompt_head = match.group(3).strip()
            if not q_type:
                type_match = re.match(r"^【\s*([^】]+?)\s*】\s*(.+)$", prompt_head)
                if type_match:
                    q_type = type_match.group(1).strip()
                    prompt_head = type_match.group(2).strip()
            current = {
                "order": q_order,
                "question_type": q_type or "单选",
                "prompt_lines": [prompt_head],
                "options": [],
                "answer": answers.get(q_order, ""),
                "explanation": "",
                "tags": "原题",
                "kind": "question",
            }
            continue

        if option and current:
            current["options"].append(
                {"key": option.group(1).upper(), "text": option.group(2).strip()}
            )
        elif current:
            current["prompt_lines"].append(line)

    if current:
        questions.append(current)
    for item in questions:
        item["prompt"] = "\n".join(item.pop("prompt_lines")).strip()
    return questions


def expand_inline_numbered(lines):
    """Split lines that glue multiple numbered points: '5.xxx；6.yyy'."""
    expanded = []
    for line in lines:
        parts = PUNCT_SPLIT_RE.split(line)
        if len(parts) > 1:
            expanded.extend(p.strip() for p in parts if p.strip())
        else:
            # Also split bare '6.xxx' glued without punctuation before digit.
            soft = re.split(r"(?<=[；;。])(?=\d+\s*[、.．])|(?<=[^0-9])(?=\d+\s*[、.．][^\d])", line)
            if len(soft) > 1 and sum(1 for p in soft if NUM_ITEM_RE.match(p.strip())) >= 2:
                expanded.extend(p.strip() for p in soft if p.strip())
            else:
                expanded.append(line)
    return expanded


def classify_knowledge_category(header_label, title, body_sample=""):
    """按 Word 段标题归类：常识归常识，成语归成语，互不串类。"""
    label = (header_label or "").strip()
    if label == "成语":
        return "成语"
    if label in ("词语", "辨析"):
        return "词语"
    if label == "颁奖辞" or "颁奖辞" in (title or ""):
        return "颁奖辞"
    if label == "拓展":
        return "拓展"
    # 【常识】【常识积累】以及未知标题一律当常识，不因「雅称」等改判词语
    if label in ("常识", "常识积累") or not label:
        return "常识"
    return "常识"


def make_knowledge(order, category, title, body, topic="", tags=""):
    body = (body or "").strip()
    title = (title or category).strip()
    if not body and not title:
        return None
    fingerprint = f"{category}|{topic}|{title}|{body[:80]}"
    return {
        "order": order,
        "category": category,
        "title": title,
        "body": body or title,
        "topic": topic or title,
        "tags": tags or category,
        "kind": {
            "历史上的今天": "history",
            "常识": "common",
            "词语": "term",
            "成语": "idiom",
            "颁奖辞": "award",
            "拓展": "extension",
        }.get(category, "common"),
        "fingerprint": fingerprint,
    }


def split_history_items(lines, start_order):
    items = []
    order = start_order
    for line in lines:
        text = line.strip()
        if not text or text.startswith("——") or text.startswith("—"):
            continue
        text = re.sub(r"^[•·\-—]+\s*", "", text)
        items.append(
            make_knowledge(order, "历史上的今天", text[:40] + ("…" if len(text) > 40 else ""), text, topic="历史上的今天", tags="历史")
        )
        order += 1
    return [x for x in items if x], order


def split_award_items(lines, topic, start_order):
    items = []
    order = start_order
    current = None

    def flush():
        nonlocal current, order
        if not current:
            return
        body = "\n".join(current["lines"]).strip()
        item = make_knowledge(order, "颁奖辞", current["title"], body, topic=topic, tags="颁奖辞")
        if item:
            items.append(item)
            order += 1
        current = None

    for line in lines:
        person = CN_SECTION_RE.match(line)
        award = re.match(r"^【\s*颁奖辞\s*】\s*(.*)$", line)
        if person and ("（" in line or "(" in line or len(person.group(2)) <= 40):
            flush()
            current = {"title": person.group(2).strip(), "lines": []}
            continue
        if award:
            if current is None:
                current = {"title": topic or "颁奖辞", "lines": []}
            text = award.group(1).strip()
            current["lines"].append(("颁奖辞：" + text) if text else "颁奖辞：")
            continue
        if current is None:
            current = {"title": topic or "颁奖辞", "lines": [line]}
        else:
            current["lines"].append(line)
    flush()
    return items, order


def looks_like_term_block(title, lines):
    """是否适合拆成短词/短条记忆点（不改变 category）。"""
    if re.search(r"雅称|别称|又称", title or ""):
        return True
    expanded = expand_inline_numbered(lines)
    pinyin_hits = sum(1 for line in expanded if PINYIN_TERM_RE.match(line))
    if pinyin_hits >= 3:
        return True
    short_defs = 0
    for line in expanded:
        m = TERM_LINE_RE.match(line)
        if not m:
            continue
        word = m.group(2).strip()
        if len(word) <= 6 and not re.search(r"传播|检测|症状|治疗|简介", word):
            short_defs += 1
    return short_defs >= 5


def split_term_items(lines, topic, category, start_order):
    items = []
    order = start_order
    tag = category
    for line in expand_inline_numbered(lines):
        m = PINYIN_TERM_RE.match(line) or TERM_LINE_RE.match(line)
        if m:
            title = m.group(2).strip()
            if PINYIN_TERM_RE.match(line):
                pinyin = (m.group(3) or "").strip()
                body = (m.group(4) or "").strip()
            else:
                pinyin = (m.group(3) or "").strip()
                body = (m.group(4) or "").strip()
            body = re.sub(r"^[：:．.、\s]+", "", body)
            if pinyin:
                body = f"（{pinyin}）{body}".strip()
            item = make_knowledge(order, category, title, body or title, topic=topic, tags=tag)
            if item:
                items.append(item)
                order += 1
            continue
        num = NUM_ITEM_RE.match(line)
        if num and re.search(r"[：:]", num.group(2)):
            title, body = re.split(r"[：:]", num.group(2), maxsplit=1)
            item = make_knowledge(
                order, category, title.strip(), body.strip() or title.strip(), topic=topic, tags=tag
            )
            if item:
                items.append(item)
                order += 1
            continue
        if items and line.strip():
            items[-1]["body"] = (items[-1]["body"] + "\n" + line).strip()
    return items, order


def split_common_items(lines, topic, category, start_order):
    """Split 常识 into section/number atoms; keep whole block if unstructured."""
    lines = expand_inline_numbered(lines)
    # Drop pure summary banners into last item later.
    section_starts = [i for i, line in enumerate(lines) if CN_SECTION_RE.match(line)]
    number_starts = [i for i, line in enumerate(lines) if NUM_ITEM_RE.match(line)]

    items = []
    order = start_order

    if len(section_starts) >= 2:
        bounds = section_starts + [len(lines)]
        for i, start in enumerate(section_starts):
            end = bounds[i + 1]
            head = CN_SECTION_RE.match(lines[start])
            title = head.group(2).strip()
            body = "\n".join(lines[start + 1 : end]).strip()
            if not body:
                body = title
            item = make_knowledge(order, category, title, body, topic=topic, tags="常识")
            if item:
                items.append(item)
                order += 1
        return items, order

    if len(number_starts) >= 3:
        bounds = number_starts + [len(lines)]
        preface = "\n".join(lines[: number_starts[0]]).strip()
        for i, start in enumerate(number_starts):
            end = bounds[i + 1]
            head = NUM_ITEM_RE.match(lines[start])
            rest = head.group(2).strip()
            if "：" in rest or ":" in rest:
                title, first = re.split(r"[：:]", rest, maxsplit=1)
                title, first = title.strip(), first.strip()
                body_lines = [first] if first else []
            else:
                title = rest if len(rest) <= 24 else rest[:24] + "…"
                body_lines = [] if len(rest) <= 24 else [rest]
            body_lines.extend(lines[start + 1 : end])
            body = "\n".join(x for x in body_lines if x is not None).strip()
            if preface and i == 0:
                body = (preface + ("\n" + body if body else "")).strip()
            item = make_knowledge(order, category, title, body or title, topic=topic, tags="常识")
            if item:
                items.append(item)
                order += 1
        return items, order

    body = "\n".join(lines).strip()
    if body:
        items.append(make_knowledge(order, category, topic, body, topic=topic, tags="常识"))
        order += 1
    return items, order


def parse_knowledge_blocks(paragraphs, ranges):
    starts = ranges.get("knowledge_starts") or []
    if not starts and ranges.get("knowledge") is not None:
        starts = [ranges["knowledge"]]
    blocks = []
    for idx, start in enumerate(starts):
        end = starts[idx + 1] if idx + 1 < len(starts) else len(paragraphs)
        header = paragraphs[start]
        label_match = KNOWLEDGE_HEADER_RE.search(header)
        label = label_match.group(1) if label_match else "常识"
        title = KNOWLEDGE_HEADER_RE.sub("", header).strip().strip("“”\"'") or label
        body_lines = paragraphs[start + 1 : end]
        blocks.append({"label": label, "title": title, "lines": body_lines})
    return blocks


def parse_knowledge(paragraphs, ranges):
    items = []
    order = 1

    history = ranges.get("history")
    if history is not None:
        end = ranges.get("questions") or ranges.get("knowledge") or len(paragraphs)
        hist_items, order = split_history_items(paragraphs[history + 1 : end], order)
        items.extend(hist_items)

    for block in parse_knowledge_blocks(paragraphs, ranges):
        label = block["label"]
        title = block["title"]
        lines = [ln for ln in block["lines"] if ln.strip()]
        if not lines and not title:
            continue

        if label == "颁奖辞" or any("颁奖辞" in ln for ln in lines[:3]):
            award_items, order = split_award_items(
                [f"【颁奖辞】{title}"] + lines if label == "颁奖辞" and title and title != "颁奖辞" else lines,
                topic=title,
                start_order=order,
            )
            items.extend(award_items)
            continue

        if label == "拓展":
            body = "\n".join(lines).strip() or title
            item = make_knowledge(order, "拓展", title if title != "拓展" else "拓展知识点", body, topic=title, tags="拓展")
            if item:
                items.append(item)
                order += 1
            continue

        category = classify_knowledge_category(label, title, "\n".join(lines[:40]))
        cn_sections = sum(1 for line in lines if CN_SECTION_RE.match(line))

        # 常识：可拆卡片，但类别始终是常识
        if category == "常识":
            if cn_sections >= 2:
                common_items, order = split_common_items(lines, title, "常识", order)
                items.extend(common_items)
            elif looks_like_term_block(title, lines):
                term_items, order = split_term_items(lines, title, "常识", order)
                if term_items:
                    items.extend(term_items)
                else:
                    body = "\n".join(lines).strip()
                    item = make_knowledge(order, "常识", title, body, topic=title, tags="常识")
                    if item:
                        items.append(item)
                        order += 1
            else:
                common_items, order = split_common_items(lines, title, "常识", order)
                items.extend(common_items)
            continue

        # 成语 / 词语：只在 Word 明确标了【成语】【词语】【辨析】时进入成语栏
        if category in ("成语", "词语"):
            term_items, order = split_term_items(lines, title, category, order)
            if term_items:
                items.extend(term_items)
            else:
                body = "\n".join(lines).strip()
                item = make_knowledge(order, category, title, body, topic=title, tags=category)
                if item:
                    items.append(item)
                    order += 1
            continue

        common_items, order = split_common_items(lines, title, category, order)
        items.extend(common_items)

    return items


def parse(path):
    source = Path(path)
    paragraphs = read_paragraphs(source)
    ranges = section_ranges(paragraphs)
    doc_date = date_from_text(source.name, paragraphs)
    articles = parse_articles(paragraphs, ranges, doc_date)
    questions = parse_questions(paragraphs, ranges)
    knowledge = parse_knowledge(paragraphs, ranges)
    warnings = []
    if ranges.get("questions") is not None and not questions:
        warnings.append("发现自测题标题，但未解析出题目")
    missing = [str(q["order"]) for q in questions if not q.get("answer")]
    if missing:
        warnings.append("题目缺少参考答案：" + "、".join(missing))
    odd_options = [str(q["order"]) for q in questions if len(q.get("options") or []) > 8]
    if odd_options:
        warnings.append("题目选项异常偏多：" + "、".join(odd_options))
    return {
        "filename": source.name,
        "doc_date": doc_date,
        "paragraphs": paragraphs,
        "articles": articles,
        "questions": questions,
        "knowledge": knowledge,
        "warnings": warnings,
        "section_map": {k: v for k, v in ranges.items() if k != "knowledge_starts"},
    }


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: parse_docx.py FILE.docx")
    print(json.dumps(parse(sys.argv[1]), ensure_ascii=False))
