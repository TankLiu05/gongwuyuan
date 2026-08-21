-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.8.docx
-- doc_date: 2026-08-08
-- generated_at: 2026-08-21T08:42:54.226Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.8.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.8.docx',
  '2026-08-08',
  'd0225cee13a013be7fd4bfd4c997e0325e1146282656b4bde959371ef72e7b94',
  'imported',
  '{"paragraphs":79,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  1,
  '《民用爆炸物品行业安全发展“十五五”规划》发布',
  '工业和信息化部2026年8月6日对外发布《民用爆炸物品行业安全发展“十五五”规划》，旨在进一步提升本质安全水平，强化监管效能，优化产业结构、产品结构、产能布局，推动行业向智能化、绿色化、融合化、国际化方向发展。
规划提出到2030年，民爆行业安全水平进一步提高，创新能力持续增强，安全基础更加巩固，供给能力稳步提升，产品质量不断提高，企业重组整合有序推进，形成3至5家具有较强国际运营能力的大型民爆企业集团，绿色制造技术持续升级等。（时政来源：新华网）',
  '新华网',
  '2026-08-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  2,
  '外交部发言人就广岛核爆81周年答记者问',
  '外交部发言人林剑2026年8月6日在就广岛核爆81周年答问时表示，核武器造成的灾难和悲剧不应重演，发生核爆的特定背景更应反思铭记，日本军国主义侵略扩张的教训必须警钟长鸣。（时政来源：人民网）',
  '人民网',
  '2026-08-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  3,
  '纪念陈叔通先生诞辰150周年',
  '2026年8月7日是陈叔通先生诞辰150周年纪念日。陈叔通先生是著名的民主革命战士，忠诚的爱国主义者，振兴中华文化教育事业的先驱，是新中国的国家领导人之一，全国工商联的创始人和卓越的领导者，是和中国共产党风雨同舟、荣辱与共、肝胆相照、长期合作的亲密朋友。（时政来源：人民网）',
  '人民网',
  '2026-08-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  4,
  '我国首个银行业数据出境负面清单备案落地北京',
  '北京市互联网信息办公室2026年8月6日发布信息称，韩国农协银行北京分行成为我国首家通过负面清单实现数据合规出境的银行业机构。（时政来源：新华网）',
  '新华网',
  '2026-08-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  5,
  '我国最北高铁哈伊高铁启动运行试验',
  '2026年8月6日7时40分，哈伊高铁启动按图运行试验。D7271次运行试验动车组由黑龙江省哈尔滨站始发，经由哈尔滨至伊春高速铁路，于2小时02分后终到伊春西站。
哈伊高铁是目前我国纬度最高的高速铁路，线路全长318公里，设计时速250公里。（时政来源：新华网）',
  '新华网',
  '2026-08-08',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  1,
  'document',
  '单选',
  '工业和信息化部2026年8月6日对外发布《民用爆炸物品行业安全发展“十五五”规划》，旨在进一步提升本质安全水平，强化监管效能，优化产业结构、产品结构、产能布局，推动行业向智能化、绿色化、（  ）、国际化方向发展。',
  '[{"key":"A","text":"融合化"},{"key":"B","text":"高端化"},{"key":"C","text":"常态化"},{"key":"D","text":"透明化"}]',
  'A',
  '',
  '原题',
  '2026-08-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  2,
  'document',
  '单选',
  '外交部发言人林剑2026年8月6日在就广岛核爆（  ）周年答问时表示，核武器造成的灾难和悲剧不应重演，发生核爆的特定背景更应反思铭记，日本军国主义侵略扩张的教训必须警钟长鸣。',
  '[{"key":"A","text":"100"},{"key":"B","text":"81"},{"key":"C","text":"95"},{"key":"D","text":"77"}]',
  'B',
  '',
  '原题',
  '2026-08-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  3,
  'document',
  '单选',
  '2026年8月7日是（  ）先生诞辰150周年纪念日。（  ）先生是著名的民主革命战士，忠诚的爱国主义者，振兴中华文化教育事业的先驱，是新中国的国家领导人之一，全国工商联的创始人和卓越的领导者，是和中国共产党风雨同舟、荣辱与共、肝胆相照、长期合作的亲密朋友。',
  '[{"key":"A","text":"陈叔通"},{"key":"B","text":"沈钧儒"},{"key":"C","text":"黄炎培"},{"key":"D","text":"李济深"}]',
  'A',
  '',
  '原题',
  '2026-08-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  4,
  'document',
  '单选',
  '（  ）市互联网信息办公室2026年8月6日发布信息称，韩国农协银行（  ）分行成为我国首家通过负面清单实现数据合规出境的银行业机构。',
  '[{"key":"A","text":"上海"},{"key":"B","text":"重庆"},{"key":"C","text":"北京"},{"key":"D","text":"天津"}]',
  'C',
  '',
  '原题',
  '2026-08-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  5,
  'document',
  '单选',
  '2026年8月6日7时40分，（  ）启动按图运行试验。（  ）是目前我国纬度最高的高速铁路，线路全长318公里，设计时速250公里。',
  '[{"key":"A","text":"牡佳高铁"},{"key":"B","text":"哈佳高铁"},{"key":"C","text":"沈白高铁"},{"key":"D","text":"哈伊高铁"}]',
  'D',
  '',
  '原题',
  '2026-08-08'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  1,
  '历史上的今天',
  '1918年亚眠战役爆发',
  '1918年亚眠战役爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1918年亚眠战役爆发|1918年亚眠战役爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  2,
  '历史上的今天',
  '1952年我国实行民族区域自治',
  '1952年我国实行民族区域自治',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1952年我国实行民族区域自治|1952年我国实行民族区域自治',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  3,
  '历史上的今天',
  '1992年中国第一个外汇调剂中心公开市场在北京正式开业',
  '1992年中国第一个外汇调剂中心公开市场在北京正式开业',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1992年中国第一个外汇调剂中心公开市场在北京正式开业|1992年中国第一个外汇调剂中心公开市场在北京正式开业',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  4,
  '历史上的今天',
  '1994年布达拉宫维修工程竣工',
  '1994年布达拉宫维修工程竣工',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1994年布达拉宫维修工程竣工|1994年布达拉宫维修工程竣工',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  5,
  '历史上的今天',
  '1995年京津塘高速公路验收后正式通车',
  '1995年京津塘高速公路验收后正式通车',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1995年京津塘高速公路验收后正式通车|1995年京津塘高速公路验收后正式通车',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  6,
  '常识',
  '鲁迅小说集',
  '主要有《呐喊》《彷徨》《故事新编》。
