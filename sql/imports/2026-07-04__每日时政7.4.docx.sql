-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.4.docx
-- doc_date: 2026-07-04
-- generated_at: 2026-08-21T08:42:54.218Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.4.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.4.docx',
  '2026-07-04',
  '1babdc4c2c7f87b7d6b36e218574940565dcd3d2bc7971b772e41dbfda196a6b',
  'imported',
  '{"paragraphs":54,"articles":5,"questions":3,"knowledge":10,"warnings":["题目选项异常偏多：1"]}',
  '本地规则重解析完成；提示：题目选项异常偏多：1',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  1,
  '中国第16次北冰洋考察启航',
  '2026年7月3日，由自然资源部组织的中国第16次北冰洋考察队“雪龙”号、“雪龙2”号、北海局“极地”号从大连启航，这是“十五五”开局之年我国组织实施的首次北冰洋考察，由“雪龙”号、“雪龙2”号、北海局“极地”号、“探索三号”四船共同实施，预计10月上旬完成考察任务。（时政来源：央视网）',
  '央视网',
  '2026-07-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  2,
  '习近平党建思想的时代特质与世界意义智库报告发布',
  '中共中央党校（国家行政学院）国家高端智库、新华社国家高端智库2026年7月2日联合发布《习近平党建思想的时代特质与世界意义》智库报告。
报告认为，习近平党建思想深刻回答了新时代党的建设重大理论和实践问题，以一系列原创性成果丰富和发展了马克思主义建党学说。“十四个坚持”是对习近平总书记关于新时代党的建设具有标志性引领性的新理念、新思想、新战略的集中概括。（时政来源：央视网）',
  '央视网',
  '2026-07-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  3,
  '2026两岸青年峰会在北京开幕',
  '2026两岸青年峰会7月2日在北京开幕。中共中央政治局委员、北京市委书记尹力在开幕式上表示，近年来，京台青年交流合作不断深化，越来越多台胞从旅游观光转向定居扎根，台湾学子从短期游学访学不断向长期就业创业延伸。
中共中央台办、国务院台办主任宋涛表示，两岸青年要立大志，为实现民族复兴共同奋斗，积极投身中国式现代化建设，把人生理想融入国家和民族的事业中，为中华民族伟大复兴踔厉奋发、笃行不怠。两岸青年要明大义，为守护共同家园不懈奋斗，把民族命运牢牢掌握在中国人自己手中，守护好、建设好、发展好中华民族共同家园，推动两岸关系和平发展，坚定推进祖国统一大业。两岸青年要行大道，为增进同胞福祉努力奋斗，热忱欢迎更多台湾青年来大陆追梦、筑梦、圆梦，做两岸交流合作、融合发展的参与者、贡献者和受益者，在奋斗的青春中书写人生华章。（时政来源：人民网）',
  '人民网',
  '2026-07-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  4,
  '国务院残疾人工作委员会印发《残疾人保障和发展“十五五”规划》',
  '国务院残疾人工作委员会印发《残疾人保障和发展“十五五”规划》，明确了“十五五”时期我国残疾人保障和发展主要指标、重要政策和重点服务工程项目。
