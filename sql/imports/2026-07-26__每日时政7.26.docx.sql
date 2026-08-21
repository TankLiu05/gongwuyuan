-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.26.docx
-- doc_date: 2026-07-26
-- generated_at: 2026-08-21T08:42:54.223Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.26.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.26.docx',
  '2026-07-26',
  'f2c81d9a3bcbc5ce74168aab03b667fab201bc8d261fe913f6b031d1757d66ba',
  'imported',
  '{"paragraphs":84,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  1,
  '美丽乡村建设开局良好',
  '生态环境部组织有关单位编制的智库报告《中国美丽乡村建设的进展与成效》2026年7月23日对外发布。报告显示，我国美丽乡村建设实现良好开局。
生态环境部环境与经济政策研究中心生态部主任耿润哲介绍称，目前我国美丽乡村整县建成比例已达到20%。
下一步，我国部署小微水体治理攻坚行动，加快建立适应农业农村发展特征的治理模式，在2027年，争取将美丽乡村整县建成比例提高到40%；在2035年前将完成基本建成美丽乡村的目标。（时政来源：央视网）',
  '央视网',
  '2026-07-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  2,
  '我国首批9000吨级气膜粮仓正式装粮压仓',
  '2026年7月24日，我国首批9000吨级气膜粮仓在中储粮长沙直属库建成后进行首次装粮压仓作业，这意味着我国第四代新型粮仓正式进入应用新阶段。（时政来源：新华网）',
  '新华网',
  '2026-07-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  3,
  '三部门将开展征收挥发性有机物环境保护税试点',
  '记者2026年7月24日从财政部了解到，财政部、税务总局、生态环境部近日联合发布通知，明确自2027年1月1日起开展征收挥发性有机物环境保护税试点，挥发性有机物将全部纳入征税范围。（时政来源：人民网）',
  '人民网',
  '2026-07-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  4,
  '三部门联合下发通知要求做好“八一”期间拥军优属拥政爱民工作',
  '中国人民解放军建军99周年即将来临之际，退役军人事务部、中央军委政治工作部、全国双拥工作领导小组办公室联合下发通知，要求各地各部队扎实做好“八一”期间拥军优属、拥政爱民工作。
通知指出，各地各部队要以庆祝中国共产党成立105周年、纪念中国工农红军长征胜利90周年为契机，深入学习贯彻习近平总书记关于双拥工作的重要论述和重要指示精神，引导广大军民深刻领悟“两个确立”的决定性意义，增强“四个意识”、坚定“四个自信”、做到“两个维护”。
通知指出，突出关注边境地区、革命老区、民族地区，支持帮扶村振兴发展，持续改善“八一爱民学校”办学条件，积极开展为民医疗服务，深化消费帮扶行动。（时政来源：新华网）',
  '新华网',
  '2026-07-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  5,
  '第34届全国图书交易博览会在浙江杭州开幕',
  '2026年7月24日，第34届全国图书交易博览会在浙江省杭州市开幕。本届书博会以“书香中国 阅读之美”为主题，汇聚了全国千余家参展单位、线上线下展销图书近百万种。（时政来源：新华网）',
  '新华网',
  '2026-07-26',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  1,
  'document',
  '单选',
  '2026年7月23日发布的智库报告《中国美丽乡村建设的进展与成效》显示，我国美丽乡村建设实现良好开局。生态环境部环境与经济政策研究中心生态部主任耿润哲介绍称，目前我国美丽乡村整县建成比例已达到（  ）。',
  '[{"key":"A","text":"20%"},{"key":"B","text":"40%"},{"key":"C","text":"60%"},{"key":"D","text":"80%"}]',
  'A',
  '',
  '原题',
  '2026-07-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  2,
  'document',
  '单选',
  '2026年7月24日，我国首批（  ）气膜粮仓在中储粮长沙直属库建成后进行首次装粮压仓作业，这意味着我国第四代新型粮仓正式进入应用新阶段。',
  '[{"key":"A","text":"5000吨级"},{"key":"B","text":"9000吨级"},{"key":"C","text":"10000吨级"},{"key":"D","text":"30000吨级"}]',
  'B',
  '',
  '原题',
  '2026-07-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  3,
  'document',
  '单选',
  '财政部、税务总局、生态环境部近日联合发布通知，明确自2027年1月1日起开展征收（  ）环境保护税试点，（  ）将全部纳入征税范围。',
  '[{"key":"A","text":"挥发性有机物"},{"key":"B","text":"氮氧化物"},{"key":"C","text":"二氧化碳"},{"key":"D","text":"重金属污染物"}]',
  'A',
  '',
  '原题',
  '2026-07-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  4,
  'document',
  '单选',
  '中国人民解放军建军99周年即将来临之际，退役军人事务部、中央军委政治工作部、全国双拥工作领导小组办公室联合下发通知，要求各地各部队扎实做好“八一”期间拥军优属、拥政爱民工作。通知指出，突出关注（  ），支持帮扶村振兴发展。
