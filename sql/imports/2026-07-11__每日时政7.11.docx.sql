-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.11.docx
-- doc_date: 2026-07-11
-- generated_at: 2026-08-21T08:42:54.220Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.11.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.11.docx',
  '2026-07-11',
  'cffa74baa7602ee2b9c7e5edd6a46ef6fb02a1813ab57cb53046c773f0151c1f',
  'imported',
  '{"paragraphs":79,"articles":5,"questions":5,"knowledge":7,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  1,
  '国务院印发《“十五五”碳达峰行动方案》',
  '2026年7月9日，国务院发布《“十五五”碳达峰行动方案》。《行动方案》提出，“十五五”时期是实现碳达峰的关键期、攻坚期。
《行动方案》提出，大力推进非化石能源开发。坚持风光水核等多能并举，更大力度发展新能源，统筹开发布局和消纳利用，扩大非化石能源有效供给。建设“三北”风电光伏、西南水风光一体化、沿海核电、海上风电等清洁能源基地。
《行动方案》提出，持续扩大电力系统调节资源规模，坚持生态优先、需求导向、优化布局，因地制宜加快建设抽水蓄能电站；推动新型储能规模化发展，大力发展长时储能。
《行动方案》提出，引导天然气消费增长保持在合理区间，优先保障民生用气，合理引导重点行业企业用气，因地制宜建设天然气调峰电站。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  2,
  '丁薛祥出席两院院士大会第二次全体会议并讲话',
  '两院院士大会第二次全体会议2026年7月9日下午在京举行。中共中央政治局常委、国务院副总理丁薛祥出席会议并讲话。
丁薛祥强调，要以加强基础研究打牢科技强国建设根基，提高基础研究组织化程度，持续产出重大原创性、颠覆性科技成果。以新型举国体制保障高水平科技自立自强，发挥党的领导这一最大政治优势，坚持“四个面向”战略导向，加强力量协同、资源统筹、央地联动，打好关键核心技术攻坚战。以融合发展增强科技创新活力和动力，突出科技创新供给和产业需求牵引，一体推进教育科技人才发展，加快培育和发展新质生产力。以人工智能赋能科学研究，拓展应用场景，引领科研范式变革，加速科学发现和技术突破。（时政来源：新华网）',
  '新华网',
  '2026-07-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  3,
  '两部门发布排污标准保护赤水河',
  '记者2026年7月9日从生态环境部获悉，生态环境部与国家市场监督管理总局近日联合发布《赤水河流域水污染物排放标准》（GB 47945—2026），促进赤水河流域生态环境保护和高质量发展。
生态环境部水生态环境司有关负责人介绍，赤水河是长江上游一级支流，其干流部分河段是长江上游珍稀特有鱼类“三场”（产卵场、越冬场、索饵场）和洄游通道等重要生境的分布地，生态地位突出。同时，赤水河流域名酒云集，被誉为“美酒河”。（时政来源：新华网）',
  '新华网',
  '2026-07-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  4,
  '2026年全国夏粮产量首次突破3000亿斤',
  '2026年以来，在以习近平同志为核心的党中央坚强领导下，各地区各部门严格落实粮食安全党政同责，压紧压实粮食生产责任，克服黄淮海地区冬小麦大面积晚播、部分地区强降水等不利因素影响，全国夏粮实现丰收。2026年全国夏粮播种面积基本稳定，单产稳中有升，夏粮产量3014.9亿斤，首次突破3000亿斤，比上年增加20.0亿斤，增长0.7%。（时政来源：央视网）',
  '央视网',
  '2026-07-11',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  5,
  '长征十号乙首飞成功',
  '2026年7月10日，长征十号乙运载火箭在海南商业航天发射场发射升空，成功将卫星送入预定轨道，火箭一子级成功回收，任务取得圆满成功。
此次任务是我国首次成功实施运载火箭一子级可控回收，也是全球首次实现运载火箭海上网系回收。（时政来源：新华网）',
  '新华网',
  '2026-07-11',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  1,
  'document',
  '单选',
  '2026年7月9日，国务院发布《“十五五”碳达峰行动方案》。根据《行动方案》，下列说法正确的有哪些？（  ）
①大力推进非化石能源开发，扩大非化石能源有效供给
②推动新型储能规模化发展，大力发展长时储能
③优先保障民生用气，合理引导重点行业企业用气
④建设“三北”核电、西南水风光一体化、沿海风电光伏、海上风电等清洁能源基地
⑤“十五五”时期是实现碳达峰的关键期、攻坚期',
  '[{"key":"A","text":"①②③⑤"},{"key":"B","text":"①③④⑤"},{"key":"C","text":"①②④"},{"key":"D","text":"③④⑤"}]',
  'A',
  '',
  '原题',
  '2026-07-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  2,
  'document',
  '单选',
  '两院院士大会第二次全体会议2026年7月9日下午在京举行。中共中央政治局常委、国务院副总理丁薛祥出席会议并讲话。根据讲话，下列说法正确的有几项？（  ）
