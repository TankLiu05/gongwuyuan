-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.15.docx
-- doc_date: 2026-07-15
-- generated_at: 2026-08-21T08:42:54.221Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.15.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.15.docx',
  '2026-07-15',
  'a2a4ebc2902c7679f50161a129df9be5e662af934e5573e7881a158cb465f2aa',
  'imported',
  '{"paragraphs":82,"articles":5,"questions":5,"knowledge":13,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  1,
  '长征五号遥十四火箭安全运抵文昌航天发射场',
  '据中国载人航天工程办公室消息，2026年7月13日，将执行嫦娥七号任务的长征五号遥十四运载火箭安全运抵文昌航天发射场。（时政来源：人民网）',
  '人民网',
  '2026-07-15',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  2,
  '2026世界人工智能大会暨人工智能全球治理高级别会议整体情况',
  '2026世界人工智能大会暨人工智能全球治理高级别会议将于7月17日至20日在上海举行，主题是“智能伙伴 共创未来”。（时政来源：人民网）',
  '人民网',
  '2026-07-15',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  3,
  '李强主持召开经济形势专家和企业家座谈会',
  '中共中央政治局常委、国务院总理李强2026年7月13日下午主持召开经济形势专家和企业家座谈会，听取对当前经济形势和下一步经济工作的意见建议。
李强强调，要按照党中央决策部署，保持高质量发展战略定力，加大逆周期调节力度，用好用足存量政策，预研储备增量政策，切实巩固拓展经济稳中向好态势。要系统施策释放内需潜力，抓好服务业扩能提质政策落实，扩大优质服务供给，加快培育消费新增长点。坚持投资于物和投资于人协同发力，着力推进重大基础设施网络建设，加强教育、培训等人力资本投入，完善医疗、养老、托育等公共服务，在改善民生中扩大内需。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-15',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  4,
  '国务院印发《国民健康“十五五”规划》',
  '2026年7月13日，国务院印发《国民健康“十五五”规划》。《规划》指出，以推动卫生健康事业高质量发展为主题，以优化全方位全周期整合型健康服务体系为主线，以改革创新为根本动力，以数智化转型、中西医协同为牵引，推动医疗卫生发展方式更加注重以健康为中心、服务体系更加注重质量效益提升、改革治理更加注重系统协同，增强健康服务均衡性和可及性，推动人民群众更加注重主动健康，加快形成有利于健康的生产生活方式和经济社会发展模式，全面提高国民健康水平，夯实中国式现代化的健康根基。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-15',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  5,
  '国务院批复同意《扩大消费“十五五”规划》',
  '2026年7月13日，国务院发布《扩大消费“十五五”规划》的批复，原则同意《扩大消费“十五五”规划》。
《规划》指出，更好满足住房消费需求，优化保障性住房供给，因城施策增加改善性住房供给，规范发展住房租赁市场。
《规划》指出，拓展汽车改装、租赁、赛事及房车露营等汽车后市场消费。
《规划》指出，健全生活必需品应急保供体系，做好基本消费品保供稳价。
《规划》指出，系统培育中国消费名品方阵，构建以企业品牌和区域品牌为主体的中国消费名品体系。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-15',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  1,
  'document',
  '单选',
  '据中国载人航天工程办公室消息，2026年7月13日，将执行嫦娥七号任务的（  ）安全运抵文昌航天发射场。',
  '[{"key":"A","text":"长征七号遥十一运载火箭"},{"key":"B","text":"长征五号B遥四运载火箭"},{"key":"C","text":"长征五号遥十四运载火箭"},{"key":"D","text":"长征七号遥八运载火箭"}]',
  'C',
  '',
  '原题',
  '2026-07-15'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  2,
  'document',
  '单选',
  '2026世界人工智能大会暨人工智能全球治理高级别会议将于7月17日至20日在上海举行，主题是（  ）。',
  '[{"key":"A","text":"“智能伙伴 共创未来”"},{"key":"B","text":"“智能时代 同球共济”"},{"key":"C","text":"“智联世界 生成未来”"},{"key":"D","text":"“智联世界 元生无界”"}]',
  'A',
  '',
  '原题',
  '2026-07-15'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  3,
  'document',
  '单选',
  '中共中央政治局常委、国务院总理李强2026年7月13日下午主持召开经济形势专家和企业家座谈会。李强强调，要按照党中央决策部署，保持高质量发展战略定力，加大逆周期调节力度，用好用足（  ），预研储备（  ），切实巩固拓展经济稳中向好态势。',
  '[{"key":"A","text":"存量政策；增量政策"},{"key":"B","text":"内需政策；产业政策"},{"key":"C","text":"短期政策；长期政策"},{"key":"D","text":"财政政策；货币政策"}]',
  'A',
  '',
  '原题',
  '2026-07-15'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  4,
  'document',
  '单选',
  '《国民健康“十五五”规划》对“十五五”时期加快建设健康中国作出部署。下列说法正确的有几项？（  ）
