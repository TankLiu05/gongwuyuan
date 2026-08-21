-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.6.docx
-- doc_date: 2026-07-06
-- generated_at: 2026-08-21T08:42:54.219Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.6.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.6.docx',
  '2026-07-06',
  '6a193db4dd181a5de3937e4ead00e22f0f3fd53d4f4031947ab63ed7f6cbfc97',
  'imported',
  '{"paragraphs":69,"articles":5,"questions":5,"knowledge":5,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  1,
  '《美丽中国建设“十五五”规划》发布',
  '2026年7月3日，国务院发布了《美丽中国建设“十五五”规划》。
《规划》提出，“十五五”时期是美丽中国建设承前启后、扩面提质，实现生态环境根本好转的关键阶段。
《规划》指出，坚持环保为民，以高水平保护支撑高质量发展，以改革为动力提升生态环境治理整体效能。
《规划》指出，以解决全流域和跨省界突出问题为重点，加强重要江河湖库系统治理和生态保护，提升湖库富营养化防治水平和应急处置能力，积极应对蓝藻水华。
《规划》指出，全面实施碳排放总量和强度双控制度。坚持风光水核等多能并举，深入开展节能降碳改造和控煤减煤，合理控制煤电装机规模和发电量，全面提升可再生能源电力消费比重，加快推进新增用电量由新增清洁能源电量覆盖。(时政来源:新华网)',
  '',
  '2026-07-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  2,
  '国家发展改革委印发《循环经济发展“十五五规划》',
  '记者2026年7月3日从国家发展改革委获悉，为认真贯彻党中央和国务院决策部署，落实生态环境法典和循环经济促进法要求，根据“十五五”规划纲要，经国务院同意，国家
发展改革委近日印发《循环经济发展“十五五”规划》。
规划明确，到2035年，循环经济高质量发展体系基本建立，主要资源利用效率达到国际先进水平。(时政来源:新华网)',
  '',
  '2026-07-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  3,
  '我国首架综合航测飞机首飞成功',
  '记者2026年7月4日从中国航空工业集团获悉，我国首架大气环境综合探测固定翼飞机平台“运12F大气综合航测飞机”近日在哈尔滨平房机场首飞成功。(时政来源:新华网)',
  '',
  '2026-07-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  4,
  '“科学”号开启第15次西太平洋科学考察任务',
  '2026年7月4日，“科学”号综合考察船驶离位于山东青2026年7月4日，岛的码头基地，执行2026年度西太平洋科学考察共享航次。(时政来源:新华网)',
  '',
  '2026-07-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  5,
  '我国成功发射千帆极轨13组卫星',
  '2026年7月4日17时30分，我国在太原卫星发射中心使用长征六号改运载火箭，成功将千帆极轨13组卫星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。(时政来源:新华网)',
  '',
  '2026-07-06',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  1,
  'document',
  '单选',
  '2026年7月3日，国务院发布了《美丽中国建设"十五五”规划》。根据规划，下列说法错误的是(   )。',
  '[{"key":"A","text":"加快推进新增用电量由新增煤电覆盖"},{"key":"B","text":"“十五五”时期是美丽中国建设承前启后、扩面提质，实现生态环境根本好转的关键阶段"},{"key":"C","text":"坚持环保为民，以改革为动力提升生态环境治理整体效能"},{"key":"D","text":"全面实施碳排放总量和强度双控制度"}]',
  'A',
  '',
  '原题',
  '2026-07-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  2,
  'document',
  '单选',
  '经国务院同意，国家发展改革委近日印发《循环经济发展“十五五”规划》。规划明确，到(   )年，循环经济高质量发展体系基本建立，主要资源利用效率达到国际先进水平。',
  '[{"key":"A","text":"2030"},{"key":"B","text":"2035"},{"key":"C","text":"2050"},{"key":"D","text":"2027"}]',
  'B',
  '',
  '原题',
  '2026-07-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  3,
  'document',
  '单选',
  '记者2026年7月4日从中国航空工业集团获悉，我国首架大气环境综合探测固定翼飞机平台()近日在哈尔滨平房机场首飞成功。',
  '[{"key":"A","text":"“运12F大气综合航测飞机”"},{"key":"B","text":"“运20F大气综合航测飞机”"},{"key":"C","text":"“运10D大气综合航测飞机”"},{"key":"D","text":"“运01D大气综合航测飞机”"}]',
  'A',
  '',
  '原题',
  '2026-07-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  4,
  'document',
  '单选',
  '2026年7月4日，(   )综合考察船驶离位于山东青岛的码头基地，执行2026年度西太平洋科学考察共享航次。',
  '[{"key":"A","text":"“极山”号"},{"key":"B","text":"“探索”号"},{"key":"C","text":"“科学”号"},{"key":"D","text":"“远科”号"}]',
  'C',
  '',
  '原题',
  '2026-07-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  5,
  'document',
  '单选',
  '2026年7月4日17时30分，我国在(   )卫星发射中心使用长征六号改运载火箭，成功将千帆极轨13组卫星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。',
  '[{"key":"A","text":"西昌"},{"key":"B","text":"酒泉"},{"key":"C","text":"文昌"},{"key":"D","text":"太原"}]',
  'D',
  '',
  '原题',
  '2026-07-06'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  1,
  '历史上的今天',
  '1895年台湾义军开展反割台斗争（乙未战争期间）1934年红军北上抗日先遣队从瑞…',
  '1895年台湾义军开展反割台斗争（乙未战争期间）1934年红军北上抗日先遣队从瑞金出发1938年第一届国民参政会于武汉召开1976年朱德元帅逝世2019年良渚古城遗址列入世界遗产名录',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1895年台湾义军开展反割台斗争（乙未战争期间）1934年红军北上抗日先遣队从瑞…|1895年台湾义军开展反割台斗争（乙未战争期间）1934年红军北上抗日先遣队从瑞金出发1938年第一届国民参政会于武汉召开1976年朱德元帅逝世2019年良渚古',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  2,
  '常识',
  '概念范围不同',
  '警察是一个大的职业概念，指依法行使警察职权、履行警察职责的国家公职人员。我国的警察体系包括四大类：
