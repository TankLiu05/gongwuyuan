-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.10.docx
-- doc_date: 2026-08-10
-- generated_at: 2026-08-21T08:42:54.226Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.10.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.10.docx',
  '2026-08-10',
  '076542223786dda34e69606e96183fddf9928056ae04d394116ea7d119027fb1',
  'imported',
  '{"paragraphs":78,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  1,
  '我国首次依托水上通信渠道推送北极航道海冰预报',
  '2026年8月，交通运输部北海航海保障中心对外播发北极航道海冰预报信息。这是我国首次依托水上通信渠道推送北极航道海冰预报，标志着我国北极海上信息服务实现从实况播报到动态预报的跨越式发展。此举进一步健全北极航行信息保障体系，为极地航运高质量发展提供有力支撑。（时政来源：人民网）',
  '人民网',
  '2026-08-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  2,
  '第18个全国全民健身日',
  '2026年8月8日是第18个全国全民健身日。国务院日前印发《国民健康“十五五”规划》，从“以治病为中心”转向“以人民健康为中心”，清晰划定了新时代健康中国建设发展路线，着力构建全生命周期健康服务体系，打造一体化连续服务链条，全方位、全周期守护人民群众的生命健康。（时政来源：央视网）',
  '央视网',
  '2026-08-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  3,
  '全国76个典型地区再生水利用配置试点工作完成',
  '记者2026年8月7日从水利部获悉，全国28个省份的76个典型地区再生水利用配置试点工作顺利完成。经多方评估，试点达到预期效果。（时政来源：新华网）',
  '新华网',
  '2026-08-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  4,
  '公安部发布《公安机关网络空间安全监督检查办法》',
  '公安部2026年8月7日发布《公安机关网络空间安全监督检查办法》，自2026年10月1日起施行。
办法共23条，主要规定六方面内容：一是明确监督检查对象，包括网络运营者、数据处理者、个人信息处理者等；二是明确监督检查方式，包括线上巡查、线下核查，日常检查、专项检查等；三是明确监督检查内容，包括被检查对象是否履行法定的网络空间安全义务，以及重大活动安保期间的重点检查内容等；四是明确监督检查机制，要求在国家网络安全、数据安全等机制统筹协调下，加强部门协调、联合检查，减少企业负担；五是明确检查结果运用，公安机关按检查情况采取督促整改、发送公安提示函以及处罚等措施；六是明确相关法律责任，明确了公安机关及工作人员玩忽职守、滥用职权、泄露国家秘密等法律责任。（时政来源：新华网）',
  '新华网',
  '2026-08-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  5,
  '我国自主研制超大直径盾构机“南湖号”下线',
  '2026年8月7日，我国自主研制的超大直径气垫式泥水平衡盾构机“南湖号”在江苏常熟正式下线。
“南湖号”盾构机开挖直径达16.16米，整机总重4800吨，相当于六层楼高、约3200辆小轿车重量总和，是我国超大直径盾构机家族的新成员。（时政来源：央广网）',
  '央广网',
  '2026-08-10',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  1,
  'document',
  '单选',
  '2026年8月，交通运输部北海航海保障中心对外播发北极航道海冰预报信息。这是我国首次依托水上通信渠道推送北极航道海冰预报，标志着我国北极海上信息服务实现从（  ）到（  ）的跨越式发展。',
  '[{"key":"A","text":"岸上发布；海上送达"},{"key":"B","text":"实况播报；动态预报"},{"key":"C","text":"定点监测；全域覆盖"},{"key":"D","text":"被动接收；主动推送"}]',
  'B',
  '',
  '原题',
  '2026-08-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  2,
  'document',
  '单选',
  '2026年8月8日是第18个全国全民健身日。国务院日前印发《国民健康“十五五”规划》，从“以（  ）为中心”转向“以（  ）为中心”，清晰划定了新时代健康中国建设发展路线，着力构建全生命周期健康服务体系，打造一体化连续服务链条，全方位、全周期守护人民群众的生命健康。',
  '[{"key":"A","text":"健身；健康"},{"key":"B","text":"健康；疾病治疗"},{"key":"C","text":"治病；人民健康"},{"key":"D","text":"健康管理；健身"}]',
  'C',
  '',
  '原题',
  '2026-08-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  3,
  'document',
  '单选',
  '记者2026年8月7日从水利部获悉，全国28个省份的（  ）个典型地区再生水利用配置试点工作顺利完成。经多方评估，试点达到预期效果。',
  '[{"key":"A","text":"12"},{"key":"B","text":"5"},{"key":"C","text":"76"},{"key":"D","text":"100"}]',
  'C',
  '',
  '原题',
  '2026-08-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  4,
  'document',
  '单选',
  '公安部2026年8月7日发布《公安机关网络空间安全监督检查办法》，自2026年10月1日起施行。办法共23条，主要规定六方面内容，其中，明确监督检查（  ），包括网络运营者、数据处理者、个人信息处理者等。',
  '[{"key":"A","text":"内容"},{"key":"B","text":"方式"},{"key":"C","text":"机制"},{"key":"D","text":"对象"}]',
  'D',
  '',
  '原题',
  '2026-08-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  5,
  'document',
  '单选',
  '2026年8月7日，我国自主研制的超大直径气垫式泥水平衡盾构机（  ）在江苏常熟正式下线。',
  '[{"key":"A","text":"“南湖号”"},{"key":"B","text":"“运河号”"},{"key":"C","text":"“沧渊号”"},{"key":"D","text":"“奋楫号”"}]',
  'A',
  '',
  '原题',
  '2026-08-10'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  1,
  '历史上的今天',
  '1913年巴尔干战争结束',
  '1913年巴尔干战争结束',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1913年巴尔干战争结束|1913年巴尔干战争结束',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  2,
  '历史上的今天',
  '1918年段祺瑞改革币制',
  '1918年段祺瑞改革币制',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1918年段祺瑞改革币制|1918年段祺瑞改革币制',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  3,
  '历史上的今天',
  '1936年绥远抗战开始',
  '1936年绥远抗战开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1936年绥远抗战开始|1936年绥远抗战开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  4,
  '历史上的今天',
  '1936年中共放弃红军称号联蒋抗日',
  '1936年中共放弃红军称号联蒋抗日',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1936年中共放弃红军称号联蒋抗日|1936年中共放弃红军称号联蒋抗日',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  5,
  '历史上的今天',
  '1946年陇海战役获胜',
  '1946年陇海战役获胜',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1946年陇海战役获胜|1946年陇海战役获胜',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  6,
  '常识',
  '犯意表示（不构成犯罪）',
  '又称“犯意流露”。是以口头、文字或者其他方式对犯罪决意的单纯表露。属于思想范畴，尚未开始实行任何危害社会的行为，不构成犯罪，不会受到处罚。