①以优化全方位全周期整合型健康服务体系为主线
②推动服务体系更加注重质量效益提升
③以数智化转型、中西医协同为牵引
④以推动卫生健康事业高质量发展为主题
⑤推动医疗卫生发展方式更加注重以治病为中心',
  '[{"key":"A","text":"2项"},{"key":"B","text":"3项"},{"key":"C","text":"4项"},{"key":"D","text":"5项"}]',
  'C',
  '',
  '原题',
  '2026-07-15'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  5,
  'document',
  '单选',
  '2026年7月13日，国务院发布《扩大消费“十五五”规划》的批复，原则同意《扩大消费“十五五”规划》。根据《规划》，下列表述正确的有哪些？（  ）
①优化保障性住房供给，因城施策增加改善性住房供给
②拓展汽车改装、租赁、赛事及房车露营等汽车前市场消费
③健全生活必需品应急保供体系，做好基本消费品保供稳价
④构建以企业品牌和区域品牌为主体的中国消费名品体系',
  '[{"key":"A","text":"①②③④"},{"key":"B","text":"①②③"},{"key":"C","text":"②③④"},{"key":"D","text":"①③④"}]',
  'D',
  '',
  '原题',
  '2026-07-15'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  1,
  '历史上的今天',
  '1876年第一国际解散',
  '1876年第一国际解散',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1876年第一国际解散|1876年第一国际解散',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  2,
  '历史上的今天',
  '1918年第二次马恩河战役开始',
  '1918年第二次马恩河战役开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1918年第二次马恩河战役开始|1918年第二次马恩河战役开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  3,
  '历史上的今天',
  '1934年中共向国民党送交《中国共产党为公布国共合作宣言》',
  '1934年中共向国民党送交《中国共产党为公布国共合作宣言》',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1934年中共向国民党送交《中国共产党为公布国共合作宣言》|1934年中共向国民党送交《中国共产党为公布国共合作宣言》',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  4,
  '历史上的今天',
  '1934年中国工农红军北上先遣队组成',
  '1934年中国工农红军北上先遣队组成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1934年中国工农红军北上先遣队组成|1934年中国工农红军北上先遣队组成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  5,
  '历史上的今天',
  '1949年《工人日报》创刊',
  '1949年《工人日报》创刊',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年《工人日报》创刊|1949年《工人日报》创刊',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  6,
  '常识',
  '流动偏好陷阱',
  '流动性陷阱是凯恩斯提出的一种假说，也叫流动偏好陷阱，而“流动性偏好”，指的是对货币的需求，由于货币具有使用上的灵活性，人们宁可以牺牲利息收入而存储不生息的货币来保持财富的心理倾向。
