-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.7.docx
-- doc_date: 2026-07-07
-- generated_at: 2026-08-21T08:42:54.219Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.7.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.7.docx',
  '2026-07-07',
  '9ab36bd408b4d330bc6cbbc9011c77d1583acc624a5a1139bd14b15545a268de',
  'imported',
  '{"paragraphs":70,"articles":5,"questions":5,"knowledge":9,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  1,
  '习近平同黑山总统米拉托维奇就中国同黑建交20周年互致贺电',
  '2026年7月6日，国家主席习近平同黑山总统米拉托维奇互致贺电，庆祝两国建交20周年。(时政来源:新华网)',
  '',
  '2026-07-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  2,
  '天问二号探测器抵达目标小行星 开始科学探测',
  '记者2026年7月6日从国家航天局获悉，天问二号探测器历经约400天、行程约10亿千米的“追星”之旅，于近日与小行星2016HO3成功交会，到达距离小行星20千米处，开始科学探测。(时政来源:新华网)',
  '',
  '2026-07-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  3,
  '中国海军成功组织潜射战略导弹试射',
  '2026年7月6日12时01分，中国人民解放军海军1艘战略核潜艇向太平洋相关公海海域，成功发射1发携载训练模拟弹头的潜射战略导弹，准确落入预定海域。此次导弹试射是中方年度军事训练的例行性安排，已事先向有关国家作了通报，符合国际法和国际惯例，不针对任何特定国家和目标。(时政来源:新华网)',
  '',
  '2026-07-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  4,
  '2026年世界互联网大会数字丝路发展论坛21日在西安举行',
  '世界互联网大会2026年7月6日召开新闻发布会，介绍2026年世界互联网大会数字丝路发展论坛的基本情况、总体筹备进度及特色亮点。
本次论坛将于7月21日至22日在西安举行，以“智汇丝路 数启新程一一携手构建网络空间命运共同体”为主题。(时政来源:央广网)',
  '',
  '2026-07-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  5,
  '3部门发文规范国际科技组织成立登记',
  '民政部、科技部、中国科协于2026年7月4日联合发布《国际科技组织成立登记指引》。
登记指引适用于在民政部申请成立登记的国际科技组织，即由中外高等学校、科研院所、科技组织、企业等单位或者个人共同发起，在中国境内成立登记，旨在促进自然科学和工程技术领域国际合作、国际交流和国际治理的国际性(或者区域性)、非营利性、非政府的社会团体法人。在经济、教育、文化、卫生、体育、环保等领域发起设立国际性社会组织，可参照适用。(时政来源:人民网)',
  '',
  '2026-07-07',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  1,
  'document',
  '单选',
  '2026年7月6日，国家主席习近平同(   )总统互致贺电，庆祝两国建交20周年。',
  '[{"key":"A","text":"摩纳哥"},{"key":"B","text":"马耳他"},{"key":"C","text":"黑山"},{"key":"D","text":"梵蒂冈"}]',
  'C',
  '',
  '原题',
  '2026-07-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  2,
  'document',
  '单选',
  '记者2026年7月6日从国家航天局获悉，(   )探测器于近日与小行星2016HO3成功交会，到达距离小行星20千米处，开始科学探测。',
  '[{"key":"A","text":"天问三号"},{"key":"B","text":"天问二号"},{"key":"C","text":"探索一号"},{"key":"D","text":"探索二号"}]',
  'B',
  '',
  '原题',
  '2026-07-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  3,
  'document',
  '单选',
  '2026年7月6日12时01分，中国人民解放军海军1艘战略核潜艇向太平洋相关公海海域，成功发射1发携载训练模拟弹头的(   )，准确落入预定海域。',
  '[{"key":"A","text":"陆基洲际弹道导弹"},{"key":"B","text":"空射远程巡航导弹"},{"key":"C","text":"潜射战略导弹"},{"key":"D","text":"舰载反舰巡航导弹"}]',
  'C',
  '',
  '原题',
  '2026-07-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  4,
  'document',
  '单选',
  '2026年世界互联网大会数字丝路发展论坛将于7月21日至22日在西安举行，以(   )为主题。',
  '[{"key":"A","text":"“数智赋能丝路 共创全球数字发展新格局”"},{"key":"B","text":"“数字互联 共建丝路”"},{"key":"C","text":"“智汇丝路 数启新程——携手构建网络空间命运共同体”"},{"key":"D","text":"“互联互通 共同繁荣”"}]',
  'C',
  '',
  '原题',
  '2026-07-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  5,
  'document',
  '单选',
  '民政部、科技部、中国科协于2026年7月4日联合发布《国际科技组织成立登记指引》。登记指引适用于在民政部申请成立登记的国际科技组织，即由中外高等学校、科研院所、科技组织、企业等单位或者个人共同发起，在中国境内成立登记，旨在促进自然科学和工程技术领域国际合作、国际交流和国际治理的(   )的社会团体法人。
