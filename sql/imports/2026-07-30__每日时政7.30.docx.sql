-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.30.docx
-- doc_date: 2026-07-30
-- generated_at: 2026-08-21T08:42:54.224Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.30.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.30.docx',
  '2026-07-30',
  '8f891c721a9bc75b5835f4e89e8c1901314a241e6b0cdb3616bec545f20beb86',
  'imported',
  '{"paragraphs":87,"articles":5,"questions":5,"knowledge":11,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  1,
  'C919高原型首架机完成首飞',
  '2026年7月29日，C919高原型首架机在上海浦东国际机场开展首次飞行试验，完成全部预定试飞科目，标志着C919飞机系列化发展迈出重要一步。C919高原型在基本型基础上，采取了机身缩短、系统功能改进等针对性设计，以满足高原运行要求。（时政来源：央视网）',
  '央视网',
  '2026-07-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  2,
  '中央宣传部授予王戟同志“时代楷模”称号',
  '2026年7月，中央宣传部向全社会宣传发布王戟同志的先进事迹，授予他“时代楷模”称号。
党的十八大以来，王戟同志自觉用习近平新时代中国特色社会主义思想武装头脑，深入学习贯彻习近平强军思想，坚定不移向着国防科技自主创新高地冲锋，在遭受重大疾病打击、高位截肢的情况下，仍以坚韧意志和乐观精神坚守战位、忘我奋斗，持续开展研究攻关，取得了多项达到国际先进水平的创新成果，培养了一批高可信软件技术骨干人才。（时政来源：新华网）',
  '新华网',
  '2026-07-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  3,
  '我国将统筹推进革命文物环境整治工程',
  '2026年7月28日，国家文物局举行新闻发布会，介绍出台《革命文物保护工程技术导则（试行）》有关情况。技术导则明确，统筹推进革命文物环境整治工程，保护好有价值的历史环境要素，做到“守底线、做减法、慎加法”，确保革命圣地真实、朴素，有艰苦奋斗氛围、有浓厚历史感。
技术导则围绕调查与评估、勘察与设计、施工与验收三个关键阶段，强调研究性保护，构建“革命史实—文物本体—历史环境—有价值历史痕迹”的关联体系。（时政来源：新华网）',
  '新华网',
  '2026-07-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  4,
  '北京东西城联合发布“中轴线上”三年行动计划',
  '2026年7月27日，在北京中轴线申遗成功两周年之际，东城区与西城区联合发布《“中轴线上”——北京中轴线焕新绽彩行动计划（2026-2028年）》。
行动计划系统谋划遗产保护、价值阐释、活化利用、融合发展四大方向，全面构建文物保护、文化传播、旅游产品、国潮文创、演艺生态、非遗传承、数字文旅、品牌活动八大体系，明确三步走目标，全力推动北京中轴线从“城市轴”“文化轴”向“活力轴”“发展轴”跃升，打造世界文化遗产保护利用典范与老城复兴标杆。（时政来源：人民网）',
  '人民网',
  '2026-07-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  5,
  '“十五五”期间单位国内生产总值二氧化碳排放将降低17%',
  '生态环境部会同国家发展改革委等18个部门2026年7月29日联合发布《国家应对气候变化“十五五”规划》。
