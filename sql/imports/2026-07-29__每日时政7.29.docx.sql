-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.29.docx
-- doc_date: 2026-07-29
-- generated_at: 2026-08-21T08:42:54.224Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.29.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.29.docx',
  '2026-07-29',
  'ac48e42110f67ffef6fb24f6c2d27c21fde1485e0816305b6cdd0888289190d9',
  'imported',
  '{"paragraphs":82,"articles":5,"questions":5,"knowledge":7,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  1,
  '辽宁长山群岛成功纳入世界自然遗产',
  '北京时间2026年7月27日，在韩国釜山召开的第48届联合国教科文组织世界遗产委员会会议，审议通过了中国黄（渤）海候鸟栖息地世界自然遗产边界调整项目，辽宁大连长山群岛候鸟栖息地成功纳入世界自然遗产，我国黄（渤）海候鸟栖息地系列遗产继2024年后实现再次扩展。（时政来源：央视网）',
  '央视网',
  '2026-07-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  2,
  '“九五”普法规划对外发布',
  '2026年7月27日，《中央宣传部、司法部关于开展法治宣传教育的第九个五年规划（2026－2030年）》对外发布。
“九五”普法规划指出，坚持党的全面领导，坚持人民至上，坚持全面依法治国，坚持服务“十五五”时期经济社会发展大局，以推动习近平法治思想深入人心为首要任务，以贯彻实施法治宣传教育法为抓手，以繁荣发展社会主义法治文化为支撑，以健全法治宣传教育工作体系为保障，践行社会主义核心价值观，弘扬社会主义法治精神，推进法治社会建设，为以中国式现代化全面推进强国建设、民族复兴伟业营造良好法治环境。
“九五”普法规划指出，突出宪法宣传教育。抓领导干部、新录用公务员、青少年等重点群体，抓宪法纪念、宪法宣誓、宪法教材建设等重点载体，抓学校、社区、媒体、网络等重点阵地，推动宪法宣传教育常态化长效化。
“九五”普法规划指出，以青少年身心特点和成长需求为导向，加强正面引导，构建课堂为主、家庭协同、社会联动的青少年法治教育格局。在矫治教育、专门教育和专门矫治教育中重点加强法治教育。（时政来源：新华网）',
  '新华网',
  '2026-07-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  3,
  '全国侨务工作会议召开',
  '全国侨务工作会议2026年7月27日至28日在京召开。中共中央政治局常委、全国政协主席王沪宁出席会议指出，新征程上，要以习近平新时代中国特色社会主义思想为指导，深入贯彻落实习近平总书记关于做好新时代党的统一战线工作的重要思想、关于侨务工作的重要论述，贯彻落实党的二十大和二十届三中、四中全会关于加强和改进侨务工作的决策部署，坚持凝心聚力同圆共享中国梦的主题，坚持为大局服务和为侨服务相统一、国内侨务和国外侨务工作相协同、涵养资源和发挥作用相统筹，推动新时代侨务工作高质量发展。（时政来源：新华网）',
  '新华网',
  '2026-07-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  4,
  '北京中轴线各遗产点庆祝申遗成功两周年',
  '2026年7月27日是“北京中轴线——中国理想都城秩序的杰作”列入《世界遗产名录》两周年。当日，故宫、中国国家博物馆、正阳门、先农坛、钟鼓楼等北京中轴线各遗产点向公众开放，部分遗产点推出新展，庆祝北京中轴线申遗成功两周年。（时政来源：新华网）',
  '新华网',
  '2026-07-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  5,
  '新唐山建设五十年',
  '2026年是唐山抗震五十周年。1976年大地震发生时，唐山有海无港；五十年后，唐山港货物吞吐量稳居世界沿海港口第二位，向海图强，正成为唐山经济社会高质量发展的重要引擎。（时政来源：央广网）',
  '央广网',
  '2026-07-29',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  1,
  'document',
  '单选',
  '北京时间2026年7月27日，在韩国釜山召开的第48届联合国教科文组织世界遗产委员会会议，审议通过了中国黄（渤）海候鸟栖息地世界自然遗产边界调整项目，（  ）成功纳入世界自然遗产，我国黄（渤）海候鸟栖息地系列遗产继2024年后实现再次扩展。',
  '[{"key":"A","text":"江苏盐城湿地候鸟栖息地"},{"key":"B","text":"上海崇明东滩候鸟栖息地"},{"key":"C","text":"辽宁大连长山群岛候鸟栖息地"},{"key":"D","text":"山东东营黄河口候鸟栖息地"}]',
  'C',
  '',
  '原题',
  '2026-07-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  2,
  'document',
  '单选',
  '2026年7月27日，《中央宣传部、司法部关于开展法治宣传教育的第九个五年规划（2026－2030年）》对外发布。根据“九五”普法规划，下列说法错误的是（  ）。',
  '[{"key":"A","text":"以推动习近平法治思想深入人心为首要任务"},{"key":"B","text":"突出宪法宣传教育，抓好学校、社区、媒体、网络等重点阵地"},{"key":"C","text":"以青少年身心特点和成长需求为导向，构建家庭为主、社会协同的青少年法治教育格局"},{"key":"D","text":"在矫治教育、专门教育和专门矫治教育中重点加强法治教育"}]',
  'C',
  '',
  '原题',
  '2026-07-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  3,
  'document',
  '单选',
  '全国侨务工作会议2026年7月27日至28日在京召开。中共中央政治局常委、全国政协主席王沪宁出席会议指出，新征程上，要坚持（  ）的主题，坚持为大局服务和为侨服务相统一、国内侨务和国外侨务工作相协同、涵养资源和发挥作用相统筹，推动新时代侨务工作高质量发展。',
  '[{"key":"A","text":"画好海内外中华儿女最大同心圆"},{"key":"B","text":"团结海内外同胞构建人类命运共同体"},{"key":"C","text":"凝心聚力同圆共享中国梦"},{"key":"D","text":"凝聚侨心汇聚侨智发挥侨力维护侨益"}]',
  'C',
  '',
  '原题',
  '2026-07-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  4,
  'document',
  '单选',
  '2026年7月27日是“北京中轴线——中国理想都城秩序的杰作”列入《世界遗产名录》（  ）。',
  '[{"key":"A","text":"四周年"},{"key":"B","text":"三周年"},{"key":"C","text":"两周年"},{"key":"D","text":"一周年"}]',
  'C',
  '',
  '原题',
  '2026-07-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  5,
  'document',
  '单选',
  '2026年是唐山抗震（  ）周年。',
  '[{"key":"A","text":"一百"},{"key":"B","text":"八十"},{"key":"C","text":"六十"},{"key":"D","text":"五十"}]',
  'D',
  '',
  '原题',
  '2026-07-29'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  1,
  '历史上的今天',
  '1836年法国巴黎凯旋门建成',
  '1836年法国巴黎凯旋门建成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1836年法国巴黎凯旋门建成|1836年法国巴黎凯旋门建成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  2,
  '历史上的今天',
  '1937年北平、天津沦陷',
  '1937年北平、天津沦陷',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1937年北平、天津沦陷|1937年北平、天津沦陷',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  3,
  '历史上的今天',
  '1940年新四军攻占黄桥',
  '1940年新四军攻占黄桥',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1940年新四军攻占黄桥|1940年新四军攻占黄桥',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  4,
  '历史上的今天',
  '1946年华北爆发“安平事件”',
  '1946年华北爆发“安平事件”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1946年华北爆发“安平事件”|1946年华北爆发“安平事件”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  5,
  '历史上的今天',
  '1983年长江葛洲坝二江水电站建成',
  '1983年长江葛洲坝二江水电站建成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1983年长江葛洲坝二江水电站建成|1983年长江葛洲坝二江水电站建成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  6,
  '常识',
  '人工智能（AI）',
  '1.什么是人工智能
