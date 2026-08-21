-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.11.docx
-- doc_date: 2026-08-11
-- generated_at: 2026-08-21T08:42:54.227Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.11.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.11.docx',
  '2026-08-11',
  '05ab6af6e2f47534f4585df88835ff91cd4f4c3a00645f5bdf6994d6064df879',
  'imported',
  '{"paragraphs":83,"articles":5,"questions":5,"knowledge":35,"warnings":[]}',
  '本地规则重解析完成',
  '',
  CURRENT_TIMESTAMP
)
ON CONFLICT(filename) DO UPDATE SET
  file_path = excluded.file_path,
  doc_date = excluded.doc_date,
  file_hash = excluded.file_hash,
  status = 'imported',
  parse_summary = excluded.parse_summary,
  ai_validation = excluded.ai_validation,
  error_message = '',
  imported_at = CURRENT_TIMESTAMP,
  updated_at = CURRENT_TIMESTAMP;

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  1,
  '南水北调东中线一期工程调水超900亿立方米',
  '截至2026年8月10日，南水北调东中线一期工程调水超900亿立方米。其中中线一期工程调水超800.5亿立方米，东线一期工程调水超99.5亿立方米。（时政来源：央视网）',
  '央视网',
  '2026-08-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  2,
  '2026能源经济与碳达峰碳中和高质量发展论坛综述',
  '2026能源经济与碳达峰碳中和高质量发展论坛8月6日在陕西省榆林市举行。论坛以“向新 向绿 向未来”为主题，搭建对话交流平台，共享绿色转型经验，为加快经济社会发展全面绿色转型、能源经济高质量发展进一步凝聚共识、汇聚力量。（时政来源：人民网）',
  '人民网',
  '2026-08-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  3,
  '国防部征兵办公室印发征兵工作人员职业道德准则',
  '2026年8月，国防部征兵办公室印发《征兵工作人员职业道德准则》，内容向社会公开，自公布之日起施行。
准则共5个部分，提出对党忠诚、胸怀大局，依法履职、阳光选才，心系国防、坚持标准，廉洁自律、不谋私利，团结协作、热忱服务的征兵工作人员职业道德准则。（时政来源：人民网）',
  '人民网',
  '2026-08-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  4,
  '中国代表队首次参加国际核科学奥赛 获一金三银',
  '2026年国际核科学奥林匹克竞赛8月8日晚在沙特阿拉伯西部城市吉达闭幕，中国代表队首次参赛，4名选手获得一金三银，总成绩居参赛国家前列。（时政来源：人民网）',
  '人民网',
  '2026-08-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  5,
  '中国第16次北冰洋考察队“雪龙2”号开始冰站调查作业',
  '北京时间2026年8月9日11时许，中国第16次北冰洋考察队“雪龙2”号在北纬84度附近的北冰洋中央区开始航次首次冰站调查作业，标志着为期约半个月的冰站综合调查正式拉开帷幕。（时政来源：人民网）',
  '人民网',
  '2026-08-11',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  1,
  'document',
  '单选',
  '截至2026年8月10日，南水北调（  ）调水超900亿立方米。',
  '[{"key":"A","text":"中线一期工程"},{"key":"B","text":"东线一期工程"},{"key":"C","text":"东中线一期工程"},{"key":"D","text":"西线工程"}]',
  'C',
  '',
  '原题',
  '2026-08-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  2,
  'document',
  '单选',
  '2026能源经济与碳达峰碳中和高质量发展论坛8月6日在陕西省榆林市举行，论坛以（  ）为主题。',
  '[{"key":"A","text":"“构建新型能源体系，赋能绿色低碳转型”"},{"key":"B","text":"“向新 向绿 向未来”"},{"key":"C","text":"“能源革新引领双碳落地，绿色发展驱动产业升级”"},{"key":"D","text":"“节能 降碳 促发展”"}]',
  'B',
  '',
  '原题',
  '2026-08-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  3,
  'document',
  '单选',
  '2026年8月，国防部征兵办公室印发《征兵工作人员职业道德准则》，内容向社会公开，自公布之日起施行。征兵工作人员职业道德准则包括（  ）。