流动性陷阱认为，人们持有货币的动机有：第一，是为了进行正常交易的需要。第二，是为了预防意外支出而持有一部分货币的动机。第三，是投机动机。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|流动偏好陷阱|流动性陷阱是凯恩斯提出的一种假说，也叫流动偏好陷阱，而“流动性偏好”，指的是对货币的需求，由于货币具有使用上的灵活性，人们宁可以牺牲利息收入而存储不生息的货币来',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  7,
  '常识',
  '中等收入陷阱',
  '中等收入陷阱是一个国家发展到中等收入阶段（人均国内生产总值1000美元—12000美元左右）后，可能出现两种结果：',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|中等收入陷阱|中等收入陷阱是一个国家发展到中等收入阶段（人均国内生产总值1000美元—12000美元左右）后，可能出现两种结果：',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  8,
  '常识',
  '持续发展，逐渐成为发达国家。',
  '持续发展，逐渐成为发达国家。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|持续发展，逐渐成为发达国家。|持续发展，逐渐成为发达国家。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  9,
  '常识',
  '在发展中经济体发现自己卡在劳动力成本上涨和成本竞…',
  '在发展中经济体发现自己卡在劳动力成本上涨和成本竞争力下降的中间，无法与高技能创新的先进经济体，或低收入低工资的经济体在廉价生产制成品上相竞争,导致经济发展徘徊不前。后一种结果称走入了中等收入陷阱。
“中等收入陷阱”发生的原因主要就是低端制造业转型失败，低端制造业可以带来中等收入，但是伴随而来的污染，低质低价，都是恶性循环。低端制造改高端制造，是完全靠高科技解决，而高科技不是几十年能追赶的。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|在发展中经济体发现自己卡在劳动力成本上涨和成本竞…|在发展中经济体发现自己卡在劳动力成本上涨和成本竞争力下降的中间，无法与高技能创新的先进经济体，或低收入低工资的经济体在廉价生产制成品上相竞争,导致经济发展徘徊不',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  10,
  '常识',
  '修昔底德陷阱',
  '指一个新崛起的大国必然要挑战现存大国，而现存大国也必然会回应这种威胁，这样战争变得不可避免。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|修昔底德陷阱|指一个新崛起的大国必然要挑战现存大国，而现存大国也必然会回应这种威胁，这样战争变得不可避免。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  11,
  '常识',
  '塔西佗陷阱',
  '指当政府部门或某一组织失去公信力时，无论说真话还是假话，做好事还是坏事，都会被认为是说假话、做坏事。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|塔西佗陷阱|指当政府部门或某一组织失去公信力时，无论说真话还是假话，做好事还是坏事，都会被认为是说假话、做坏事。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  12,
  '常识',
  '金德尔伯格陷阱',
  '“金德尔伯格陷阱”的核心是国际公共产品的供给问题。内容是没有国家有能力、或者虽然有能力却没有意愿和手段来领导世界，承担国际公共产品成本的一种状态。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|金德尔伯格陷阱|“金德尔伯格陷阱”的核心是国际公共产品的供给问题。内容是没有国家有能力、或者虽然有能力却没有意愿和手段来领导世界，承担国际公共产品成本的一种状态。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.15.docx'),
  13,
  '常识',
  '卢梭陷阱',
  '政治中可能有利益集团政治的存在，搞不好小集团的利益就会决定大多数人的利益。这种利益集团政治就是卢梭陷阱。
为切实防止党内形成既得利益集团，“卢梭陷阱”的解决办法是走群众路线，向人民群众信息公开、党务公开、政务公开，让群众能够有更多的路径来监督政府或监督党的一些重大的决策，使群众能够看得到我们党和政府与群众之间的血肉联系。',
  '常识',
  '经济学中的“陷阱',
  'common',
  '常识|经济学中的“陷阱|卢梭陷阱|政治中可能有利益集团政治的存在，搞不好小集团的利益就会决定大多数人的利益。这种利益集团政治就是卢梭陷阱。
为切实防止党内形成既得利益集团，“卢梭陷阱”的解决办法',
  'learning',
  ''
);

COMMIT;
