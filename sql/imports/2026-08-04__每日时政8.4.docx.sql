-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.4.docx
-- doc_date: 2026-08-04
-- generated_at: 2026-08-21T08:42:54.225Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.4.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.4.docx',
  '2026-08-04',
  '434f2d2474dbe727cf68e45ad4675497911d99fad84ea4e496ee758b3a890bc0',
  'imported',
  '{"paragraphs":77,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  1,
  '《科学规划促发展》出版发行',
  '中央宣传部理论局组织编写了2026年“理论热点面对面”通俗理论读物《科学规划促发展》。该书已由学习出版社、人民出版社联合出版，即日起在全国发行。
该书秉承“理论热点面对面”系列通俗理论读物的一贯风格，坚持学理性与普及性相统一，注重从学术基础、实践导向、国际视野、历史维度等方面着力开展解读，说理透彻、文风鲜活，是干部群众、青年学生进行理论学习和开展形势政策教育的重要辅导读物。（时政来源：人民网）',
  '人民网',
  '2026-08-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  2,
  '上半年我国海洋生产总值5.5万亿元',
  '自然资源部2026年8月3日发布海洋经济运行情况显示，今年上半年，我国海洋经济规模不断壮大，内生发展韧劲显现，牵引作用凸显。初步核算，上半年全国海洋生产总值5.5万亿元，同比增长5.1%，高于国内生产总值增速0.4个百分点，海洋生产总值占国内生产总值比重为7.9%。（时政来源：人民网）',
  '人民网',
  '2026-08-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  3,
  '两部门联合印发“十五五”公共机构节能降碳工作方案',
  '国管局、国家发展改革委日前联合印发《“十五五”公共机构节能降碳工作方案》。
方案提出，以2025年碳排放、能源资源消费为基数，到2030年，统计范围内公共机构单位建筑面积碳排放下降8.5%，单位建筑面积能耗下降5%，人均用水量下降3%。其中，公共机构碳排放强度降低是碳达峰碳中和综合评价考核的支撑性指标之一，公共机构人均用水量下降是落实水资源刚性约束制度考核二级指标之一，每年度都需要进行考核。（时政来源：人民网）',
  '人民网',
  '2026-08-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  4,
  '全国供销合作社将全面升级为农服务',
  '近日，《全国供销合作社“十五五”发展规划》发布，为“十五五”时期供销合作事业高质量发展指明方向。
作为国家农资流通主渠道，全国供销合作社系统将通过网络建设和绿色发展“两手抓”，进一步夯实保供稳价基础，稳住粮食生产基本盘。
根据规划，到2030年，全系统将依托“六横七纵两沿”全国农资流通走廊，新建或改造100个左右国家战略性农资储备库、1000个左右县域农资配送中心。（时政来源：人民网）',
  '人民网',
  '2026-08-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  5,
  '我国首次开展碳效领跑者企业遴选',
  '记者2026年8月3日获悉，工业和信息化部等三部门日前联合印发《关于组织开展2026年度重点行业能效、碳效领跑者企业推荐工作的通知》，旨在促进工业企业实施节能降碳改造，推动重点行业绿色低碳转型。这是我国首次开展碳效领跑者企业遴选。
