-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.19.docx
-- doc_date: 2026-07-19
-- generated_at: 2026-08-21T08:42:54.222Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.19.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.19.docx',
  '2026-07-19',
  'b7066db3ef3ba8026af11f92d45dd416206c77199e40479fb40d0392f7478f3b',
  'imported',
  '{"paragraphs":67,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  1,
  '七部门发文在未成年人司法保护中充分发挥银发力量',
  '记者2026年7月17日从最高人民法院获悉，最高人民法院等多部门近日联合印发《关于在未成年人司法保护工作中充分发挥银发力量的意见》，进一步凝聚未成年人保护合力。
意见强调，要做到依法依规、因案因人施策，根据退休同志专业特长、工作经验，依据自觉自愿、量力而行原则，合理安排工作任务和时间。（时政来源：新华网）',
  '新华网',
  '2026-07-19',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  2,
  '《人工智能合作发展行动计划》发布',
  '7月17日，2026世界人工智能大会暨人工智能全球治理高级别会议在上海召开。会上，国家发展改革委会同有关部门共同发布了《人工智能合作发展行动计划》。
《人工智能合作发展行动计划》旨在贯彻落实习近平总书记有关“人工智能应该是造福全人类的国际公共产品”的重要指示精神，从数据、算力、生态、赋能、人才、规则、治理和伦理等方面，提出优质数据供给、智能算力普惠、开源生态共享、人工智能深度赋能、数智人才共育、规则标准共建、安全治理协作、人工智能向善等八项行动，以务实举措响应联合国关于加强人工智能国际合作、弥合数字鸿沟、推动人工智能赋能可持续发展等方面的倡议。（时政来源：新华网）',
  '新华网',
  '2026-07-19',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  3,
  '全球首个千亿参数级！“风和”模型全球开源计划启动',
  '7月17日，在2026世界人工智能大会（WAIC）气象专会上，中国气象局发布人工智能气象服务系统“风和”大语言模型，并启动“风和”全球开源计划。（时政来源：央广网）',
  '央广网',
  '2026-07-19',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  4,
  '中国气象智能预警方案“妈祖（MAZU）”吉布提2.0版交付',
  '中国气象局7月17日在2026世界人工智能大会暨人工智能全球治理高级别会议气象主题分论坛上正式向吉布提交付中国气象智能预警方案“妈祖（MAZU）”吉布提2.0版。（时政来源：新华网）',
  '新华网',
  '2026-07-19',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  5,
  '第五届大象国际传播论坛在云南西双版纳举行',
  '第五届大象国际传播论坛2026年7月16日在云南省西双版纳傣族自治州举行。与会人士表示，云南亚洲象的保护成效受到全球关注，展现了中国推进生态文明建设、促进人与自然和谐共生的生动实践。以大象为媒，大象国际传播论坛持续打造具有国际影响力的传播平台，逐渐成为讲好中国故事、传播云南声音、促进文明交流互鉴的重要窗口。（时政来源：新华网）',
  '新华网',
  '2026-07-19',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  1,
  'document',
  '单选',
  '最高人民法院等多部门近日联合印发《关于在未成年人司法保护工作中充分发挥银发力量的意见》，进一步凝聚未成年人保护合力。意见强调，要做到依法依规、因案因人施策，根据退休同志专业特长、工作经验，依据（  ）原则，合理安排工作任务和时间。',
  '[{"key":"A","text":"自觉自愿、量力而行"},{"key":"B","text":"统一调配、全员参与"},{"key":"C","text":"按需分配、强制服务"},{"key":"D","text":"择优遴选、高龄优先"}]',
  'A',
  '',
  '原题',
  '2026-07-19'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  2,
  'document',
  '单选',
  '7月17日，2026世界人工智能大会暨人工智能全球治理高级别会议在上海召开。会上，国家发展改革委会同有关部门共同发布了《人工智能合作发展行动计划》。《人工智能合作发展行动计划》旨在贯彻落实习近平总书记有关（  ）的重要指示精神。',
  '[{"key":"A","text":"“数字技术发展要优先保障本国产业竞争优势”"},{"key":"B","text":"“人工智能应该是造福全人类的国际公共产品”"},{"key":"C","text":"“人工智能应该是造福全人类的重要贸易商品”"},{"key":"D","text":"“人工智能发展要构建封闭自主的技术发展体系”"}]',
  'B',
  '',
  '原题',
  '2026-07-19'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  3,
  'document',
  '单选',
  '7月17日，在2026世界人工智能大会（WAIC）气象专会上，中国气象局发布人工智能气象服务系统（  ）大语言模型，并启动（  ）全球开源计划。',
  '[{"key":"A","text":"“风和”"},{"key":"B","text":"“妈祖”"},{"key":"C","text":"“风顺”"},{"key":"D","text":"“风清”"}]',
  'A',
  '',
  '原题',
  '2026-07-19'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  4,
  'document',
  '单选',
  '中国气象局7月17日在2026世界人工智能大会暨人工智能全球治理高级别会议气象主题分论坛上正式向吉布提交付中国气象智能预警方案（  ）吉布提2.0版。',
  '[{"key":"A","text":"“观云（GUANYUN）”"},{"key":"B","text":"“波塞冬（Poseidon）”"},{"key":"C","text":"“妈祖（MAZU）”"},{"key":"D","text":"“云帆（YUNFAN）”"}]',
  'C',
  '',
  '原题',
  '2026-07-19'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  5,
  'document',
  '单选',
  '第五届大象国际传播论坛2026年7月16日在云南省西双版纳傣族自治州举行。云南（  ）的保护成效受到全球关注，展现了中国推进生态文明建设、促进人与自然和谐共生的生动实践。以大象为媒，大象国际传播论坛持续打造具有国际影响力的传播平台，逐渐成为讲好中国故事、传播云南声音、促进文明交流互鉴的重要窗口。',
  '[{"key":"A","text":"非洲草原象"},{"key":"B","text":"非洲森林象"},{"key":"C","text":"侏儒象"},{"key":"D","text":"亚洲象"}]',
  'D',
  '',
  '原题',
  '2026-07-19'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  1,
  '历史上的今天',
  '1864年太平天国都城天京失陷',
  '1864年太平天国都城天京失陷',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1864年太平天国都城天京失陷|1864年太平天国都城天京失陷',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  2,
  '历史上的今天',
  '1870年普法战争爆发',
  '1870年普法战争爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1870年普法战争爆发|1870年普法战争爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  3,
  '历史上的今天',
  '1917年孙中山南下广州护法',
  '1917年孙中山南下广州护法',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1917年孙中山南下广州护法|1917年孙中山南下广州护法',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  4,
  '历史上的今天',
  '1920年共产国际第二次代表大会在苏联莫斯科召开',
  '1920年共产国际第二次代表大会在苏联莫斯科召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1920年共产国际第二次代表大会在苏联莫斯科召开|1920年共产国际第二次代表大会在苏联莫斯科召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  5,
  '历史上的今天',
  '1975年美苏宇航员太空会面',
  '1975年美苏宇航员太空会面',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1975年美苏宇航员太空会面|1975年美苏宇航员太空会面',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  6,
  '常识',
  '学习教育重点及时间',
  '学习教育以县处级以上领导班子和领导干部特别是“一把手”为重点，于2026年春节假期后启动、7月底基本结束。',
  '常识',
  '正确政绩观学习教育',
  'common',
  '常识|正确政绩观学习教育|学习教育重点及时间|学习教育以县处级以上领导班子和领导干部特别是“一把手”为重点，于2026年春节假期后启动、7月底基本结束。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  7,
  '常识',
  '学习教育意义',
  '在全党开展树立和践行正确政绩观学习教育，是贯彻落实党的二十届四中全会战略部署、确保基本实现社会主义现代化取得决定性进展的必然要求，是践行党的根本宗旨、夯实党的执政根基的重要举措，是巩固拓展党内集中学习教育成果、持之以恒推进全面从严治党的有效途径，对于推进党和国家事业、对于推进全面从严治党意义重大。',
  '常识',
  '正确政绩观学习教育',
  'common',
  '常识|正确政绩观学习教育|学习教育意义|在全党开展树立和践行正确政绩观学习教育，是贯彻落实党的二十届四中全会战略部署、确保基本实现社会主义现代化取得决定性进展的必然要求，是践行党的根本宗旨、夯实党的执',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  8,
  '常识',
  '学习教育要求',
  '以立党为公、为民造福、科学决策、真抓实干为总要求，以一体推进学查改为抓手，教育引导各级党组织和党员、干部坚持实事求是、求真务实，为人民出政绩、以实干出政绩，有效防范和纠治政绩观偏差，坚决有力贯彻落实党中央重大决策部署，完整准确全面贯彻新发展理念，加快构建新发展格局，着力推动高质量发展，创造经得起实践、人民、历史检验的实绩，推动“十五五”开好局、起好步，为以中国式现代化全面推进强国建设、民族复兴伟业提供有力保障。',
  '常识',
  '正确政绩观学习教育',
  'common',
  '常识|正确政绩观学习教育|学习教育要求|以立党为公、为民造福、科学决策、真抓实干为总要求，以一体推进学查改为抓手，教育引导各级党组织和党员、干部坚持实事求是、求真务实，为人民出政绩、以实干出政绩，有效',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  9,
  '常识',
  '学习教育落实',
  '学习教育要坚持聚焦主题、简约务实，不分批次、不划阶段，认真落实学习研讨、查摆问题、整改整治、建章立制、开门教育等工作安排。坚持学查改一体推进，在深学、真查、实改上下功夫见成效。着力完善制度、立好规矩，健全有效防范和纠治政绩观偏差工作机制。
