-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.18.docx
-- doc_date: 2026-07-18
-- generated_at: 2026-08-21T08:42:54.221Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.18.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.18.docx',
  '2026-07-18',
  'ceb9a2a27f7f89462e2c2f16a569df255aa9117074ca3145cb1f48a3ac078cfb',
  'imported',
  '{"paragraphs":78,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  1,
  '习近平出席2026世界人工智能大会暨人工智能全球治理高级别会议开幕式并发表主旨讲话',
  '2026年7月17日上午，国家主席习近平在上海世界会客厅出席2026世界人工智能大会暨人工智能全球治理高级别会议开幕式并发表主旨讲话。
讲话指出，第一，坚持开放共赢，驱动创新发展。抓住难得的历史性机遇，鼓励开源开放、合作共享，全面促进人工智能科技创新、产业发展、场景应用，协同推进传统产业改造升级、新兴产业培育壮大、未来产业前瞻布局，让人工智能赋能千行百业。第二，强化风险意识，确保安全可控。高度重视人工智能引发的各类内生和衍生风险，确保人工智能始终处于人类控制之下。第三，鼓励包容并蓄，促进文明互鉴。第四，倡导和衷共济，完善全球治理。
讲话指出，人工智能发展不应该是某个国家的独奏，而应当是全球合作的交响。（时政来源：央视网）',
  '央视网',
  '2026-07-18',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  2,
  '我国建成光热发电装机位居全球第二',
  '中国电力企业联合会最新统计显示，我国成为全球光热发电新增装机的主力。截至2026年6月底，我国已建成投运光热发电项目24个，装机容量210万千瓦，位居全球第二；在建项目26个，装机容量320万千瓦。（时政来源：新华网）',
  '新华网',
  '2026-07-18',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  3,
  '三部门部署加快推进海水淡化产业高质量发展',
  '记者2026年7月16日从国家发展改革委获悉，为加快推进海水淡化产业高质量发展，近日，国家发展改革委、自然资源部、水利部联合印发《海水淡化产业发展行动方案》。
行动方案聚焦水资源节约保护与海洋强国建设战略目标，坚持市场化推进原则，以拓展应用场景为主线，以强化科技创新为动力，以健全政策标准为保障，部署7大行动，促进海水淡化科技与产业创新深度融合，推动海水淡化产业链全面提质升级，不断提升海水淡化水规模化利用水平。（时政来源：新华网）',
  '新华网',
  '2026-07-18',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  4,
  '成立世界人工智能合作组织协定签署仪式在上海举行',
  '2026年7月16日，成立世界人工智能合作组织协定签署仪式在上海举行。
协定明确，世界人工智能合作组织是独立的政府间国际组织，遵循《联合国宪章》宗旨，秉持共商共建共享理念，坚持以人为本原则，旨在促进人工智能国际合作和全球治理，确保人工智能朝着有益、安全、公平方向健康有序发展，造福全人类。组织总部设在中国上海。（时政来源：新华网）',
  '新华网',
  '2026-07-18',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  5,
  '第五轮高校毕业生“三支一扶”计划这样实施',
  '记者2026年7月16日获悉，人力资源社会保障部等九部门已启动实施第五轮高校毕业生“三支一扶”计划，决定于2026年至2030年，每年招募3.64万名高校毕业生到基层从事支教、支农、支医和帮扶乡村振兴等服务，服务期2年。“十五五”期间将累计招募18.2万人左右。（时政来源：人民网）',
  '人民网',
  '2026-07-18',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  1,
  'document',
  '单选',
  '2026年7月17日上午，国家主席习近平在上海世界会客厅出席2026世界人工智能大会暨人工智能全球治理高级别会议开幕式并发表主旨讲话。下列符合讲话精神的有哪些？（  ）