通知提出，进一步扩大重点行业能效领跑者覆盖行业范围，新增工业硫酸、工业冰醋酸、甲醛、苯乙烯和单晶硅等细分行业，推荐范围拓展至43个细分行业。在能效领跑者工作基础上，此次还创新开展碳效领跑者推荐工作，并将电解铝、水泥熟料、合成氨、乙烯、甲醇等5个行业作为首批碳效领跑者企业推荐范围。（时政来源：新华网）',
  '新华网',
  '2026-08-04',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  1,
  'document',
  '单选',
  '中央宣传部理论局组织编写了2026年“理论热点面对面”通俗理论读物《科学规划促发展》。该书已由学习出版社、人民出版社联合出版，即日起在全国发行。该书秉承“理论热点面对面”系列通俗理论读物的一贯风格，坚持学理性与（  ）相统一，注重从学术基础、实践导向、国际视野、历史维度等方面着力开展解读，说理透彻、文风鲜活，是干部群众、青年学生进行理论学习和开展形势政策教育的重要辅导读物。',
  '[{"key":"A","text":"普及性"},{"key":"B","text":"学术性"},{"key":"C","text":"专业性"},{"key":"D","text":"政治性"}]',
  'A',
  '',
  '原题',
  '2026-08-04'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  2,
  'document',
  '单选',
  '自然资源部2026年8月3日发布海洋经济运行情况显示，今年上半年，我国海洋经济规模不断壮大，内生发展韧劲显现，牵引作用凸显。初步核算，上半年全国海洋生产总值（  ）万亿元，同比增长5.1%。',
  '[{"key":"A","text":"10.9"},{"key":"B","text":"5.5"},{"key":"C","text":"7.1"},{"key":"D","text":"3.4"}]',
  'B',
  '',
  '原题',
  '2026-08-04'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  3,
  'document',
  '单选',
  '《“十五五”公共机构节能降碳工作方案》提出，以（  ）为基数，到2030年，统计范围内公共机构单位建筑面积碳排放下降8.5%，单位建筑面积能耗下降5%，人均用水量下降3%。',
  '[{"key":"A","text":"2025年碳排放、能源资源消费"},{"key":"B","text":"“十四五”时期碳排放、能源资源消费总量"},{"key":"C","text":"2026年碳排放、能源资源消费"},{"key":"D","text":"“十四五”时期碳排放总量"}]',
  'A',
  '',
  '原题',
  '2026-08-04'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  4,
  'document',
  '单选',
  '《全国供销合作社“十五五”发展规划》为“十五五”时期供销合作事业高质量发展指明方向。作为国家农资流通主渠道，全国供销合作社系统将通过（  ）“两手抓”，进一步夯实保供稳价基础，稳住粮食生产基本盘。',
  '[{"key":"A","text":"产业升级和数字转型"},{"key":"B","text":"城乡流通与产销对接"},{"key":"C","text":"网络建设和绿色发展"},{"key":"D","text":"农资储备与农技推广"}]',
  'C',
  '',
  '原题',
  '2026-08-04'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  5,
  'document',
  '单选',
  '记者2026年8月3日获悉，工业和信息化部等三部门日前联合印发《关于组织开展2026年度重点行业能效、碳效领跑者企业推荐工作的通知》。在能效领跑者工作基础上，此次还创新开展碳效领跑者推荐工作，并将（  ）等5个行业作为首批碳效领跑者企业推荐范围。',
  '[{"key":"A","text":"铜冶炼、工业硅、钛白粉、黄磷、煤制烯烃"},{"key":"B","text":"工业硫酸、工业冰醋酸、甲醛、苯乙烯和单晶硅"},{"key":"C","text":"钢铁、平板玻璃、造纸、纺织、电石"},{"key":"D","text":"电解铝、水泥熟料、合成氨、乙烯、甲醇"}]',
  'D',
  '',
  '原题',
  '2026-08-04'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  1,
  '历史上的今天',
  '1789年法国废除封建制',
  '1789年法国废除封建制',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1789年法国废除封建制|1789年法国废除封建制',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  2,
  '历史上的今天',
  '1900年中国东北瑷珲城火烧案',
  '1900年中国东北瑷珲城火烧案',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年中国东北瑷珲城火烧案|1900年中国东北瑷珲城火烧案',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  3,
  '历史上的今天',
  '1913年熊克武在重庆宣布独立',
  '1913年熊克武在重庆宣布独立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1913年熊克武在重庆宣布独立|1913年熊克武在重庆宣布独立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  4,
  '历史上的今天',
  '1913年孙中山等大批党人出逃日本',
  '1913年孙中山等大批党人出逃日本',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1913年孙中山等大批党人出逃日本|1913年孙中山等大批党人出逃日本',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  5,
  '历史上的今天',
  '1935年中共中央在毛儿盖召开政治局会议',
  '1935年中共中央在毛儿盖召开政治局会议',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1935年中共中央在毛儿盖召开政治局会议|1935年中共中央在毛儿盖召开政治局会议',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  6,
  '常识',
  '简介',
  '幽门螺杆菌，简称Hp，是一种螺旋形、微厌氧的革兰氏阴性菌，是目前所知唯一能在人体胃部强酸环境中长期存活的细菌。它主要寄生在胃黏膜及十二指肠内，通过分泌尿素酶分解尿素产生氨，中和胃酸，营造适宜生存的微环境。',
  '常识',
  '幽门螺杆菌',
  'common',
  '常识|幽门螺杆菌|简介|幽门螺杆菌，简称Hp，是一种螺旋形、微厌氧的革兰氏阴性菌，是目前所知唯一能在人体胃部强酸环境中长期存活的细菌。它主要寄生在胃黏膜及十二指肠内，通过分泌尿素酶分解',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  7,
  '常识',
  '传播途径',
  '1.口-口传播：共用餐具、水杯、深度接吻、口对口喂食、咀嚼后喂食儿童等行为，使病菌通过唾液传播。
