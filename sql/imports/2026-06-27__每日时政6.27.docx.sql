-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政6.27.docx
-- doc_date: 2026-06-27
-- generated_at: 2026-08-21T08:42:54.217Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政6.27.docx',
  '/Users/tank/Desktop/每日时政/每日时政6.27.docx',
  '2026-06-27',
  'e98752c58554fee1c96a27bd7371be888f6e9c23af37c8d34bec9f0ae71a54cf',
  'imported',
  '{"paragraphs":84,"articles":5,"questions":5,"knowledge":11,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  1,
  '《新型能源体系建设“十五五”规划》印发',
  '2026年6月25日，国家发展改革委、国家能源局发布关于印发《新型能源体系建设“十五五”规划》的通知。
《新型能源体系建设“十五五”规划》提到，2030年初步建成清洁低碳安全高效的新型能源体系。（时政来源：央广网）',
  '央广网',
  '2026-06-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  2,
  '习近平会见孟加拉国总理塔里克',
  '2026年6月26日上午，国家主席习近平在北京人民大会堂会见来华正式访问的孟加拉国总理塔里克。两国领导人共同宣布构建xin时代中孟命运共同体，推动两国关系向更高水平发展。（时政来源：新华网）',
  '新华网',
  '2026-06-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  3,
  '六部门印发计划促进美丽中国建设全民行动',
  '生态环境部新闻发言人裴晓菲2026年6月25日介绍，生态环境部、中央宣传部、中央社会工作部等六部门近日联合印发《美丽中国建设全民行动促进计划（2026—2030年）》。
促进计划提出，到2030年，习近平生态文明思想更加深入人心，全社会生态文明主流价值观牢固树立，美丽中国建设文化支撑更加坚实，公众生态文明素养显著提升，建设美丽中国成为全体人民自觉行动，绿色低碳生活方式蔚然成风，美丽中国建设全民行动体系基本形成。（时政来源：人民网）',
  '人民网',
  '2026-06-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  4,
  '滑雪登山成为2030年冬奥会正式比赛项目',
  '国际奥委会第146次全会2026年6月25日在洛桑审议通过，滑雪登山成为2030年法国阿尔卑斯冬奥会正式竞赛项目。（时政来源：新华网）',
  '新华网',
  '2026-06-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  5,
  '发电装机突破40亿千瓦，能源强国建设迈出关键一步',
  '2026年6月25日，国家能源局宣布，我国发电装机突破40亿千瓦。这一数字创下全球能源发展新纪录，成为我国能源强国建设的标志性里程碑，为推进中国式现代化注入绿色动能。（时政来源：新华网）',
  '新华网',
  '2026-06-27',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  1,
  'document',
  '单选',
  '《新型能源体系建设“十五五”规划》提到，（  ）初步建成清洁低碳安全高效的新型能源体系。',
  '[{"key":"A","text":"2030年"},{"key":"B","text":"2035年"},{"key":"C","text":"2050年"},{"key":"D","text":"2027年"}]',
  'A',
  '',
  '原题',
  '2026-06-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  2,
  'document',
  '单选',
  '2026年6月26日上午，国家主席习近平在北京人民大会堂会见来华正式访问的孟加拉国总理塔里克。两国领导人共同宣布构建（  ），推动两国关系向更高水平发展。',
  '[{"key":"A","text":"中孟睦邻友好协作共同体"},{"key":"B","text":"新时代中孟命运共同体"},{"key":"C","text":"中孟战略合作伙伴关系"},{"key":"D","text":"中孟全面战略合作伙伴关系"}]',
  'B',
  '',
  '原题',
  '2026-06-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  3,
  'document',
  '单选',
  '生态环境部、中央宣传部、中央社会工作部等六部门近日联合印发《美丽中国建设全民行动促进计划（2026—2030年）》。根据促进计划，下列哪些是到2030年要实现的目标？（  ）
