-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.7.docx
-- doc_date: 2026-08-07
-- generated_at: 2026-08-21T08:42:54.226Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.7.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.7.docx',
  '2026-08-07',
  'e29156bd928b2b98b6a6ebb32cbcea7f12f34e50c6ce0c94298007e97aec1043',
  'imported',
  '{"paragraphs":80,"articles":5,"questions":5,"knowledge":9,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  1,
  '《国家综合气象观测系统建设“十五五”规划》发布',
  '经国务院批准，中国气象局与国家发展和改革委员会联合印发《国家综合气象观测系统建设“十五五”规划》。
《规划》提出，统一规划布局、统一技术标准、统一数据汇交、统一运维规范、统一资源共享，推动构建全行业统筹发展的综合气象观测格局。（时政来源：中国政府网）',
  '中国政府网',
  '2026-08-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  2,
  '我国编制完成新版全月地质图',
  '我国科研团队编制完成的1∶500万全月地质图，主图长约280厘米、高约120厘米，附带南北极局部地质图，精准标注了逾1.3万个撞击坑和81个撞击盆地，划分出14类地质构造和17种岩石类型。
记者2026年8月6日从编制方中国地质科学院地质研究所获悉，基于嫦娥工程等最新探测成果，兼顾科学严谨性与直观性，在三方面实现系统创新——
修正“月球时钟”。依据最新研究，对月球地质年代进行精细化修订，艾肯纪起始年龄调整为43.3亿年，酒海纪起始年龄调整为41.7亿年，雨海纪起始年龄微调至39.2亿年。
更新“月球物质清单”。利用嫦娥四号、六号最新发现，在南极-艾肯盆地新识别出一类名为辉长苏长岩的岩石，让人类直接“看到”月球深部物质。
定制“专属放大镜”。针对1∶500万比例尺制图需求，建立了分类型的差异化最小表达尺度。（时政来源：央视网）',
  '央视网',
  '2026-08-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  3,
  '保障生态环境法典实施 最高法发布首个配套司法解释',
  '为有效解决生态环境法典施行后新旧法律衔接适用问题，保障法典全面准确贯彻实施，最高人民法院2026年8月6日发布关于适用《中华人民共和国生态环境法典》时间效力的若干规定。这是生态环境法典首个配套司法解释，将于2026年8月15日与法典同步施行。
规定明确适用法典规定的一般标准，即以引起生态环境案件的法律事实发生的时间为准，法律事实发生在法典施行之前的，原则上应当适用当时的法律、司法解释进行裁判；法律事实发生在法典施行之后的，应当适用法典规定进行裁判。（时政来源：央视网）',
  '央视网',
  '2026-08-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  4,
  '我国首座抗17级台风高技术难度浮式风电平台投运',
  '中国海油2026年8月6日宣布，我国自主设计建造的首座16兆瓦张力腿深远海浮式风电平台“海油安澜号”成功接入陆丰油田电网并直供绿电。平台按可抵御17级台风极端工况设计建造，其投运标志着我国深远海浮式风电装备技术走向世界前列，为我国海上风电开发探索新路线。（时政来源：新华网）',
  '新华网',
  '2026-08-07',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  5,
  '科研人员确证新型粒子“胶球”的存在',
  '记者2026年8月6日从中国科学院高能物理所获悉，我国科研人员领衔的北京谱仪Ⅲ实验国际合作组，历经15年实验研究，首次证明一类全新物质形态——胶球的存在。
自然界中，原子核由质子和中子组成，质子和中子又由夸克组成，夸克之间靠胶子传递强相互作用力。粒子物理学标准模型认为，胶子之间可以相互吸引而形成一种全新的粒子——胶球。（时政来源：新华网）',
  '新华网',
  '2026-08-07',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  1,
  'document',
  '单选',
  '《国家综合气象观测系统建设“十五五”规划》提出，（  ），推动构建全行业统筹发展的综合气象观测格局。