1.《呐喊》：是中国现代小说的开端与成熟的标志，开创了现代现实主义文学的先河，收录了《狂人日记》《孔乙己》《药》《阿Q正传》《故乡》等14篇小说。
（1）《狂人日记》是中国第一部现代白话小说，揭示了封建礼教的“吃人”本质。
（2）《孔乙己》描写了孔乙己在封建腐朽思想和科举制度毒害下，最后被封建地主阶级所吞噬的悲惨遭遇。揭露了封建科举制度的腐朽。
（3）《药》中讲述了“人血馒头”的故事，揭露了长期的封建统治给人民造成的麻木。
（4）《阿Q正传》表现了封建文化窒息下形成的中国国民的劣根性，“精神胜利法”是阿Q的主要特征。
（5）《故乡》着重描写了闰土和杨二嫂的人物形象，从而反映了辛亥革命前后农村破产、农民痛苦生活的现实。
2.《彷徨》：收录了《祝福》《在酒楼上》《伤逝》等11篇小说。
（1）《祝福》中描述了祥林嫂这个受尽封建礼教压榨的穷苦农家妇女形象。
（2）《故事新编》收录了鲁迅先生以远古神话和历史传说为题材所写的八篇短篇小说。
（3）《伤逝》主人公涓生哀婉悲愤的内心独白的方式，追求婚姻自主建立起了一个温馨的家庭，但不久爱情归于失败，最终以一“伤”一“逝”结局。',
  '常识',
  '鲁迅及其作品',
  'common',
  '常识|鲁迅及其作品|鲁迅小说集|主要有《呐喊》《彷徨》《故事新编》。
1.《呐喊》：是中国现代小说的开端与成熟的标志，开创了现代现实主义文学的先河，收录了《狂人日记》《孔乙己》《药》《阿Q正传',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  7,
  '常识',
  '鲁迅散文集',
  '散文集：《野草》《朝花夕拾》
1.《野草》：开创了现代文学中象征主义道路，收录了《秋夜》《影的告别》《狗的驳诘》《求乞者》《我的失恋》等作品。
（1）《秋夜》：描写了两株枣树同夜空进行不屈不挠的战斗的形象，赞颂了枣树的韧性战斗精神。
（2）《狗的驳诘》描写了“我”和狗的对话，写出狗对人的反驳，鞭挞了社会上那些比狗更势利的小人。
2.《朝花夕拾》：原名《旧事重提》，鲁迅用夹叙夹议的方法，抒发了对往昔亲友和师长的怀念之情。收录了如《狗·猫·鼠》《阿长与<山海经>》《二十四孝图》《从百草园到三味书屋》《藤野先生》《五猖会》《范爱农》等经典作品。
（1）《狗·猫·鼠》描写了作者仇猫的原因，取了“猫”这样一个类型，讽刺了生活中与猫相似的人。
（2）《阿长与〈山海经〉》记述作者儿时与阿长相处的情景，表达了对她的怀念感激之情。
（3）《二十四孝图》重点描写了在阅读“老莱娱亲”和“郭巨埋儿”两个故事时所引起的强烈反感，揭露了封建孝道的虚伪和残酷。
（4）《从百草园到三味书屋》描述了作者儿时在家中百草园得到的乐趣和在三味书屋读书严格但不乏乐趣的生活。
（5）《藤野先生》记录作者在日本留学时期的学习生活及他决定弃医从文的原因，表达了对藤野先生深切的怀念。',
  '常识',
  '鲁迅及其作品',
  'common',
  '常识|鲁迅及其作品|鲁迅散文集|散文集：《野草》《朝花夕拾》
1.《野草》：开创了现代文学中象征主义道路，收录了《秋夜》《影的告别》《狗的驳诘》《求乞者》《我的失恋》等作品。
（1）《秋夜》：',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.8.docx'),
  8,
  '常识',
  '鲁迅杂文集',
  '主要有《热风》《华盖集》《华盖集续编》。
《华盖集》出自鲁迅的作品《自嘲》，华盖指的是帝王或贵官车上的伞盖。
《自嘲》诗句全文是：运交华盖欲何求，未敢翻身已碰头。破帽遮颜过闹市，漏船载酒泛中流。横眉冷对千夫指，俯首甘为孺子牛。躲进小楼成一统，管他冬夏与春秋。',
  '常识',
  '鲁迅及其作品',
  'common',
  '常识|鲁迅及其作品|鲁迅杂文集|主要有《热风》《华盖集》《华盖集续编》。
《华盖集》出自鲁迅的作品《自嘲》，华盖指的是帝王或贵官车上的伞盖。
《自嘲》诗句全文是：运交华盖欲何求，未敢翻身已碰头',
  'learning',
  ''
);

COMMIT;
