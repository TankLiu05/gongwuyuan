-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政6.28.docx
-- doc_date: 2026-06-28
-- generated_at: 2026-08-21T08:42:54.217Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政6.28.docx',
  '/Users/tank/Desktop/每日时政/每日时政6.28.docx',
  '2026-06-28',
  'ef419eb13e8240d9da4c286d637b0ef311c5f8735061aab9b2ae7227b95acc8d',
  'imported',
  '{"paragraphs":75,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  1,
  '两部门就养老服务师职业资格制度出台暂行规定',
  '2026年6月26日，民政部、人力资源社会保障部公布《养老服务师职业资格制度暂行规定》。
暂行规定明确，该职业资格设置为初级、中级、高级等三个级别，其中初级、中级实行全国统一大纲、统一命题、统一组织的考试制度，高级养老服务师职业资格有关规定另行制定。（时政来源：新华网）',
  '新华网',
  '2026-06-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  2,
  '我国单机容量最大抽水蓄能电站全面投产',
  '2026年6月25日，随着最后一台机组顺利完成15天考核试运行，总装机容量170万千瓦的浙江天台抽水蓄能电站全面投产发电。作为世界额定水头最高、国内单机容量最大的抽水蓄能电站，电站全面投产，标志着我国在超高水头、大容量抽水蓄能技术领域实现了新进展，为新型电力系统建设增添了一座“调节器”。（时政来源：人民网）',
  '人民网',
  '2026-06-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  3,
  '新修订的商标法2027年1月1日起施行',
  '2026年6月26日，十四届全国人大常委会第二十三次会议表决通过新修订的商标法，2027年1月1日起施行。
商标作为知识产权的重要组成部分，不仅是商誉的载体和诚信的象征，更是企业参与市场竞争的核心工具。（时政来源：新华网）',
  '新华网',
  '2026-06-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  4,
  '丁薛祥出席第九届中国－亚欧博览会开幕式',
  '第九届中国－亚欧博览会2026年6月25日在新疆乌鲁木齐开幕，中共中央政治局常委、国务院副总理丁薛祥出席并致辞。