①统一规划布局
②统一技术标准
③统一数据汇交
④统一运维规范
⑤统一资源共享',
  '[{"key":"A","text":"②③④⑤"},{"key":"B","text":"①②③⑤"},{"key":"C","text":"①②③④"},{"key":"D","text":"①②③④⑤"}]',
  'D',
  '',
  '原题',
  '2026-08-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  2,
  'document',
  '单选',
  '我国科研团队编制完成的（  ）全月地质图，主图长约280厘米、高约120厘米，附带南北极局部地质图，精准标注了逾1.3万个撞击坑和81个撞击盆地，划分出14类地质构造和17种岩石类型。',
  '[{"key":"A","text":"1∶250万"},{"key":"B","text":"1∶500万"},{"key":"C","text":"1∶800万"},{"key":"D","text":"1∶1000万"}]',
  'B',
  '',
  '原题',
  '2026-08-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  3,
  'document',
  '单选',
  '最高人民法院2026年8月6日发布关于适用《中华人民共和国生态环境法典》时间效力的若干规定。这是生态环境法典首个配套司法解释，于2026年8月15日与法典同步施行。规定明确适用法典规定的一般标准，即以引起生态环境案件的（  ）的时间为准，（  ）在法典施行之前的，原则上应当适用当时的法律、司法解释进行裁判；（  ）在法典施行之后的，应当适用法典规定进行裁判。',
  '[{"key":"A","text":"法律事实发生"},{"key":"B","text":"违法行为立案"},{"key":"C","text":"损害结果发生"},{"key":"D","text":"当事人起诉"}]',
  'A',
  '',
  '原题',
  '2026-08-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  4,
  'document',
  '单选',
  '中国海油2026年8月6日宣布，我国自主设计建造的首座16兆瓦张力腿深远海浮式风电平台（  ）成功接入陆丰油田电网并直供绿电。平台按可抵御（  ）级台风极端工况设计建造。',
  '[{"key":"A","text":"“海油观澜号”；16"},{"key":"B","text":"“海油启航号”；16"},{"key":"C","text":"“海油安澜号”；17"},{"key":"D","text":"“海油静海号”；18"}]',
  'C',
  '',
  '原题',
  '2026-08-07'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  5,
  'document',
  '单选',
  '记者2026年8月6日从中国科学院高能物理所获悉，我国科研人员领衔的北京谱仪Ⅲ实验国际合作组，历经15年实验研究，首次证明一类全新物质形态——（  ）的存在。',
  '[{"key":"A","text":"夸克"},{"key":"B","text":"胶子"},{"key":"C","text":"量子"},{"key":"D","text":"胶球"}]',
  'D',
  '',
  '原题',
  '2026-08-07'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  1,
  '历史上的今天',
  '1919年孙中山辞去政务总裁一职',
  '1919年孙中山辞去政务总裁一职',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1919年孙中山辞去政务总裁一职|1919年孙中山辞去政务总裁一职',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  2,
  '历史上的今天',
  '1927年“八七会议”召开',
  '1927年“八七会议”召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1927年“八七会议”召开|1927年“八七会议”召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  3,
  '历史上的今天',
  '1947年刘邓大军开始千里挺进大别山',
  '1947年刘邓大军开始千里挺进大别山',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1947年刘邓大军开始千里挺进大别山|1947年刘邓大军开始千里挺进大别山',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  4,
  '历史上的今天',
  '1959年台湾中南部发生八七水灾',
  '1959年台湾中南部发生八七水灾',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1959年台湾中南部发生八七水灾|1959年台湾中南部发生八七水灾',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  5,
  '历史上的今天',
  '1971年“阿波罗——15号”安全着陆',
  '1971年“阿波罗——15号”安全着陆',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1971年“阿波罗——15号”安全着陆|1971年“阿波罗——15号”安全着陆',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  6,
  '常识',
  '什么是热射病',
  '热射病是高温相关急症中最严重的情况，即重症中暑，是由于暴露在高温高湿环境中身体调节功能失衡，产热大于散热，导致核心温度迅速升高，超过40℃，伴有皮肤灼热、意识障碍及多器官功能障碍的严重致命性疾病，是中暑最严重的类型，一旦发生，死亡率极高。',
  '常识',
  '热射病',
  'common',
  '常识|热射病|什么是热射病|热射病是高温相关急症中最严重的情况，即重症中暑，是由于暴露在高温高湿环境中身体调节功能失衡，产热大于散热，导致核心温度迅速升高，超过40℃，伴有皮肤灼热、意识障',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  7,
  '常识',
  '热射病分类',
  '根据发病原因和易感人群的不同，热射病可分为劳力型热射病和非劳力型热射病（又称经典型热射病）。
