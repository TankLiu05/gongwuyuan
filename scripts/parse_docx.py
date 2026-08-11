#!/usr/bin/env python3
import json
import re
import sys
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

NS = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}


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
    text = "\n".join(paragraphs[:5])
    match = re.search(r"(\d{1,2})月(\d{1,2})日", text) or re.search(r"每日时政(\d{1,2})\.(\d{1,2})", filename)
    if not match:
        return ""
    return f"2026-{int(match.group(1)):02d}-{int(match.group(2)):02d}"


def section_ranges(paragraphs):
    ranges = {}
    for i, text in enumerate(paragraphs):
        if re.match(r"一、.*(时政热点|时政要闻|今日时政)", text):
            ranges["articles"] = i
        elif re.match(r"二、历史上的今天", text):
            ranges["history"] = i
        elif re.match(r"三、时政自测题", text):
            ranges["questions"] = i
        elif "参考答案" in text and "answers" not in ranges:
            ranges["answers"] = i
        elif re.search(r"【\s*(常识|成语|词语|辨析)\s*】", text) and "knowledge" not in ranges:
            ranges["knowledge"] = i
    return ranges


def end_at(*values):
    vals = [v for v in values if v is not None]
    return min(vals) if vals else None


def parse_articles(paragraphs, ranges, doc_date):
    start = ranges.get("articles")
    if start is None:
        return []
    end = end_at(ranges.get("history"), ranges.get("questions"), ranges.get("knowledge")) or len(paragraphs)
    lines = paragraphs[start + 1 : end]
    articles = []
    current = None
    for line in lines:
        match = re.match(r"^(\d+)[、.．]\s*(.+)", line)
        if match:
            if current:
                articles.append(finalize_article(current, doc_date))
            current = {"order": int(match.group(1)), "title": match.group(2).strip(), "body_lines": []}
        elif current:
            current["body_lines"].append(line)
    if current:
        articles.append(finalize_article(current, doc_date))
    return articles


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
        "tags": "",
    }


def parse_answers(lines):
    text = "\n".join(lines)
    answers = {}
    for number, answer in re.findall(r"(\d+)\s*[、.．]\s*([A-Fa-f]+|正确|错误|对|错)", text):
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
        match = re.match(r"^(\d+)[、.．]\s*(?:【([^】]+)】)?\s*(.+)", line)
        option = re.match(r"^([A-F])[.．、]\s*(.+)", line, flags=re.I)
        if match and "参考答案" not in line:
            if current:
                questions.append(current)
            current = {
                "order": int(match.group(1)),
                "question_type": (match.group(2) or "单选").strip(),
                "prompt_lines": [match.group(3).strip()],
                "options": [],
                "answer": answers.get(int(match.group(1)), ""),
                "explanation": "",
                "tags": "",
            }
        elif option and current:
            current["options"].append({"key": option.group(1).upper(), "text": option.group(2).strip()})
        elif current:
            current["prompt_lines"].append(line)
    if current:
        questions.append(current)
    for item in questions:
        item["prompt"] = "\n".join(item.pop("prompt_lines")).strip()
    return questions


def parse_knowledge(paragraphs, ranges):
    items = []
    order = 1
    history = ranges.get("history")
    questions = ranges.get("questions")
    if history is not None:
        end = questions or len(paragraphs)
        body = "\n".join(paragraphs[history + 1 : end]).strip()
        if body:
            items.append({"order": order, "category": "历史上的今天", "title": "历史上的今天", "body": body, "tags": ""})
            order += 1

    start = ranges.get("knowledge")
    if start is not None:
        title_line = paragraphs[start]
        category_match = re.search(r"【\s*(常识|成语|词语|辨析)\s*】", title_line)
        category = category_match.group(1) if category_match else "常识"
        title = re.sub(r"【\s*(常识|成语|词语|辨析)\s*】", "", title_line).strip() or category
        body = "\n".join(paragraphs[start + 1 :]).strip()
        items.append({"order": order, "category": category, "title": title, "body": body, "tags": ""})
        order += 1

    for i, line in enumerate(paragraphs):
        if i == start:
            continue
        if re.search(r"(成语|词语|辨析)", line) and re.match(r"^[一二三四五六七八九十\d]+[、.．]|^【", line):
            body_lines = []
            for later in paragraphs[i + 1 :]:
                if re.match(r"^[一二三四五六七八九十\d]+[、.．]|^【", later):
                    break
                body_lines.append(later)
            if body_lines:
                items.append({"order": order, "category": "成语/词语", "title": line, "body": "\n".join(body_lines), "tags": ""})
                order += 1
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
    return {
        "filename": source.name,
        "doc_date": doc_date,
        "paragraphs": paragraphs,
        "articles": articles,
        "questions": questions,
        "knowledge": knowledge,
        "warnings": warnings,
    }


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: parse_docx.py FILE.docx")
    print(json.dumps(parse(sys.argv[1]), ensure_ascii=False))