①全社会生态文明主流价值观牢固树立
②美丽中国建设全民行动体系基本形成
③公众生态文明素养显著提升
④习近平生态文明思想更加深入人心',
  '[{"key":"A","text":"①②③④"},{"key":"B","text":"①③④"},{"key":"C","text":"②③④"},{"key":"D","text":"①②④"}]',
  'A',
  '',
  '原题',
  '2026-06-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  4,
  'document',
  '单选',
  '国际奥委会第146次全会2026年6月25日在洛桑审议通过，（  ）成为2030年法国阿尔卑斯冬奥会正式竞赛项目。',
  '[{"key":"A","text":"雪地越野跑"},{"key":"B","text":"越野滑雪"},{"key":"C","text":"滑雪登山"},{"key":"D","text":"冰攀"}]',
  'C',
  '',
  '原题',
  '2026-06-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  5,
  'document',
  '单选',
  '2026年6月25日，国家能源局宣布，我国发电装机突破（  ）。这一数字创下全球能源发展新纪录，成为我国能源强国建设的标志性里程碑，为推进中国式现代化注入绿色动能。',
  '[{"key":"A","text":"100亿千瓦"},{"key":"B","text":"60亿千瓦"},{"key":"C","text":"50亿千瓦"},{"key":"D","text":"40亿千瓦"}]',
  'D',
  '',
  '原题',
  '2026-06-27'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  1,
  '历史上的今天',
  '1858年《中法天津条约》签署',
  '1858年《中法天津条约》签署',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1858年《中法天津条约》签署|1858年《中法天津条约》签署',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  2,
  '历史上的今天',
  '1935年中日签订《秦土协定》',
  '1935年中日签订《秦土协定》',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1935年中日签订《秦土协定》|1935年中日签订《秦土协定》',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  3,
  '历史上的今天',
  '1938年国民政府提出“保卫大武汉”',
  '1938年国民政府提出“保卫大武汉”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1938年国民政府提出“保卫大武汉”|1938年国民政府提出“保卫大武汉”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  4,
  '历史上的今天',
  '1940年苏联占领波罗的海沿岸三国',
  '1940年苏联占领波罗的海沿岸三国',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1940年苏联占领波罗的海沿岸三国|1940年苏联占领波罗的海沿岸三国',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  5,
  '历史上的今天',
  '1954年苏联第一个原子电力站发电',
  '1954年苏联第一个原子电力站发电',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1954年苏联第一个原子电力站发电|1954年苏联第一个原子电力站发电',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  6,
  '常识',
  '“天和”核心舱',
  '1.出处“天和”一词，出自《庄子·知北游》：若正汝形，一汝视，天和将至。
2.寓意“天和”就是“天人合一”，寓意天地人和，开创太平盛世，天地自然与人类和谐相处。',
  '常识',
  '航天器命名出处及其寓意',
  'common',
  '常识|航天器命名出处及其寓意|“天和”核心舱|1.出处“天和”一词，出自《庄子·知北游》：若正汝形，一汝视，天和将至。
2.寓意“天和”就是“天人合一”，寓意天地人和，开创太平盛世，天地自然与人类和谐相处。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  7,
  '常识',
  '“梦天”实验舱',
  '1.出处“梦天”一词，出自李贺的代表作《梦天》：老兔寒蟾泣天色，云楼半开壁斜白。玉轮轧露湿团光，鸾珮相逢桂香陌。黄尘清水三山下，更变千年如走马。遥望齐州九点烟，一泓海水杯中泻。
2.寓意表达了中国人对太空的大胆幻想。',
  '常识',
  '航天器命名出处及其寓意',
  'common',
  '常识|航天器命名出处及其寓意|“梦天”实验舱|1.出处“梦天”一词，出自李贺的代表作《梦天》：老兔寒蟾泣天色，云楼半开壁斜白。玉轮轧露湿团光，鸾珮相逢桂香陌。黄尘清水三山下，更变千年如走马。遥望齐州九点烟，',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  8,
  '常识',
  '“问天”实验舱',
  '1.出处“问天”一词出自屈原长诗《天问》：“天何所沓？十二焉分？日月安属？列星安陈？”，在《天问》这首长诗里，屈原对天地离分、阴阳变化、日月星辰等天地万物提出一系列追问。