要组织党员、干部深入学习习近平总书记关于树立和践行正确政绩观的重要论述，深入学习《中共中央关于制定国民经济和社会发展第十五个五年规划的建议》，深入学习习近平总书记关于本地区本部门本领域的重要讲话和重要指示精神，进一步强化立党为公、为民造福理念。县处级以上领导班子及其成员通过督促检查、调查研究、了解群众反映等途径，深入查找政绩观方面存在的问题，从党性上找差距、查根源、强修养。
要坚持与中央巡视整改、深入贯彻中央八项规定精神学习教育整改、“十五五”规划编制实施、生态环保督察整改等相结合，边查边改、立行立改，对突出问题开展集中整治，持续推动整改落实。做好建章立制，深入查找现行制度机制中不符合正确政绩观要求的规定，该废止的废止，该修订的修订。
要坚持开门教育，查摆问题听取群众意见，整改整治接受群众监督，检验成效接受群众评判；坚持民生为大，为群众多办实事，让群众可感可及。',
  '常识',
  '正确政绩观学习教育',
  'common',
  '常识|正确政绩观学习教育|学习教育落实|学习教育要坚持聚焦主题、简约务实，不分批次、不划阶段，认真落实学习研讨、查摆问题、整改整治、建章立制、开门教育等工作安排。坚持学查改一体推进，在深学、真查、实改',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.19.docx'),
  10,
  '常识',
  '学习教育领导',
  '学习教育在党中央领导下进行，中央党的建设工作领导小组抓好统筹协调。各级党委（党组）要对学习教育负总责。行业系统主管部门党委（党组）要充分发挥对本行业本系统学习教育的指导作用。要压实工作责任，坚持分类指导，强化真督实导，注重宣传引导，统筹抓好学习教育和中心工作，高质量完成各项任务。',
  '常识',
  '正确政绩观学习教育',
  'common',
  '常识|正确政绩观学习教育|学习教育领导|学习教育在党中央领导下进行，中央党的建设工作领导小组抓好统筹协调。各级党委（党组）要对学习教育负总责。行业系统主管部门党委（党组）要充分发挥对本行业本系统学习教',
  'learning',
  ''
);

COMMIT;