人工智能简称AI，简单说就是让电脑模仿人的智能行为——比如能看懂文字、听懂说话、识别图片、做决策，本质上是在模拟人脑的思考方式。
2.人工智能三要素：算力、算法、数据
可以理解成“做饭三要素”：
算力=炉灶火力：就是电脑的计算能力，由芯片提供，相当于AI的“发动机”，算力越强，AI跑得越快。
算法=菜谱：一套告诉电脑怎么干活的规则和步骤，是AI的核心大脑，决定了AI聪不聪明。
数据=食材：训练AI用的海量信息，相当于燃料，数据越多、质量越好，AI学出来就越厉害。
3.人工智能产业链（三层结构）
上游（基础层）：造芯片、建算力中心、收集数据——相当于“卖工具和原料”的。
中游（技术层）：研发算法、训练大模型——相当于“用原料做出AI产品”的。
下游（应用层）：把AI用到各行各业，比如智能客服、自动驾驶、AI写作——相当于“把产品卖给用户”的。
三层互相推动：下游有新需求，倒逼中游升级技术，中游又需要上游提供更强的算力和更多数据。',
  '常识',
  '人工智能与大模型',
  'common',
  '常识|人工智能与大模型 |人工智能（AI）|1.什么是人工智能
人工智能简称AI，简单说就是让电脑模仿人的智能行为——比如能看懂文字、听懂说话、识别图片、做决策，本质上是在模拟人脑的思考方式。
2.人工智',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.29.docx'),
  7,
  '常识',
  '大模型',
  '1.什么是大模型
模型就是用算法+数据，靠算力训练出来的“AI工具”。参数超过1亿的就叫大模型，参数越多，模型通常越聪明，但也越吃算力。
2.大模型分类
（1）按输入类型分三类：
语言大模型：专门处理文字，比如GPT、通义千问、DeepSeek
视觉大模型：专门处理图像，比如人脸识别、自动驾驶
多模态大模型：文字、图片、视频都能处理，比如Sora、可灵
（2）按应用范围分三类：
通用大模型：什么领域都能用，“全能型选手”
行业大模型：只针对某个行业训练，比如金融大模型、医疗大模型
垂直大模型：只干一件具体事，比如专门做金融风控的模型
【大白话总结】
AI说白了就是让电脑变聪明，能干以前只有人才能干的事。它靠三样东西撑起来：算力（电脑够不够快）、算法（方法聪不聪明）、数据（喂的料够不够多），缺一不可。整条产业链分三层：最底下造芯片、攒算力，中间层训练模型，最上层把AI用到各行各业赚钱。
而大模型就是AI里的“超级大脑”，参数越多越聪明。按本事分三种：只会认字的（语言大模型）、只会看图的（视觉大模型）、啥都能看懂的（多模态大模型）。按应用范围也分三种：啥都懂一点的通用型、专攻一个行业的行业型、只干一件事的垂直型。',
  '常识',
  '人工智能与大模型',
  'common',
  '常识|人工智能与大模型 |大模型|1.什么是大模型
模型就是用算法+数据，靠算力训练出来的“AI工具”。参数超过1亿的就叫大模型，参数越多，模型通常越聪明，但也越吃算力。
2.大模型分类
（1）',
  'learning',
  ''
);

COMMIT;