规划明确，支持人口20万以上县（市、区、旗）办好一所达到标准的特殊教育学校，人口20万以下县（市、区、旗）因地制宜设立特教班；鼓励有条件的养老机构或其他照护机构设立“老年父母+残疾子女”家庭照护单元；完善落实0—6岁儿童孤独症筛查干预服务规范，建立筛查、诊断、康复救助衔接机制，规范全流程服务。（时政来源：人民网）',
  '人民网',
  '2026-07-04',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  5,
  '《国家气象灾害防御规划》出台',
  '近日，中国气象局出台《国家气象灾害防御规划（2026—2030年）》。《规划》明确，到2030年，要做到气象灾害防御体系和能力现代化取得显著进展，与极端天气频发重发广发新常态相适应的防御机制逐步健全，以事前预防为主的气象灾害防御模式有效建立。气象灾害依法防御、科学防御、智慧防御基本实现，气象灾害监测预报预警能力和全社会防范应对能力持续增强，重点地区和行业气象灾害防御水平显著提高，重特大气象灾害防范应对有力有效。（时政来源：人民网）',
  '人民网',
  '2026-07-04',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  1,
  'document',
  '单选',
  '2026年7月3日，中国第16次北冰洋考察队从大连启航，这是“十五五”开局之年我国组织实施的首次北冰洋考察。此次考察由（  ）四船共同实施，预计10月上旬完成考察任务。',
  '[{"key":"A","text":"“雪龙”号、“雪龙2”号、北海局“极地”号、“探索三号”"},{"key":"B","text":"“雪龙2”号、北海局“极地”号、“深海一号”、“奋斗者”号"},{"key":"C","text":"“雪龙”号、北海局“极地”号、“深海一号”、“探索二号”"},{"key":"D","text":"“雪龙”号、“雪龙2”号、“深海一号”、“探索三号”2、【单选】中共中央党校（国家行政学院）国家高端智库、新华社国家高端智库2026年7月2日联合发布《习近平党建思想的时代特质与世界意义》智库报告。报告认为，（  ）是对习近平总书记关于新时代党的建设具有标志性引领性的新理念、新思想、新战略的集中概括。"},{"key":"A","text":"“九个以”的实践要求"},{"key":"B","text":"“十四个坚持”"},{"key":"C","text":"“十个明确”"},{"key":"D","text":"“两个结合”3、【单选】2026两岸青年峰会7月2日在北京开幕。中共中央台办、国务院台办主任宋涛表示，两岸青年要（  ），为实现民族复兴共同奋斗，积极投身中国式现代化建设，把人生理想融入国家和民族的事业中，为中华民族伟大复兴踔厉奋发、笃行不怠。"},{"key":"A","text":"行大道"},{"key":"B","text":"图私利"},{"key":"C","text":"立大志"},{"key":"D","text":"守小利"}]',
  'A',
  '',
  '原题',
  '2026-07-04'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  4,
  'document',
  '单选',
  '《残疾人保障和发展“十五五”规划》明确，支持人口（  ）以上县（市、区、旗）办好一所达到标准的特殊教育学校，人口（  ）以下县（市、区、旗）因地制宜设立特教班。',
  '[{"key":"A","text":"100万"},{"key":"B","text":"50万"},{"key":"C","text":"30万"},{"key":"D","text":"20万"}]',
  'D',
  '',
  '原题',
  '2026-07-04'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  5,
  'document',
  '单选',
  '近日，中国气象局出台《国家气象灾害防御规划（2026—2030年）》。根据《规划》，下列哪一项不是到2030年要实现的目标？（  ）',
  '[{"key":"A","text":"气象灾害依法防御、科学防御、智慧防御全面实现"},{"key":"B","text":"气象灾害监测预报预警能力和全社会防范应对能力持续增强"},{"key":"C","text":"以事前预防为主的气象灾害防御模式有效建立"},{"key":"D","text":"与极端天气频发重发广发新常态相适应的防御机制逐步健全"}]',
  'A',
  '',
  '原题',
  '2026-07-04'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  1,
  '历史上的今天',
  '1776年美国独立日',
  '1776年美国独立日',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1776年美国独立日|1776年美国独立日',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  2,
  '历史上的今天',
  '1802年美国西点军校成立',
  '1802年美国西点军校成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1802年美国西点军校成立|1802年美国西点军校成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  3,
  '历史上的今天',
  '1904年我国历史上最后一次科举考试',
  '1904年我国历史上最后一次科举考试',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1904年我国历史上最后一次科举考试|1904年我国历史上最后一次科举考试',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  4,
  '历史上的今天',
  '1949年国民党以银元券代替金元券',
  '1949年国民党以银元券代替金元券',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年国民党以银元券代替金元券|1949年国民党以银元券代替金元券',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  5,
  '历史上的今天',
  '1977年全球气候观测系统中国委员会成立',
  '1977年全球气候观测系统中国委员会成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1977年全球气候观测系统中国委员会成立|1977年全球气候观测系统中国委员会成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  6,
  '常识',
  '《喻世明言》代表章节有',
  '一、三言“三言”是指明代冯梦龙所编纂的《喻世明言》《警世通言》和《醒世恒言》，是我国文学史上第一部规模宏大的白话短篇小说总集，也是白话短篇小说发展历程上由民间艺人的口头艺术转为文人作家的案头文学的第一座丰碑。