①对党忠诚、胸怀大局
②依法履职、阳光选才
③心系国防、坚持标准
④廉洁自律、不谋私利
⑤团结协作、热忱服务',
  '[{"key":"A","text":"①②③④⑤"},{"key":"B","text":"仅①②④⑤"},{"key":"C","text":"仅①③④⑤"},{"key":"D","text":"仅①②③④"}]',
  'A',
  '',
  '原题',
  '2026-08-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  4,
  'document',
  '单选',
  '2026年国际核科学奥林匹克竞赛8月8日晚在沙特阿拉伯西部城市吉达闭幕，中国代表队首次参赛，4名选手获得（  ），总成绩居参赛国家前列。',
  '[{"key":"A","text":"一金一银两铜"},{"key":"B","text":"两金一银一铜"},{"key":"C","text":"一金三银"},{"key":"D","text":"两金两银"}]',
  'C',
  '',
  '原题',
  '2026-08-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  5,
  'document',
  '单选',
  '北京时间2026年8月9日11时许，中国第16次北冰洋考察队（  ）在北纬84度附近的北冰洋中央区开始航次首次冰站调查作业，标志着为期约半个月的冰站综合调查正式拉开帷幕。',
  '[{"key":"A","text":"“中山大学极地”号"},{"key":"B","text":"“探索三号”"},{"key":"C","text":"“极地”号"},{"key":"D","text":"“雪龙2”号"}]',
  'D',
  '',
  '原题',
  '2026-08-11'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  1,
  '历史上的今天',
  '1872年中国第一批留学生启程赴美',
  '1872年中国第一批留学生启程赴美',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1872年中国第一批留学生启程赴美|1872年中国第一批留学生启程赴美',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  2,
  '历史上的今天',
  '1902年中国第一所专业艺术学校成立',
  '1902年中国第一所专业艺术学校成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1902年中国第一所专业艺术学校成立|1902年中国第一所专业艺术学校成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  3,
  '历史上的今天',
  '1912年国民党成立',
  '1912年国民党成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1912年国民党成立|1912年国民党成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  4,
  '历史上的今天',
  '1943年第一次魁北克会议召开',
  '1943年第一次魁北克会议召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1943年第一次魁北克会议召开|1943年第一次魁北克会议召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  5,
  '历史上的今天',
  '1945年我国第一次使用“解放军”名称',
  '1945年我国第一次使用“解放军”名称',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年我国第一次使用“解放军”名称|1945年我国第一次使用“解放军”名称',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  6,
  '常识',
  '陵',
  '（líng）通常指大型的墓地或陵墓，也可以指高耸的土堆或山丘',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|陵|（líng）通常指大型的墓地或陵墓，也可以指高耸的土堆或山丘',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  7,
  '常识',
  '岗',
  '（gǎng）地势较高的土堆；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岗|（gǎng）地势较高的土堆；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  8,
  '常识',
  '山',
  '（shān）高耸且规模较大的土堆；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|山|（shān）高耸且规模较大的土堆；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  9,
  '常识',
  '峦',
  '（luán）规模较小，但是顶部比较尖的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|峦|（luán）规模较小，但是顶部比较尖的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  10,
  '常识',
  '岘',
  '（xiàn）规模较小，却比较险峻的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岘|（xiàn）规模较小，却比较险峻的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  11,
  '常识',
  '岑',
  '（cén）规模较小，相对周边却地形高耸的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岑|（cén）规模较小，相对周边却地形高耸的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  12,
  '常识',
  '岵',
  '（hù）草木较多的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岵|（hù）草木较多的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  13,
  '常识',
  '矶',
  '（jī）水边突出的岩石或江河当中的石滩；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|矶|（jī）水边突出的岩石或江河当中的石滩；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  14,
  '常识',
  '峰',
  '（fēng）山体突出的尖顶；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|峰|（fēng）山体突出的尖顶；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  15,
  '常识',
  '岳',
  '（yuè）巍峨高大的群山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岳|（yuè）巍峨高大的群山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  16,
  '常识',
  '谷',
  '（gǔ）两山或两块高地中间的低洼地带；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|谷|（gǔ）两山或两块高地中间的低洼地带；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  17,
  '常识',
  '峭',
  '（qiào）高大而地势较陡的山体；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|峭|（qiào）高大而地势较陡的山体；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  18,
  '常识',
  '嶂',
  '（zhàng）高大而险峻的山体；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|嶂|（zhàng）高大而险峻的山体；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  19,
  '常识',
  '崖',
  '（yá）山体陡立的侧面；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|崖|（yá）山体陡立的侧面；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  20,
  '常识',
  '峡',
  '（xiá）两山相对的有水地带；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|峡|（xiá）两山相对的有水地带；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  21,
  '常识',
  '岬',
  '（jiǎ）两山相对的无水地带；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岬|（jiǎ）两山相对的无水地带；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  22,
  '常识',
  '屺',
  '（qǐ）草木不生的山体；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|屺|（qǐ）草木不生的山体；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  23,
  '常识',
  '峻',
  '（jùn）地势较高而陡峭的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|峻|（jùn）地势较高而陡峭的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  24,
  '常识',
  '岭',
  '（lǐng）顶端有路且有人通行的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岭|（lǐng）顶端有路且有人通行的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  25,
  '常识',
  '崮',
  '（gù）四周陡峭、顶端却相对平整的山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|崮|（gù）四周陡峭、顶端却相对平整的山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  26,
  '常识',
  '巘',
  '（yǎn）山顶上的其他小山；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|巘|（yǎn）山顶上的其他小山；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  27,
  '常识',
  '麓',
  '（lù）山脚的周边；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|麓|（lù）山脚的周边；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  28,
  '常识',
  '冈',
  '（gāng）山梁和山脊的统称；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|冈|（gāng）山梁和山脊的统称；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  29,
  '常识',
  '阪',
  '（bǎn）高低不平而又瘠薄的山地；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|阪|（bǎn）高低不平而又瘠薄的山地；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  30,
  '常识',
  '陇',
  '（lǒng）山冈上的高地；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|陇|（lǒng）山冈上的高地；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  31,
  '常识',
  '川',
  '（chuān）四周山势较高，中间却相对平整的洼地；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|川|（chuān）四周山势较高，中间却相对平整的洼地；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  32,
  '常识',
  '陉',
  '（xíng）山脉中断处的地带；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|陉|（xíng）山脉中断处的地带；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  33,
  '常识',
  '巍',
  '（wēi）体型异常高大的山脉；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|巍|（wēi）体型异常高大的山脉；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  34,
  '常识',
  '岫',
  '（xiù）山体里面的洞穴或山洞；',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|岫|（xiù）山体里面的洞穴或山洞；',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.11.docx'),
  35,
  '常识',
  '壑',
  '（hè）指山谷或峡谷，是山地中相对较低的部分。',
  '常识',
  '山的雅称',
  'common',
  '常识|山的雅称|壑|（hè）指山谷或峡谷，是山地中相对较低的部分。',
  'learning',
  ''
);

COMMIT;