2.粪-口传播：幽门螺杆菌随粪便排出体外，污染水源或食物，健康人接触后经口进入体内而感染。
3.医源性传播：口腔、牙科、鼻腔等侵入式检查或治疗可能造成感染。',
  '常识',
  '幽门螺杆菌',
  'common',
  '常识|幽门螺杆菌|传播途径|1.口-口传播：共用餐具、水杯、深度接吻、口对口喂食、咀嚼后喂食儿童等行为，使病菌通过唾液传播。
2.粪-口传播：幽门螺杆菌随粪便排出体外，污染水源或食物，健康',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  8,
  '常识',
  '感染症状',
  '多数感染者无明显症状，部分人可能出现：
1.消化不良：腹胀、嗳气、早饱、食欲减退、餐后饱胀。
2.胃痛：隐痛、胀痛或刺痛，进食后可能加重，伴有反酸、烧心。
3.口臭：细菌产生的分泌物导致口腔异味。
4.其他：长期感染可能引发恶心、呕吐、黑便等症状。',
  '常识',
  '幽门螺杆菌',
  'common',
  '常识|幽门螺杆菌|感染症状|多数感染者无明显症状，部分人可能出现：
1.消化不良：腹胀、嗳气、早饱、食欲减退、餐后饱胀。
2.胃痛：隐痛、胀痛或刺痛，进食后可能加重，伴有反酸、烧心。
3.',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  9,
  '常识',
  '检测方法',
  '1.非侵入性检测
（1）碳13/碳14尿素呼气试验：口服含标记尿素的试剂后呼气检测，简便无创，准确性高。
（2）血清抗体检测：检测血液中幽门螺杆菌特异性抗体，但无法区分现症感染或既往感染。
（3）粪便抗原检测：检测粪便中幽门螺杆菌抗原。
2.侵入性检测
胃镜检查：直接观察胃部情况，取胃黏膜组织进行快速尿素酶试验、病理检查或细菌培养。',
  '常识',
  '幽门螺杆菌',
  'common',
  '常识|幽门螺杆菌|检测方法|1.非侵入性检测
（1）碳13/碳14尿素呼气试验：口服含标记尿素的试剂后呼气检测，简便无创，准确性高。
（2）血清抗体检测：检测血液中幽门螺杆菌特异性抗体，但',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.4.docx'),
  10,
  '常识',
  '治疗方案',
  '目前主要采用铋剂四联疗法，即2种抗生素（如阿莫西林、克拉霉素）+1种质子泵抑制剂（如奥美拉唑、雷贝拉唑）+1种铋剂（如枸橼酸铋钾），疗程通常为10-14天。治疗后需停药1个月复查，确认是否根除。
【大白话总结】
简单说，幽门螺杆菌就是唯一能扛住胃酸、长期“住”在人胃里的细菌，也是很多慢性胃炎、胃溃疡的常见诱因。幽门螺杆菌就核心是“病从口入”——共用餐具、大人嚼碎食物喂孩子、接吻都可能通过唾液传染；喝了、吃了被粪便污染的水和食物也会中招。幽门螺杆菌首选吹口气的碳13/碳14试验，无创又准确。',
  '常识',
  '幽门螺杆菌',
  'common',
  '常识|幽门螺杆菌|治疗方案|目前主要采用铋剂四联疗法，即2种抗生素（如阿莫西林、克拉霉素）+1种质子泵抑制剂（如奥美拉唑、雷贝拉唑）+1种铋剂（如枸橼酸铋钾），疗程通常为10-14天。治疗',
  'learning',
  ''
);

COMMIT;