1.公安机关的人民警察（也就是通常说的“公安”）
2.国家安全机关的人民警察（国安警察）
3.司法行政机关的人民警察（监狱、戒毒所的警察）
4.人民法院和人民检察院的司法警察（法警）
公安是警察的一种，特指在公安机关工作的人民警察。公安是警察队伍中人数最多、职责最广的主体力量。
我们平时在街上看到的交警、派出所民警、刑警，这些都属于公安，是警察队伍的主力军；而监狱里的管教干部、法院里的法警、国安局的干警，虽然也叫警察，但不属于公安系统。',
  '常识',
  '公安和警察的区别',
  'common',
  '常识|公安和警察的区别|概念范围不同|警察是一个大的职业概念，指依法行使警察职权、履行警察职责的国家公职人员。我国的警察体系包括四大类：
1.公安机关的人民警察（也就是通常说的“公安”）
2.国家安',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  3,
  '常识',
  '隶属关系不同',
  '公安：隶属于公安机关系统，从中央到地方依次为公安部、公安厅（直辖市公安局）、市公安局、区县公安局、派出所。
警察：分属不同系统。除了公安系统外，还有国安系统（国家安全部）、司法行政系统（司法部/监狱管理局）、法院系统等多个系统的警察。',
  '常识',
  '公安和警察的区别',
  'common',
  '常识|公安和警察的区别|隶属关系不同|公安：隶属于公安机关系统，从中央到地方依次为公安部、公安厅（直辖市公安局）、市公安局、区县公安局、派出所。
警察：分属不同系统。除了公安系统外，还有国安系统（国',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  4,
  '常识',
  '职责范围不同',
  '公安的职责：主要包括治安管理、刑事侦查、交通管理、户籍管理、出入境管理、网络安全监管、禁毒等，是维护社会治安的主力军。
不同系统警察的职责各有侧重：国安警察负责国家安全保卫工作；监狱警察负责罪犯的监管改造；司法警察负责法庭秩序、押解犯人、执行判决等。',
  '常识',
  '公安和警察的区别',
  'common',
  '常识|公安和警察的区别|职责范围不同|公安的职责：主要包括治安管理、刑事侦查、交通管理、户籍管理、出入境管理、网络安全监管、禁毒等，是维护社会治安的主力军。
不同系统警察的职责各有侧重：国安警察负责',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.6.docx'),
  5,
  '常识',
  '总结',
  '警察是“大概念”，就像“水果”；公安是“小概念”，就像“苹果”。',
  '常识',
  '公安和警察的区别',
  'common',
  '常识|公安和警察的区别|总结|警察是“大概念”，就像“水果”；公安是“小概念”，就像“苹果”。',
  'learning',
  ''
);

COMMIT;