《蒋兴哥重会珍珠衫》《陈御史巧勘金钗钿》《滕大尹鬼断家私》《杨八老越国奇逢》《沈小官一鸟害七命》等。',
  '常识',
  '三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。',
  'common',
  '常识|三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。|《喻世明言》代表章节有|一、三言“三言”是指明代冯梦龙所编纂的《喻世明言》《警世通言》和《醒世恒言》，是我国文学史上第一部规模宏大的白话短篇小说总集，也是白话短篇小说发展历程上由民间艺',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  7,
  '常识',
  '《警世通言》代表章节有',
  '《白娘子永镇雷峰塔》《杜十娘怒沉百宝箱》《俞伯牙摔琴谢知音》《崔待诏生死冤家》等。',
  '常识',
  '三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。',
  'common',
  '常识|三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。|《警世通言》代表章节有|《白娘子永镇雷峰塔》《杜十娘怒沉百宝箱》《俞伯牙摔琴谢知音》《崔待诏生死冤家》等。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  8,
  '常识',
  '《醒世恒言》代表章节有',
  '《徐老仆义愤成家》《施润泽滩阙遇友》《白玉娘忍苦成夫》《灌园叟晚逢仙女》等。二、二拍
“二拍”是指凌濛初所编的《初刻拍案惊奇》和《二刻拍案惊奇》，是作者根据野史笔记、文言小说和当时的社会传闻创作的，主体反映了市民生活中追求财富和享乐的社会风气，同时反映了资本主义萌芽时期人们渴望爱情和平等的自由主义思想。',
  '常识',
  '三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。',
  'common',
  '常识|三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。|《醒世恒言》代表章节有|《徐老仆义愤成家》《施润泽滩阙遇友》《白玉娘忍苦成夫》《灌园叟晚逢仙女》等。二、二拍
“二拍”是指凌濛初所编的《初刻拍案惊奇》和《二刻拍案惊奇》，是作者根据野史',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  9,
  '常识',
  '《初刻拍案惊奇》代表作有',
  '《转运汉遇巧洞庭红，波斯胡指破鼍龙壳》《李公佐巧解梦中言，谢小娥智擒船上盗》等。',
  '常识',
  '三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。',
  'common',
  '常识|三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。|《初刻拍案惊奇》代表作有|《转运汉遇巧洞庭红，波斯胡指破鼍龙壳》《李公佐巧解梦中言，谢小娥智擒船上盗》等。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.4.docx'),
  10,
  '常识',
  '《二刻拍案惊奇》《叠居奇程客得助，三救厄海神显灵…',
  '《二刻拍案惊奇》《叠居奇程客得助，三救厄海神显灵》《硬勘案大儒争闲气，甘受刑侠女著芳名》《同窗友认假作真，女秀才移花接木》等。',
  '常识',
  '三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。',
  'common',
  '常识|三言二拍”考点汇总“三言二拍”是指明代五本著名传奇小说集的合称。|《二刻拍案惊奇》《叠居奇程客得助，三救厄海神显灵…|《二刻拍案惊奇》《叠居奇程客得助，三救厄海神显灵》《硬勘案大儒争闲气，甘受刑侠女著芳名》《同窗友认假作真，女秀才移花接木》等。',
  'learning',
  ''
);

COMMIT;