①鼓励开源开放、合作共享，全面促进人工智能科技创新、产业发展、场景应用
②协同推进传统产业改造升级、新兴产业培育壮大、未来产业前瞻布局
③强化风险意识，确保人工智能始终处于人类控制之下
④人工智能发展不应该是某个国家的独奏，而应当是全球合作的交响',
  '[{"key":"A","text":"①②③④"},{"key":"B","text":"②③④"},{"key":"C","text":"①②④"},{"key":"D","text":"①③④"}]',
  'A',
  '',
  '原题',
  '2026-07-18'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  2,
  'document',
  '单选',
  '截至2026年6月底，我国已建成投运光热发电项目24个，装机容量210万千瓦，位居（  ）；在建项目26个，装机容量320万千瓦。',
  '[{"key":"A","text":"全球第一"},{"key":"B","text":"全球第二"},{"key":"C","text":"全球第三"},{"key":"D","text":"全球第四"}]',
  'B',
  '',
  '原题',
  '2026-07-18'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  3,
  'document',
  '单选',
  '近日，国家发展改革委、自然资源部、水利部联合印发《海水淡化产业发展行动方案》。行动方案聚焦水资源节约保护与海洋强国建设战略目标，坚持市场化推进原则，以（  ）为主线，以（  ）为动力，以（  ）为保障，部署7大行动。',
  '[{"key":"A","text":"拓展应用场景；强化科技创新；健全政策标准"},{"key":"B","text":"完善产业链条；扩大产业规模；加大财政投入"},{"key":"C","text":"推进技术国产化；降低供水成本；强化行业监管"},{"key":"D","text":"扩大产业投资；完善基础设施；推进国际合作"}]',
  'A',
  '',
  '原题',
  '2026-07-18'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  4,
  'document',
  '单选',
  '2026年7月16日，成立世界人工智能合作组织协定签署仪式在上海举行。协定明确，世界人工智能合作组织遵循《联合国宪章》宗旨，秉持（  ）理念，坚持以人为本原则，旨在促进人工智能国际合作和全球治理，确保人工智能朝着有益、安全、公平方向健康有序发展，造福全人类。',
  '[{"key":"A","text":"开放竞争优先"},{"key":"B","text":"自主独立排他"},{"key":"C","text":"共商共建共享"},{"key":"D","text":"互利互通包容"}]',
  'C',
  '',
  '原题',
  '2026-07-18'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  5,
  'document',
  '单选',
  '人力资源社会保障部等九部门已启动实施（  ）高校毕业生“三支一扶”计划，决定于2026年至2030年，每年招募3.64万名高校毕业生到基层从事支教、支农、支医和帮扶乡村振兴等服务，服务期（  ）年。',
  '[{"key":"A","text":"第六轮；2"},{"key":"B","text":"第五轮；3"},{"key":"C","text":"第六轮；3"},{"key":"D","text":"第五轮；2"}]',
  'D',
  '',
  '原题',
  '2026-07-18'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  1,
  '历史上的今天',
  '1899年居里夫妇发现“钋”',
  '1899年居里夫妇发现“钋”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1899年居里夫妇发现“钋”|1899年居里夫妇发现“钋”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  2,
  '历史上的今天',
  '1933年蒋介石开办庐山军官训练团',
  '1933年蒋介石开办庐山军官训练团',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1933年蒋介石开办庐山军官训练团|1933年蒋介石开办庐山军官训练团',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  3,
  '历史上的今天',
  '1936年西班牙内战爆发',
  '1936年西班牙内战爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1936年西班牙内战爆发|1936年西班牙内战爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  4,
  '历史上的今天',
  '1955年第一座迪斯尼乐园正式向公众开放',
  '1955年第一座迪斯尼乐园正式向公众开放',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1955年第一座迪斯尼乐园正式向公众开放|1955年第一座迪斯尼乐园正式向公众开放',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  5,
  '历史上的今天',
  '1956年中国政府宽释第二批日本战犯',
  '1956年中国政府宽释第二批日本战犯',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1956年中国政府宽释第二批日本战犯|1956年中国政府宽释第二批日本战犯',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  6,
  '常识',
  '民事诉讼时效',
  '民事诉讼时效是指权利人经过法定期限不行使自己的权利，依法律规定其胜诉权便归于消灭的制度。