1.劳力型热射病主要由于高强度体力活动引起机体产热与散热失衡而发病。患者多为平素健康的年轻人。
2.经典型热射病主要由高温和（或）高湿环境因素引起，通常没有剧烈的体力活动，多见于居住拥挤和通风不良的城市老年体衰居民。',
  '常识',
  '热射病',
  'common',
  '常识|热射病|热射病分类|根据发病原因和易感人群的不同，热射病可分为劳力型热射病和非劳力型热射病（又称经典型热射病）。
1.劳力型热射病主要由于高强度体力活动引起机体产热与散热失衡而发病',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  8,
  '常识',
  '热射病的常见症状',
  '1.体温升高：核心体温多在40℃以上
2.中枢神经系统异常：昏迷、嗜睡、幻觉等。
3.其他症状：头痛、恶心、皮肤发红、抽搐、胡言乱语等',
  '常识',
  '热射病',
  'common',
  '常识|热射病|热射病的常见症状|1.体温升高：核心体温多在40℃以上
2.中枢神经系统异常：昏迷、嗜睡、幻觉等。
3.其他症状：头痛、恶心、皮肤发红、抽搐、胡言乱语等',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.7.docx'),
  9,
  '常识',
  '热射病救治',
  '核心原则：降温第一，转运第二，边降温边送医。
1.迅速转移：立即将患者转移到阴凉通风处或空调房间，彻底脱离高温环境，停止一切活动。解开衣物，充分暴露皮肤。
2.快速降温：将患者（除头部外）浸泡在15～20℃冷水中，持续10～15分钟。或者用冷水反复擦拭全身皮肤，重点擦拭颈部、腋窝、腹股沟等大血管丰富部位，同时配合风扇吹风加速散热。
3.科学处置抽搐与补水：患者抽搐时，不要往嘴里塞任何东西，不要掐人中，防止咬伤舌头和窒息。让患者侧卧，保持呼吸道通畅。意识清醒者可少量多次饮用淡盐水或运动饮料补充水分和电解质。意识模糊/昏迷者严禁喂水喂药，以免误吸导致窒息死亡。
4.立即拨打120：热射病是致命急症，现场降温的同时必须立即拨打急救电话，尽快送医进行专业救治。五、热射病预防
最有效的预防措施是避免高温（高湿）及不通风的环境、减少和避免中暑发生的危险因素、保证充分的休息时间、避免脱水的发生，从而减少热射病的发生率及病死率。
【大白话总结】
热射病就是最严重的中暑，能要命。特征是体温超40℃，人糊涂、说胡话、抽风甚至昏迷，皮肤滚烫发红，这时候别犹豫，直接打120。大太阳下玩命干活/运动的年轻人，和身体弱散热差的老人、小孩、病人容易得热射病。先降温再送医，别瞎喂水。搬阴凉处，泡冷水或擦凉水+吹风。清醒的能喝点淡盐水，昏迷的千万别灌水，会呛死。',
  '常识',
  '热射病',
  'common',
  '常识|热射病|热射病救治|核心原则：降温第一，转运第二，边降温边送医。
1.迅速转移：立即将患者转移到阴凉通风处或空调房间，彻底脱离高温环境，停止一切活动。解开衣物，充分暴露皮肤。
2.',
  'learning',
  ''
);

COMMIT;