①国际性(或者区域性)
②非营利性
③非政府
④政府间
⑤营利性',
  '[{"key":"A","text":"①②③"},{"key":"B","text":"①③⑤"},{"key":"C","text":"①②④"},{"key":"D","text":"①④⑤"}]',
  'A',
  '',
  '原题',
  '2026-07-07'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  1,
  '历史上的今天',
  '1921年中国劳动组合书记部成立',
  '1921年中国劳动组合书记部成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1921年中国劳动组合书记部成立|1921年中国劳动组合书记部成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  2,
  '历史上的今天',
  '1927年上海设市',
  '1927年上海设市',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1927年上海设市|1927年上海设市',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  3,
  '历史上的今天',
  '1937年卢沟桥事变',
  '1937年卢沟桥事变',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1937年卢沟桥事变|1937年卢沟桥事变',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  4,
  '历史上的今天',
  '1945年中共中央纪念抗战八周年',
  '1945年中共中央纪念抗战八周年',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年中共中央纪念抗战八周年|1945年中共中央纪念抗战八周年',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  5,
  '历史上的今天',
  '1981年国务院下达鼓励个体经营的规定',
  '1981年国务院下达鼓励个体经营的规定',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1981年国务院下达鼓励个体经营的规定|1981年国务院下达鼓励个体经营的规定',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  6,
  '常识',
  '革命摇篮-井冈山',
  '1927年10月，毛主席率领湘赣边秋收起义的工农革命军到达罗霄山脉中段的井冈山地区，开展游击战争，进行土地革命，恢复和建立党的组织，建立革命政权和赤卫队。
井冈山革命根据地的建设，为无产阶级革命照亮了胜利的前程。',
  '常识',
  '中国四大红色摇篮',
  'common',
  '常识|中国四大红色摇篮|革命摇篮-井冈山|1927年10月，毛主席率领湘赣边秋收起义的工农革命军到达罗霄山脉中段的井冈山地区，开展游击战争，进行土地革命，恢复和建立党的组织，建立革命政权和赤卫队。
井冈',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  7,
  '常识',
  '人民军队摇篮-南昌',
  '1927年，蒋介石和汪精卫的叛变，中国共产党为了挽救革命，在8月1日举行起义，经过4个多小时的激烈战斗，南昌守敌几乎全部被歼灭，起义部队占领了南昌城。
南昌起义打响了武装反抗国民党反动派的第一枪，标志着中国共产党独立领导革命战争和创建革命军队的开始。',
  '常识',
  '中国四大红色摇篮',
  'common',
  '常识|中国四大红色摇篮|人民军队摇篮-南昌|1927年，蒋介石和汪精卫的叛变，中国共产党为了挽救革命，在8月1日举行起义，经过4个多小时的激烈战斗，南昌守敌几乎全部被歼灭，起义部队占领了南昌城。
南昌起义',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  8,
  '常识',
  '共和国摇篮-瑞金',
  '1931年11月，中国共产党在江西瑞金成立了中华苏维埃共和国临时中央政府，并领导广大军民在以瑞金为中心的红土地上进行艰苦卓绝的斗争。
瑞金是共和国摇篮，也是长征的出发地之一。',
  '常识',
  '中国四大红色摇篮',
  'common',
  '常识|中国四大红色摇篮|共和国摇篮-瑞金|1931年11月，中国共产党在江西瑞金成立了中华苏维埃共和国临时中央政府，并领导广大军民在以瑞金为中心的红土地上进行艰苦卓绝的斗争。
瑞金是共和国摇篮，也是长征',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.7.docx'),
  9,
  '常识',
  '工人运动摇篮-安源',
  '1922年9月14日，安源路矿工人为要求当局承认俱乐部有工人代表的权利和增加工资举行了罢工，是中国共产党第一次独立领导并取得完全胜利的工人斗争。',
  '常识',
  '中国四大红色摇篮',
  'common',
  '常识|中国四大红色摇篮|工人运动摇篮-安源|1922年9月14日，安源路矿工人为要求当局承认俱乐部有工人代表的权利和增加工资举行了罢工，是中国共产党第一次独立领导并取得完全胜利的工人斗争。',
  'learning',
  ''
);

COMMIT;