诉讼时效期间分为三类：普通诉讼时效、最长诉讼时效、特别诉讼时效。
一、普通诉讼时效
向人民法院请求保护民事权利的诉讼时效期间为三年。
因国际货物买卖合同和技术进出口合同争议提起诉讼或者申请仲裁的时效期间为四年。',
  '常识',
  '民事诉讼时效',
  'common',
  '常识|民事诉讼时效|民事诉讼时效|民事诉讼时效是指权利人经过法定期限不行使自己的权利，依法律规定其胜诉权便归于消灭的制度。
诉讼时效期间分为三类：普通诉讼时效、最长诉讼时效、特别诉讼时效。
一、',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  7,
  '拓展',
  '普通诉讼时效期间和特别诉讼时效期间自权利人知道或应当知道权利遭受侵害之日起计算，也被称为主观诉讼时效期间。',
  '二、最长诉讼时效
诉讼时效期间自权利人知道或者应当知道权利受到损害以及义务人之日起计算。但是，自权利受到损害之日起超过二十年的，人民法院不予保护，有特殊情况的，人民法院可以根据权利人的申请决定延长。',
  '拓展',
  '普通诉讼时效期间和特别诉讼时效期间自权利人知道或应当知道权利遭受侵害之日起计算，也被称为主观诉讼时效期间。',
  'extension',
  '拓展|普通诉讼时效期间和特别诉讼时效期间自权利人知道或应当知道权利遭受侵害之日起计算，也被称为主观诉讼时效期间。|普通诉讼时效期间和特别诉讼时效期间自权利人知道或应当知道权利遭受侵害之日起计算，也被称为主观诉讼时效期间。|二、最长诉讼时效
诉讼时效期间自权利人知道或者应当知道权利受到损害以及义务人之日起计算。但是，自权利受到损害之日起超过二十年的，人民法院不予保护，有特殊情况的，',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.18.docx'),
  8,
  '拓展',
  '最长诉讼时效期间自权利受到损害之日起计算且不适用诉讼时效中断、中止规定，因此也被称为客观诉讼时效期间。',
  '三、特殊诉讼时效
1.当事人约定同一债务分期履行的，诉讼时效期间自最后一期履行期限届满之日起计算。
2.无民事行为能力人或者限制民事行为能力人对其法定代理人的请求权的诉讼时效期间，自该法定代理终止之日起计算。
3.未成年人遭受性侵害的损害赔偿请求权的诉讼时效期间，自受害人年满十八周岁之日起计算。
四、不适用诉讼时效
（一）请求停止侵害、排除妨碍、消除危险
（二）不动产物权和登记的动产物权的权利人请求返还财产
（三）请求支付抚养费、赡养费或者扶养费
（四）依法不适用诉讼时效的其他请求权
口诀记忆：止侵除碍消险，返还赡养财产。',
  '拓展',
  '最长诉讼时效期间自权利受到损害之日起计算且不适用诉讼时效中断、中止规定，因此也被称为客观诉讼时效期间。',
  'extension',
  '拓展|最长诉讼时效期间自权利受到损害之日起计算且不适用诉讼时效中断、中止规定，因此也被称为客观诉讼时效期间。|最长诉讼时效期间自权利受到损害之日起计算且不适用诉讼时效中断、中止规定，因此也被称为客观诉讼时效期间。|三、特殊诉讼时效
1.当事人约定同一债务分期履行的，诉讼时效期间自最后一期履行期限届满之日起计算。
2.无民事行为能力人或者限制民事行为能力人对其法定代理人的请',
  'learning',
  ''
);

COMMIT;