根据《规划》，到2030年，单位国内生产总值二氧化碳排放较2025年降低17%，全国碳排放权交易市场覆盖行业单位产品二氧化碳排放比2025年下降3%左右，建成诚信透明、方法统一、参与广泛、与国际接轨的全国温室气体自愿减排交易市场，产品碳足迹管理体系基本建成，加强非二氧化碳温室气体监测管控，形成3000万吨二氧化碳当量减排能力，适应气候变化工作体系更加完善，气候适应型社会建设取得阶段性进展，应对气候变化意识和能力持续增强。（时政来源：央广网）',
  '央广网',
  '2026-07-30',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  1,
  'document',
  '单选',
  '2026年7月29日，（  ）高原型首架机在上海浦东国际机场开展首次飞行试验，完成全部预定试飞科目，标志着（  ）飞机系列化发展迈出重要一步。',
  '[{"key":"A","text":"C919"},{"key":"B","text":"C929"},{"key":"C","text":"C909"},{"key":"D","text":"C939"}]',
  'A',
  '',
  '原题',
  '2026-07-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  2,
  'document',
  '单选',
  '2026年7月，中央宣传部向全社会宣传发布（  ）同志的先进事迹，授予他“时代楷模”称号。（  ）同志在遭受重大疾病打击、高位截肢的情况下，仍以坚韧意志和乐观精神坚守战位、忘我奋斗，持续开展研究攻关，取得了多项达到国际先进水平的创新成果，培养了一批高可信软件技术骨干人才。',
  '[{"key":"A","text":"钟掘"},{"key":"B","text":"王戟"},{"key":"C","text":"徐淙祥"},{"key":"D","text":"万步炎"}]',
  'B',
  '',
  '原题',
  '2026-07-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  3,
  'document',
  '单选',
  '2026年7月28日，国家文物局举行新闻发布会，介绍出台《革命文物保护工程技术导则（试行）》有关情况。技术导则围绕调查与评估、勘察与设计、施工与验收三个关键阶段，强调（  ），构建“革命史实—文物本体—历史环境—有价值历史痕迹”的关联体系。',
  '[{"key":"A","text":"研究性保护"},{"key":"B","text":"原址原状保护"},{"key":"C","text":"开发性保护"},{"key":"D","text":"最大干预保护"}]',
  'A',
  '',
  '原题',
  '2026-07-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  4,
  'document',
  '单选',
  '2026年7月27日，在北京中轴线申遗成功两周年之际，东城区与西城区联合发布《“中轴线上”——北京中轴线焕新绽彩行动计划（2026-2028年）》。行动计划系统谋划遗产保护、价值阐释、（  ）、融合发展四大方向，明确三步走目标，全力推动北京中轴线从“城市轴”“文化轴”向“活力轴”“发展轴”跃升，打造世界文化遗产保护利用典范与老城复兴标杆。',
  '[{"key":"A","text":"老城更新"},{"key":"B","text":"文旅开发"},{"key":"C","text":"活化利用"},{"key":"D","text":"文脉传承"}]',
  'C',
  '',
  '原题',
  '2026-07-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  5,
  'document',
  '单选',
  '生态环境部会同国家发展改革委等18个部门2026年7月29日联合发布《国家应对气候变化“十五五”规划》。根据《规划》，下列哪项不是到2030年的发展目标？（  ）',
  '[{"key":"A","text":"建成诚信透明、方法统一、参与广泛、与国际接轨的全国温室气体自愿减排交易市场"},{"key":"B","text":"单位国内生产总值二氧化碳排放较2025年降低17%"},{"key":"C","text":"气候适应型社会建设取得阶段性进展"},{"key":"D","text":"产品碳足迹管理体系全面建成"}]',
  'D',
  '',
  '原题',
  '2026-07-30'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  1,
  '历史上的今天',
  '1903年苏联共产党成立',
  '1903年苏联共产党成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1903年苏联共产党成立|1903年苏联共产党成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  2,
  '历史上的今天',
  '1905年同盟会筹备会议召开',
  '1905年同盟会筹备会议召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1905年同盟会筹备会议召开|1905年同盟会筹备会议召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  3,
  '历史上的今天',
  '1923年中国自行设计生产第一架飞机',
  '1923年中国自行设计生产第一架飞机',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1923年中国自行设计生产第一架飞机|1923年中国自行设计生产第一架飞机',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  4,
  '历史上的今天',
  '1932年中国首次参加奥运会',
  '1932年中国首次参加奥运会',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1932年中国首次参加奥运会|1932年中国首次参加奥运会',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  5,
  '历史上的今天',
  '1937年平津沦陷',
  '1937年平津沦陷',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1937年平津沦陷|1937年平津沦陷',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  6,
  '常识',
  '生产力',
  '生产力与生产关系的辩证关系
生产力是人们解决社会同自然矛盾的实际能力， 表示人和自然的关系。生产力的基本要素包括：（１）劳动资料；（２）劳动对象；（３）劳动者。劳动资料里最重要的是生产工具， 它是生产力发展水平的客观尺度， 是区分社会经济时代的物质标志。劳动资料和劳动对象合称生产资料。劳动者是生产力中最活跃的因素。只有把劳动者和生产资料相结合， 才能变成现实生产力。生产力的重要要素：科学技术。科学技术是先进生产力的集中体现和主要标志，是第一生产力。',
  '常识',
  '社会基本矛盾',
  'common',
  '常识|社会基本矛盾|生产力|生产力与生产关系的辩证关系
生产力是人们解决社会同自然矛盾的实际能力， 表示人和自然的关系。生产力的基本要素包括：（１）劳动资料；（２）劳动对象；（３）劳动者。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  7,
  '常识',
  '生产关系',
  '生产关系是在物质资料的生产过程中所形成的人与人之间的关系。生产关系表现的是人与人之间的经济关系。生产关系是社会关系中最基本的关系。从静态上看， 生产关系是由生产资料的所有制形式、人们在生产中的地位和相互关系、产品分配形式等方面构成。生产资料所有制形式是区分社会制度的根本标志，是一切社会关系中最本质、最基本的关系。生产关系对生产力的反作用归根到底还是由生产力决定的， 取决于生产关系是否适应生产力的状况。
