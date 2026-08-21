-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.3.docx
-- doc_date: 2026-07-03
-- generated_at: 2026-08-21T08:42:54.218Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.3.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.3.docx',
  '2026-07-03',
  'd7c3531755f4d58c6ac45564be6d6285783afa7b9f8680d7fe9cedc4db52d7ba',
  'imported',
  '{"paragraphs":73,"articles":5,"questions":5,"knowledge":5,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  1,
  '我国成功发射海洋二号E卫星',
  '2026年7月2日7时46分，我国在酒泉卫星发射中心使用长征四号乙运载火箭，成功将海洋二号E卫星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。（时政来源：新华网）',
  '新华网',
  '2026-07-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  2,
  '第22个中国航海日',
  '2026年7月11日是第22个中国航海日，今年航海日活动的主题为“数智赋能，领航未来”。（时政来源：新华网）',
  '新华网',
  '2026-07-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  3,
  '首届亚信国家职工技能大赛在广州举行',
  '2026年7月1日，首届亚信国家职工技能大赛在广州开赛，设置砌筑、无人机装调检修、高压电缆智能运检三个竞赛项目。
本次大赛以“互信互鉴 匠造未来”为主题，赛事吸引了20余个亚信成员国及观察员国参与。（时政来源：新华网）',
  '新华网',
  '2026-07-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  4,
  '海军舰艇编队抵达香港南宁舰、衡阳舰向民众开放',
  '2026年7月2日清晨，中国海军南宁舰、衡阳舰抵达香港水域。两舰将在解放军驻香港部队昂船洲军营举行舰艇开放活动，接受市民登舰参观。（时政来源：人民网）',
  '人民网',
  '2026-07-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  5,
  '中国共产党党员总数达10128.6万名',
  '截至2025年12月31日，中国共产党党员总数为10128.6万名，比2024年底净增101.5万名，增幅为1.0%。（时政来源：央视网）',
  '央视网',
  '2026-07-03',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  1,
  'document',
  '单选',
  '2026年7月2日7时46分，我国在酒泉卫星发射中心使用长征四号乙运载火箭，成功将（  ）发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。',
  '[{"key":"A","text":"大山一号D卫星"},{"key":"B","text":"仙后一号E卫星"},{"key":"C","text":"蓝帆二号D卫星"},{"key":"D","text":"海洋二号E卫星"}]',
  'D',
  '',
  '原题',
  '2026-07-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  2,
  'document',
  '单选',
  '2026年（  ）是第22个中国航海日，今年航海日活动的主题为“数智赋能，领航未来”。',
  '[{"key":"A","text":"7月5日"},{"key":"B","text":"7月8日"},{"key":"C","text":"7月11日"},{"key":"D","text":"7月15日"}]',
  'C',
  '',
  '原题',
  '2026-07-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  3,
  'document',
  '单选',
  '2026年7月1日，首届亚信国家职工技能大赛在（  ）开赛，本次大赛以（  ）为主题，赛事吸引了20余个亚信成员国及观察员国参与。',
  '[{"key":"A","text":"广州；“互信互鉴 匠造未来”"},{"key":"B","text":"上海；“精工致远 携手同行”"},{"key":"C","text":"杭州；“技通亚洲 共创繁荣”"},{"key":"D","text":"深圳；“匠心筑梦 联通亚洲”"}]',
  'A',
  '',
  '原题',
  '2026-07-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  4,
  'document',
  '单选',
  '2026年7月2日清晨，中国海军（  ）抵达香港水域。两舰将在解放军驻香港部队昂船洲军营举行舰艇开放活动，接受市民登舰参观。',
  '[{"key":"A","text":"四川舰、南昌舰"},{"key":"B","text":"辽宁舰、铜川舰"},{"key":"C","text":"南宁舰、衡阳舰"},{"key":"D","text":"合肥舰、银川舰"}]',
  'C',
  '',
  '原题',
  '2026-07-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  5,
  'document',
  '单选',
  '截至2025年12月31日，中国共产党党员总数为（  ）万名，比2024年底净增101.5万名，增幅为1.0%。',
  '[{"key":"A","text":"8200.8"},{"key":"B","text":"9600.3"},{"key":"C","text":"13547.9"},{"key":"D","text":"10128.6"}]',
  'D',
  '',
  '原题',
  '2026-07-03'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  1,
  '历史上的今天',
  '1876年我国第一条铁路淞沪铁路正式通车运营',
  '1876年我国第一条铁路淞沪铁路正式通车运营',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1876年我国第一条铁路淞沪铁路正式通车运营|1876年我国第一条铁路淞沪铁路正式通车运营',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  2,
  '历史上的今天',
  '1898年北京大学的前身京师大学堂成立',
  '1898年北京大学的前身京师大学堂成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1898年北京大学的前身京师大学堂成立|1898年北京大学的前身京师大学堂成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  3,
  '历史上的今天',
  '1924年广州农民运动讲习所正式开学',
  '1924年广州农民运动讲习所正式开学',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1924年广州农民运动讲习所正式开学|1924年广州农民运动讲习所正式开学',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  4,
  '历史上的今天',
  '1942年国共代表在重庆继续谈判',
  '1942年国共代表在重庆继续谈判',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1942年国共代表在重庆继续谈判|1942年国共代表在重庆继续谈判',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.3.docx'),
  5,
  '历史上的今天',
  '2003年明十三陵列入联合国《世界遗产名录》',
  '2003年明十三陵列入联合国《世界遗产名录》',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2003年明十三陵列入联合国《世界遗产名录》|2003年明十三陵列入联合国《世界遗产名录》',
  'learning',
  ''
);

COMMIT;