2.寓意展现叩问苍穹寻求真理的心愿与决心。',
  '常识',
  '航天器命名出处及其寓意',
  'common',
  '常识|航天器命名出处及其寓意|“问天”实验舱|1.出处“问天”一词出自屈原长诗《天问》：“天何所沓？十二焉分？日月安属？列星安陈？”，在《天问》这首长诗里，屈原对天地离分、阴阳变化、日月星辰等天地万物提出一',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  9,
  '常识',
  '“天舟”货运飞船',
  '1.出处“天舟”一词出自辛弃疾《西江月·为范南伯寿》：“灵槎准拟泛银河，剩摘天星几个”。
2.寓意天地间往来的星汉之舟。',
  '常识',
  '航天器命名出处及其寓意',
  'common',
  '常识|航天器命名出处及其寓意|“天舟”货运飞船|1.出处“天舟”一词出自辛弃疾《西江月·为范南伯寿》：“灵槎准拟泛银河，剩摘天星几个”。
2.寓意天地间往来的星汉之舟。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  10,
  '常识',
  '“神舟”系列飞船',
  '1.出处“神舟”一词出自司马迁《史记》：“中国名曰赤县神州。”
2.寓意神州指中国，将飞船取名神舟，既与神州大地谐音，也有舟同船的文化释义。将宇航员稳稳当当的送至天宫。',
  '常识',
  '航天器命名出处及其寓意',
  'common',
  '常识|航天器命名出处及其寓意|“神舟”系列飞船|1.出处“神舟”一词出自司马迁《史记》：“中国名曰赤县神州。”
2.寓意神州指中国，将飞船取名神舟，既与神州大地谐音，也有舟同船的文化释义。将宇航员稳稳当当的送',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.27.docx'),
  11,
  '常识',
  '其他航天器',
  '1.“长征”系列火箭：名字取自毛泽东的《七律·长征》，寓意中国航天事业能继承万里长征的精神，克服一切困难、不惧任何艰难险阻。
2.“悟空”暗物质探测器：名字取自《西游记》中齐天大圣的名字，还有着和大圣一样的火眼金睛，可以在茫茫太空中识别出暗物质的踪影。“悟空”也有领悟、探索太空之意。
3.“北斗”定位卫星系统：自古以来，中国人就有依靠北斗辨认方向，分辨四季的习惯，因此在给中国的卫星导航系统命名时，也选用“北斗”这个寓意光明和方向的星座来命名。
4.“嫦娥”探月工程：取自“嫦娥奔月”的故事，中国人还把月球车命名为“玉兔”，让它与“嫦娥”绕月卫星一道奔月，降落月球的区域则被叫做“广寒宫”。后来为了更好联系嫦娥四号月球探测器，派出“鹊桥”中继卫星，古时连接牛郎与织女，如今架起地球和月亮沟通的桥梁。
5.“羲和号”太阳探测卫星：取自佳句“效法羲和驭天马，志在长空牧群星”，象征这是中国对太阳探索的缘起与拓展。同时“羲和”也是中国上古神话中的太阳女神，对应羲和号验证了中国的“探日”技术，孕育出中国的“探日”时代。
6.“夸父一号”先进天基太阳天文台：取自“夸父逐日”的故事，蕴含了中华民族千百年来试图揭开太阳神秘面纱的不懈求索。
7.火星探测器“天问一号”、“天问二号”：名称同样源于作品《天问》，表达了中华民族对真理追求的坚韧与执着。
8.“梦舟”飞船：中国载人月球探测任务新飞行器为新一代载人飞船，命名为“梦舟”，月面着陆器命名为“揽月”。“梦舟”寓意载人月球探测承载中国人的航天梦，开启探索太空的新征程，也体现了与神舟、天舟飞船家族的体系传承；“揽月”出于毛泽东著名诗词《水调歌头·重上井冈山》当中的名句“可上九天揽月，可下五洋捉鳖，谈笑凯歌还”，彰显中国人探索宇宙、登陆月球的豪迈与自信。',
  '常识',
  '航天器命名出处及其寓意',
  'common',
  '常识|航天器命名出处及其寓意|其他航天器|1.“长征”系列火箭：名字取自毛泽东的《七律·长征》，寓意中国航天事业能继承万里长征的精神，克服一切困难、不惧任何艰难险阻。
2.“悟空”暗物质探测器：名字取自',
  'learning',
  ''
);

COMMIT;