经济基础与上层建筑的辩证关系',
  '常识',
  '社会基本矛盾',
  'common',
  '常识|社会基本矛盾|生产关系|生产关系是在物质资料的生产过程中所形成的人与人之间的关系。生产关系表现的是人与人之间的经济关系。生产关系是社会关系中最基本的关系。从静态上看， 生产关系是由生产',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  8,
  '常识',
  '经济基础',
  '经济基础是指由社会一定发展阶段的生产力所决定的生产关系的总和。又称基本经济制度。经济体制是基本经济制度采取的组织形式和管理形式， 是生产关系的具体实现形式。',
  '常识',
  '社会基本矛盾',
  'common',
  '常识|社会基本矛盾|经济基础|经济基础是指由社会一定发展阶段的生产力所决定的生产关系的总和。又称基本经济制度。经济体制是基本经济制度采取的组织形式和管理形式， 是生产关系的具体实现形式。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  9,
  '常识',
  '上层建筑',
  '上层建筑是指建立在一定经济基础之上的意识形态以及相应的制度、组织和设施。上层建筑包括意识形态（又称观念上层建筑）和政治上层建筑。意识形态或者观念上层建筑又包括政治思想、法律思想、道德、艺术、宗教、哲学等思想观点。政治上层建筑包括政治法律制度及设施和政治组织， 如国家政治制度、立法司法制度和行政制度， 以及国家政权机构、政党、军队、警察、法庭、监狱等政治组织形态和设施。在整个上层建筑中， 政治上层建筑居主导地位， 国家政权是指代不明， 建议明确是“上层建筑” 还是“政治上层建筑” 的核心。',
  '常识',
  '社会基本矛盾',
  'common',
  '常识|社会基本矛盾|上层建筑|上层建筑是指建立在一定经济基础之上的意识形态以及相应的制度、组织和设施。上层建筑包括意识形态（又称观念上层建筑）和政治上层建筑。意识形态或者观念上层建筑又包括政',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  10,
  '常识',
  '经济基础和上层建筑的关系',
  '经济基础决定上层建筑， 上层建筑反作用于经济基础。上层建筑反作用的性质，取决于它所服务的经济基础的性质， 归根到底取决于它是否有利于生产力的发展。',
  '常识',
  '社会基本矛盾',
  'common',
  '常识|社会基本矛盾|经济基础和上层建筑的关系|经济基础决定上层建筑， 上层建筑反作用于经济基础。上层建筑反作用的性质，取决于它所服务的经济基础的性质， 归根到底取决于它是否有利于生产力的发展。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.30.docx'),
  11,
  '常识',
  '社会形态',
  '社会形态＝社会制度＝经济基础＋上层建筑
社会基本矛盾的关系生产力和生产关系的矛盾、经济基础和上层建筑的矛盾构成了人类社会的基本矛盾，生产力和生产关系的矛盾是最根本的。
在社会基本矛盾运动中， 生产力是最活跃、最革命的因素， 是社会发展的最终决定力量。 辨析：社会主义社会的基本矛盾仍然是生产力和生产关系之间的矛盾、经济基础和上层建筑之间的矛盾。
我国社会的主要矛盾
我国的主要矛盾是随着时间的变化而不断变化的。其演变历程为：
１８４０～１９４９年：近代中国半殖民地半封建社会的主要矛盾是帝国主义和中华民族的矛盾，封建主义和人民大众的矛盾。
１９４９～１９５６年：新民主主义社会的主要矛盾：工人阶级和资产阶级的矛盾。
１９５６～１９８１年：人民对于建立先进的工业国的要求同落后的农业国的现实之间的矛盾、我国社会主义社会的主要矛盾：是人民对于经济文化迅速发展的需要同当前经济文化不能满足人民需要的状况之间的矛盾。
１９８１～２０１７年：我国社会主义社会的主要矛盾：人民日益增长的物质文化需要同落后的社会生产之间的矛盾。
２０１７十九大～至今：我国社会主义社会的主要矛盾：人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾。
社会主义社会的矛盾
１９５７年２月，毛泽东发表《关于正确处理人民内部矛盾的问题》的讲话，系统论述了社会主义社会矛盾的理论。
（一）关于社会主义社会存在两种不同性质矛盾的理论
敌我矛盾———性质：对抗性。
人民内部矛盾———性质：非对抗性。
正确处理人民内部矛盾是国家政治生活的主题。
（二） 关于正确处理两类不同性质社会矛盾的基本方法
解决敌我矛盾的方法：专政。
解决人民内部矛盾的方法：民主、说服教育。',
  '常识',
  '社会基本矛盾',
  'common',
  '常识|社会基本矛盾|社会形态|社会形态＝社会制度＝经济基础＋上层建筑
社会基本矛盾的关系生产力和生产关系的矛盾、经济基础和上层建筑的矛盾构成了人类社会的基本矛盾，生产力和生产关系的矛盾是最根',
  'learning',
  ''
);

COMMIT;