丁薛祥指出，亚欧大陆自古便是文明交汇、商贸融通之地，如今已成为共建“一带一路”国际合作重点区域。近年来，中国同亚欧各方一道，坚持和平合作、开放包容、互学互鉴、互利共赢，扎实推进各领域务实合作，古老丝路焕发新活力、展现勃勃生机。（时政来源：中国政府网）',
  '中国政府网',
  '2026-06-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  5,
  '全球首个自动驾驶系统全球技术法规获批发布',
  '2026年6月22日至26日，联合国世界车辆法规协调组织第199次全体会议在瑞士日内瓦召开。会上，由中国、欧盟、英国、美国、加拿大和日本共同牵头制定的联合国自动驾驶系统全球技术法规（ADS GTR）经全体缔约方投票表决，正式获批发布。作为全球首个自动驾驶全球技术法规，将为自动驾驶技术有序安全落地提供统一遵循。（时政来源：新华网）',
  '新华网',
  '2026-06-28',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  1,
  'document',
  '单选',
  '2026年6月26日，民政部、人力资源社会保障部公布《养老服务师职业资格制度暂行规定》。暂行规定明确，该职业资格设置为（  ）。',
  '[{"key":"A","text":"五级职业技能等级"},{"key":"B","text":"初级、中级、高级、技师四级"},{"key":"C","text":"初级、中级、高级三个级别"},{"key":"D","text":"一至四级专业技术等级"}]',
  'C',
  '',
  '原题',
  '2026-06-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  2,
  'document',
  '单选',
  '2026年6月26日，民政部、人力资源社会保障部公布《养老服务师职业资格制度暂行规定》。暂行规定明确，该职业资格设置为（  ）。',
  '[{"key":"A","text":"五级职业技能等级"},{"key":"B","text":"初级、中级、高级、技师四级"},{"key":"C","text":"初级、中级、高级三个级别"},{"key":"D","text":"一至四级专业技术等级"}]',
  'B',
  '',
  '原题',
  '2026-06-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  3,
  'document',
  '单选',
  '2026年6月26日，十四届全国人大常委会第二十三次会议表决通过新修订的商标法，（  ）起施行。',
  '[{"key":"A","text":"2026年7月1日"},{"key":"B","text":"2026年12月1日"},{"key":"C","text":"2027年1月1日"},{"key":"D","text":"2026年10月1日"}]',
  'C',
  '',
  '原题',
  '2026-06-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  4,
  'document',
  '单选',
  '第九届中国－亚欧博览会2026年6月25日在新疆乌鲁木齐开幕，中共中央政治局常委、国务院副总理丁薛祥出席并致辞指出，近年来，中国同亚欧各方一道，坚持（  ），扎实推进各领域务实合作，古老丝路焕发新活力、展现勃勃生机。',
  '[{"key":"A","text":"坚持真理、坚守理想，践行初心、担当使命，不怕牺牲、英勇斗争，对党忠诚、不负人民"},{"key":"B","text":"生命至上、举国同心、舍生忘死、尊重科学、命运与共"},{"key":"C","text":"上下同心、尽锐出战、精准务实、开拓创新、攻坚克难、不负人民"},{"key":"D","text":"和平合作、开放包容、互学互鉴、互利共赢"}]',
  'D',
  '',
  '原题',
  '2026-06-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  5,
  'document',
  '单选',
  '2026年6月22日至26日，联合国世界车辆法规协调组织第199次全体会议在瑞士日内瓦召开。会上，由（  ）共同牵头制定的全球首个自动驾驶系统全球技术法规——联合国自动驾驶系统全球技术法规（ADS GTR）经全体缔约方投票表决，正式获批发布。',
  '[{"key":"A","text":"中国、美国和日本"},{"key":"B","text":"中国、欧盟、英国和加拿大"},{"key":"C","text":"中国、欧盟、英国、美国、加拿大和日本"},{"key":"D","text":"中国和欧盟"}]',
  'C',
  '',
  '原题',
  '2026-06-28'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  1,
  '历史上的今天',
  '1840年鸦片战争爆发',
  '1840年鸦片战争爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1840年鸦片战争爆发|1840年鸦片战争爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  2,
  '历史上的今天',
  '1902年美国决定开凿巴拿马运河',
  '1902年美国决定开凿巴拿马运河',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1902年美国决定开凿巴拿马运河|1902年美国决定开凿巴拿马运河',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  3,
  '历史上的今天',
  '1919年德国在凡尔赛条约上签字，中国拒绝在凡尔赛条约上签字',
  '1919年德国在凡尔赛条约上签字，中国拒绝在凡尔赛条约上签字',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1919年德国在凡尔赛条约上签字，中国拒绝在凡尔赛条约上签字|1919年德国在凡尔赛条约上签字，中国拒绝在凡尔赛条约上签字',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  4,
  '历史上的今天',
  '1926年张作霖吴佩孚联合组建北京政府',
  '1926年张作霖吴佩孚联合组建北京政府',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1926年张作霖吴佩孚联合组建北京政府|1926年张作霖吴佩孚联合组建北京政府',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  5,
  '历史上的今天',
  '1986年邓小平谈改革政治体制　增强法制观念',
  '1986年邓小平谈改革政治体制　增强法制观念',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1986年邓小平谈改革政治体制　增强法制观念|1986年邓小平谈改革政治体制　增强法制观念',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  6,
  '常识',
  '拘留所',
  '拘留所关的是违法但还没犯罪的人，比如打架斗殴、酒驾、嫖娼这些行为，属于行政处罚。关的时间很短，一般不超过15天，最多20天。在里面不强制干活，可以见家人，不会留下犯罪案底（但会有违法记录）。拘留所归公安局管。',
  '常识',
  '拘留所、看守所、监狱的区别',
  'common',
  '常识|拘留所、看守所、监狱的区别|拘留所|拘留所关的是违法但还没犯罪的人，比如打架斗殴、酒驾、嫖娼这些行为，属于行政处罚。关的时间很短，一般不超过15天，最多20天。在里面不强制干活，可以见家人，不会留',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  7,
  '常识',
  '看守所',
  '看守所关的是涉嫌犯罪的嫌疑人和被告人，也就是案子还没判的人，另外刑期还剩不到3个月的犯人也会暂时关在这里。主要是为了防止他们逃跑，保证案件顺利审理。关多久要看案子进度，短则几天，长可能好几年。里面基本不干活，主要就是等着审讯和开庭。判决前不能见家人，只能见律师。如果最后被判有罪，就会留下案底；要是无罪释放，就没有案底。看守所也归公安局管。',
  '常识',
  '拘留所、看守所、监狱的区别',
  'common',
  '常识|拘留所、看守所、监狱的区别|看守所|看守所关的是涉嫌犯罪的嫌疑人和被告人，也就是案子还没判的人，另外刑期还剩不到3个月的犯人也会暂时关在这里。主要是为了防止他们逃跑，保证案件顺利审理。关多久要看案',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.28.docx'),
  8,
  '常识',
  '监狱',
  '关的是已经被法院判了刑的罪犯，比如有期徒刑、无期徒刑、死缓这些。目的是执行刑罚和改造罪犯。关的时间按照判决书来，短则几个月，长则一辈子。在里面必须参加劳动改造，有固定的作息和配餐。可以按规定时间见家人。一旦进去，永久留下犯罪案底，对个人和子女的政审、工作、出行都有严重影响。监狱归司法局（监狱管理局）管。