例子：口头威胁杀人、写日记骂人。',
  '常识',
  '五种犯罪形态',
  'common',
  '常识|五种犯罪形态|犯意表示（不构成犯罪）|又称“犯意流露”。是以口头、文字或者其他方式对犯罪决意的单纯表露。属于思想范畴，尚未开始实行任何危害社会的行为，不构成犯罪，不会受到处罚。
例子：口头威胁杀人、',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  7,
  '常识',
  '犯罪预备（未着手犯罪）',
  '为了犯罪，准备工具、制造条件的，是犯罪预备。对于预备犯，可以比照既遂犯从轻、减轻处罚或者免除处罚。
例子：准备犯罪工具、踩点、跟踪蹲守、拟定计划、勾引共犯、排除犯罪障碍。',
  '常识',
  '五种犯罪形态',
  'common',
  '常识|五种犯罪形态|犯罪预备（未着手犯罪）|为了犯罪，准备工具、制造条件的，是犯罪预备。对于预备犯，可以比照既遂犯从轻、减轻处罚或者免除处罚。
例子：准备犯罪工具、踩点、跟踪蹲守、拟定计划、勾引共犯、排除',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  8,
  '常识',
  '犯罪未遂（已开始犯罪，但欲而不能）',
  '已经着手实行犯罪，由于犯罪分子意志以外的原因而未得逞的，是犯罪未遂。对于未遂犯，可以比照既遂犯从轻或者减轻处罚。
例子：被害人反抗；第三者阻止；自身能力不足；误认为完成；对环境误解以为无法完成。',
  '常识',
  '五种犯罪形态',
  'common',
  '常识|五种犯罪形态|犯罪未遂（已开始犯罪，但欲而不能）|已经着手实行犯罪，由于犯罪分子意志以外的原因而未得逞的，是犯罪未遂。对于未遂犯，可以比照既遂犯从轻或者减轻处罚。
例子：被害人反抗；第三者阻止；自身能力不足；误',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  9,
  '常识',
  '犯罪中止（已开始犯罪，但能而不欲）',
  '在犯罪过程中，自动放弃犯罪或者自动有效地防止犯罪结果发生的，是犯罪中止。对于中止犯，没有造成损害的，应当免除处罚；造成损害的，应当减轻处罚。
例子：既遂之前均可中止，既遂之后原则上无中止，危险犯除外。（如爆破犯已经安放了炸弹，自己拆除算中止）。必须是意志以内的原因，害怕、错觉、失误都不算自己主动放弃，而且必须有中止行为。',
  '常识',
  '五种犯罪形态',
  'common',
  '常识|五种犯罪形态|犯罪中止（已开始犯罪，但能而不欲）|在犯罪过程中，自动放弃犯罪或者自动有效地防止犯罪结果发生的，是犯罪中止。对于中止犯，没有造成损害的，应当免除处罚；造成损害的，应当减轻处罚。
例子：既遂之前均可',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.10.docx'),
  10,
  '常识',
  '犯罪既遂',
  '行为人的行为齐备了某种犯罪的基本构成的全部要件。是犯罪的完成形态，其他均为未完成形态。
【大白话总结】
第一步：判断是否开始实行犯罪
仅有想法、无实际行动→犯意表示（不构成犯罪）
开始准备工具、踩点等准备行为→犯罪预备
第二步：判断是否着手实行犯罪
未着手（准备阶段）因外界原因停止→犯罪预备
已着手实行→进入第三步判断
第三步：判断停止原因是意志以内还是以外
意志以外的原因被迫停止→犯罪未遂（欲而不能）
意志以内的原因主动停止→犯罪中止（能而不欲）',
  '常识',
  '五种犯罪形态',
  'common',
  '常识|五种犯罪形态|犯罪既遂|行为人的行为齐备了某种犯罪的基本构成的全部要件。是犯罪的完成形态，其他均为未完成形态。
【大白话总结】
第一步：判断是否开始实行犯罪
仅有想法、无实际行动→犯意',
  'learning',
  ''
);

COMMIT;