①边境地区；②民族地区；③沿海地区；④革命老区',
  '[{"key":"A","text":"②③④"},{"key":"B","text":"①③④"},{"key":"C","text":"①②④"},{"key":"D","text":"①②③"}]',
  'C',
  '',
  '原题',
  '2026-07-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  5,
  'document',
  '单选',
  '2026年7月24日，第34届全国图书交易博览会在浙江省杭州市开幕。本届书博会以（  ）为主题。',
  '[{"key":"A","text":"“开卷润心灵 书香满华夏”"},{"key":"B","text":"“文汇江南 书通天下”"},{"key":"C","text":"“阅享新时代 书香润中华”"},{"key":"D","text":"“书香中国 阅读之美”"}]',
  'D',
  '',
  '原题',
  '2026-07-26'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  1,
  '历史上的今天',
  '1898年清政府改《时务报》为官办',
  '1898年清政府改《时务报》为官办',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1898年清政府改《时务报》为官办|1898年清政府改《时务报》为官办',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  2,
  '历史上的今天',
  '1914年爱尔兰争端 都柏林发生起义',
  '1914年爱尔兰争端 都柏林发生起义',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1914年爱尔兰争端 都柏林发生起义|1914年爱尔兰争端 都柏林发生起义',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  3,
  '历史上的今天',
  '1945年波茨坦公告发表',
  '1945年波茨坦公告发表',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年波茨坦公告发表|1945年波茨坦公告发表',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  4,
  '历史上的今天',
  '1953年古巴爆发“七·二六运动”',
  '1953年古巴爆发“七·二六运动”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1953年古巴爆发“七·二六运动”|1953年古巴爆发“七·二六运动”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  5,
  '历史上的今天',
  '1954年中国第一次自己制造初级教练机成功',
  '1954年中国第一次自己制造初级教练机成功',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1954年中国第一次自己制造初级教练机成功|1954年中国第一次自己制造初级教练机成功',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  6,
  '常识',
  '最常见的两种：B和L',
  '1.“B”层=地下层
B是Basement的缩写，本意就是“地下室、地基”。
B1=负一层（地下第一层）；B2=负二层（地下第二层）
商场里的停车场、超市、美食街经常在B1、B2层，看到B开头的，往地下走就对了。
2.“L”层=地面楼层
L是Level的缩写，意思是“层级、楼层”。
L1=一楼；L2=二楼
这是比较通用的表示方法，数字往上加，楼层就往上升。',
  '常识',
  '商场楼层B1/L1/F1',
  'common',
  '常识|商场楼层B1/L1/F1|最常见的两种：B和L|1.“B”层=地下层
B是Basement的缩写，本意就是“地下室、地基”。
B1=负一层（地下第一层）；B2=负二层（地下第二层）
商场里的停车场、超市、美食',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  7,
  '常识',
  '最经典的：F层',
  'F是Floor的缩写，就是“楼层”的意思，也是国内商场最常见的标法。
F1=1楼；2F=2楼（有的商场写在数字前面，有的写在后面，意思一样）
和L层本质上是一个意思，只是用词不同，都是从地面往上数的正楼层。',
  '常识',
  '商场楼层B1/L1/F1',
  'common',
  '常识|商场楼层B1/L1/F1|最经典的：F层|F是Floor的缩写，就是“楼层”的意思，也是国内商场最常见的标法。
F1=1楼；2F=2楼（有的商场写在数字前面，有的写在后面，意思一样）
和L层本质上是一个',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  8,
  '常识',
  '容易懵的“G系”标识：GF、LG、UG',
  '这一组在港澳、外资商场或者有地铁接驳的商场里特别常见，来自英式英语的习惯。
1.GF=GroundFloor（地面层）
就是我们常说的“一楼”，和L1、F1是同一个意思，只是叫法不同。英式习惯里把地面那层叫GroundFloor，往上才是FirstFloor（二楼）。
2.LG=LowerGround（地下低层）
直译是“更低的地面层”，一般是比地面低一点但又不完全算纯地下室的楼层，很多和地铁站直接连通的商场层会标LG，既能通地铁，又有商铺，比纯停车场的B层要“热闹”。
3.UG=UpperGround（地上低层）
直译是“更高的地面层”，通常是地面层（GF）之上、正式二楼之下的半层或夹层，有些商场因为地形原因做了“双首层”设计，就会用到UG。',
  '常识',
  '商场楼层B1/L1/F1',
  'common',
  '常识|商场楼层B1/L1/F1|容易懵的“G系”标识：GF、LG、UG|这一组在港澳、外资商场或者有地铁接驳的商场里特别常见，来自英式英语的习惯。
1.GF=GroundFloor（地面层）
就是我们常说的“一楼”，和L1、F1是同',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  9,
  '常识',
  '特殊楼层：M层',
  'M是Mezzanine的缩写，意思是“夹层、中间层”。
一般夹在两个正楼层之间，比如1楼和2楼中间挑高出来的半层，经常是环形走廊、观景平台或者轻餐饮区，层高通常比正常楼层矮一些。',
  '常识',
  '商场楼层B1/L1/F1',
  'common',
  '常识|商场楼层B1/L1/F1|特殊楼层：M层|M是Mezzanine的缩写，意思是“夹层、中间层”。
一般夹在两个正楼层之间，比如1楼和2楼中间挑高出来的半层，经常是环形走廊、观景平台或者轻餐饮区，层高通常',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.26.docx'),
  10,
  '常识',
  '为啥一个楼层要搞这么多说法？',
  '主要有两个原因：
1.地域习惯不同：国内多用F和B，英式/港澳商场喜欢用G系（GF、LG），美式又偏向L和F，不同开发商照搬了不同的体系。
2.商场设计需要：现在的商场越建越复杂，有夹层、有双首层、有地铁连通层、有下沉广场，正儿八经的123楼不够用了，就得用LG、UG、M这些词来区分“不上不下”的特殊楼层。',
  '常识',
  '商场楼层B1/L1/F1',
  'common',
  '常识|商场楼层B1/L1/F1|为啥一个楼层要搞这么多说法？|主要有两个原因：
1.地域习惯不同：国内多用F和B，英式/港澳商场喜欢用G系（GF、LG），美式又偏向L和F，不同开发商照搬了不同的体系。
2.商场设计需要：现',
  'learning',
  ''
);

COMMIT;