【大白话总结】
1.拘留所：犯了错（违法），但还没到犯罪那一步，进去待几天就出来，不留案底。
2.看守所：被怀疑犯了罪，案子还在查、还没判，先关在这里等着，能不能出来看最后判没判刑。
3.监狱：已经判了刑，正式进去坐牢，要干活、受教育，出来以后一辈子背着案底。
【课后练习】
1.（单选）张三因为酒后驾车被交警抓获，最终被处以行政拘留10天，他应该被关在（ ）。
A.拘留所
B.看守所
C.监狱
D.派出所2.（单选）李四因涉嫌盗窃被公安机关刑事拘留，目前案件正在侦查阶段。以下说法正确的是（ ）。
A.李四可以被关进监狱等待审判
B.李四在关押期间可以随时见家人
C.如果李四最终被法院判决无罪，他不会留下犯罪案底
D.李四的关押期限最多不超过15天
1.【答案】A。酒驾属于违反《道路交通安全法》的行为，是行政违法而非刑事犯罪。行政拘留是行政处罚的一种，执行场所是拘留所。看守所关押的是刑事案件的嫌疑人、被告人，监狱关押的是已判刑的罪犯，派出所不是专门的关押场所。
2.【答案】C。A项错误，监狱只关押已被判决有罪的罪犯，李四尚未判决，应关在看守所。B项错误，在看守所羁押期间（判决前），一般不允许见家人，只能见律师。C项正确，如果最终判决无罪，则没有犯罪事实，自然不会有犯罪案底。D项错误，刑事拘留最长可达37天（特殊情况下），且之后还可能转为逮捕，关押期限远不止15天。',
  '常识',
  '拘留所、看守所、监狱的区别',
  'common',
  '常识|拘留所、看守所、监狱的区别|监狱|关的是已经被法院判了刑的罪犯，比如有期徒刑、无期徒刑、死缓这些。目的是执行刑罚和改造罪犯。关的时间按照判决书来，短则几个月，长则一辈子。在里面必须参加劳动改造，',
  'learning',
  ''
);

COMMIT;