①以加强基础研究打牢科技强国建设根基
②提高基础研究组织化程度
③发挥党的领导这一最大政治优势，坚持“四个面向”战略导向
④以融合发展增强科技创新活力和动力',
  '[{"key":"A","text":"1项"},{"key":"B","text":"2项"},{"key":"C","text":"3项"},{"key":"D","text":"4项"}]',
  'D',
  '',
  '原题',
  '2026-07-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  3,
  'document',
  '单选',
  '记者2026年7月9日从生态环境部获悉，生态环境部与国家市场监督管理总局近日联合发布《赤水河流域水污染物排放标准》（GB 47945—2026），促进赤水河流域生态环境保护和高质量发展。赤水河是（  ）一级支流。',
  '[{"key":"A","text":"长江上游"},{"key":"B","text":"怒江上游"},{"key":"C","text":"澜沧江上游"},{"key":"D","text":"黄河中游"}]',
  'A',
  '',
  '原题',
  '2026-07-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  4,
  'document',
  '单选',
  '2026年全国夏粮播种面积基本稳定，单产稳中有升，夏粮产量首次突破（  ）。',
  '[{"key":"A","text":"1000亿斤"},{"key":"B","text":"2000亿斤"},{"key":"C","text":"3000亿斤"},{"key":"D","text":"4000亿斤"}]',
  'C',
  '',
  '原题',
  '2026-07-11'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  5,
  'document',
  '单选',
  '2026年7月10日，（  ）在海南商业航天发射场发射升空，成功将卫星送入预定轨道，火箭（  ）成功回收，任务取得圆满成功。',
  '[{"key":"A","text":"长征十一号甲运载火箭；二子级"},{"key":"B","text":"长征十一号甲运载火箭；助推器"},{"key":"C","text":"长征十号乙运载火箭；整流罩"},{"key":"D","text":"长征十号乙运载火箭；一子级"}]',
  'D',
  '',
  '原题',
  '2026-07-11'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  1,
  '历史上的今天',
  '1848年英国滑铁卢车站正式通车',
  '1848年英国滑铁卢车站正式通车',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1848年英国滑铁卢车站正式通车|1848年英国滑铁卢车站正式通车',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  2,
  '历史上的今天',
  '1949年第一野战军向大西北进军',
  '1949年第一野战军向大西北进军',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年第一野战军向大西北进军|1949年第一野战军向大西北进军',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  3,
  '历史上的今天',
  '1962年人造卫星首次播送全球电视',
  '1962年人造卫星首次播送全球电视',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1962年人造卫星首次播送全球电视|1962年人造卫星首次播送全球电视',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  4,
  '历史上的今天',
  '1998年三峡工程水域因受洪峰影响全面封航',
  '1998年三峡工程水域因受洪峰影响全面封航',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1998年三峡工程水域因受洪峰影响全面封航|1998年三峡工程水域因受洪峰影响全面封航',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  5,
  '历史上的今天',
  '1998年中央电视台首次现场直播法庭审理',
  '1998年中央电视台首次现场直播法庭审理',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1998年中央电视台首次现场直播法庭审理|1998年中央电视台首次现场直播法庭审理',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  6,
  '常识',
  '陈立泉',
  '一句话定位：中国锂电池产业的“拓荒人”，新一代电池技术的领路人。
核心贡献（3点速记）：
1.从零开基：开创我国固态离子学研究方向，造出国内第一块锂电池，建起第一条中试生产线，正式拉开我国锂电池产业化的序幕。
2.破局突围：攻克磷酸铁锂、钴酸锂等核心材料的知识产权难关，守住了我国锂电池产业的发展主动权，支撑我国锂电池产业做到全球领先。
3.布局未来：提出并落地“原位固态化”电池技术路线，推动钠电池从实验室创新走向规模化应用，让我国在下一代电池技术上抢占了战略先机。',
  '常识',
  '国家最高科学技术奖',
  'common',
  '常识|国家最高科学技术奖|陈立泉|一句话定位：中国锂电池产业的“拓荒人”，新一代电池技术的领路人。
核心贡献（3点速记）：
1.从零开基：开创我国固态离子学研究方向，造出国内第一块锂电池，建起第',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.11.docx'),
  7,
  '常识',
  '贲（bēn）德',
  '一句话定位：我国现代雷达技术的奠基人，国防预警的“铸眼人”。
核心贡献（3点速记）：
1.填补空白：研制出我国首部机载脉冲多普勒火控雷达、首部大型远程相控阵预警雷达，拿下了脉冲多普勒、相控阵这两项现代雷达的核心底层技术。
2.建成体系：引领我国雷达搭建起陆海空天一体化的预警探测体系，相关技术已装备数千部骨干雷达。
3.筑牢国防：为我国国防打造了掌握制信息权的“火眼金睛”，为国家安全作出了卓越贡献。',
  '常识',
  '国家最高科学技术奖',
  'common',
  '常识|国家最高科学技术奖|贲（bēn）德|一句话定位：我国现代雷达技术的奠基人，国防预警的“铸眼人”。
核心贡献（3点速记）：
1.填补空白：研制出我国首部机载脉冲多普勒火控雷达、首部大型远程相控阵预警',
  'learning',
  ''
);

COMMIT;
