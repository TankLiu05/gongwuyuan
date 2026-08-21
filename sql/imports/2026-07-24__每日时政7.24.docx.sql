-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.24.docx
-- doc_date: 2026-07-24
-- generated_at: 2026-08-21T08:42:54.223Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.24.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.24.docx',
  '2026-07-24',
  '460119c61b71c194dcb5023148d4f642bd00a435760889b875e8f01503fe9d60',
  'imported',
  '{"paragraphs":86,"articles":5,"questions":5,"knowledge":9,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  1,
  '《体育强国建设“十五五”规划》发布',
  '经国务院批复同意，国家体育总局近日发布《体育强国建设“十五五”规划》。这是首个以“体育强国”为主题的国家级专项规划。
规划指出，推动研制适合不同年龄人群、不同场景的科学健身指南，加大权威性体育科普作品在主流媒体的推广力度。
规划指出，巩固跳水、举重、体操、射击、乒乓球、羽毛球六大传统优势项目基本盘，竞技水平保持世界前列。
规划指出，支持各地结合实际，探索建立“小学—初中—高中”贯通的足球、篮球、排球后备人才培养体系。
规划指出，推动各项目构建赛制稳定、层级分明、衔接有序的“国家—省—市—县”四级青少年竞赛体系。
规划指出，发挥体校在竞技体育后备人才培养中的主渠道作用，提升训练质量和竞争力。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-24',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  2,
  '习近平对基础教育工作作出重要指示',
  '全国基础教育工作会议2026年7月22日在京召开。会上传达了习近平重要指示。
习近平强调，新征程上，全面贯彻党的教育方针，落实立德树人根本任务，坚持不懈用党的创新理论铸魂育人，培养德智体美劳全面发展的社会主义建设者和接班人。要遵循教育规律，落实健康第一教育理念，提升教育教学质量，促进广大学生身心健康、成长成才。要适应人民群众新期盼，推进基础教育扩优提质，牢牢守住教育公平底线。要弘扬教育家精神，加强师德师风建设，培养造就高素质专业化教师队伍。（时政来源：央视网）',
  '央视网',
  '2026-07-24',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  3,
  '《可再生能源发展“十五五”规划》发布',
  '记者2026年7月23日从国家能源局获悉，国家发展改革委、国家能源局日前联合印发的《可再生能源发展“十五五”规划》提出，“十五五”时期，我国可再生能源将进入扩量提质、可靠替代的新发展阶段。（时政来源：新华网）',
  '新华网',
  '2026-07-24',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  4,
  '两部门联合印发《口岸现代化“十五五”规划》',
  '经国务院批准，海关总署和国家发展改革委日前联合印发了《口岸现代化“十五五”规划》。
规划明确，到2030年，口岸现代化建设取得重大进展，空间布局更加优化，基础设施进一步升级完善，智慧口岸建设全面推进，口岸绿色发展模式初步形成，跨境互联更加高效，服务发展提质升级，安全防控精准有效，口岸治理能力显著提升，法治体系更加完备。到2035年，中国式现代化口岸基本建成，为服务高质量发展和高水平安全提供坚实保障。（时政来源：人民网）',
  '人民网',
  '2026-07-24',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  5,
  '庆祝《中俄睦邻友好合作条约》签署25周年大会举行',
  '2026年7月22日，庆祝《中俄睦邻友好合作条约》签署25周年大会在黑龙江省哈尔滨市举行。（时政来源：新华网）',
  '新华网',
  '2026-07-24',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  1,
  'document',
  '单选',
  '经国务院批复同意，国家体育总局近日发布《体育强国建设“十五五”规划》。这是首个以“体育强国”为主题的国家级专项规划。下列相关说法正确的有哪些？（  ）
①加大权威性体育科普作品在主流媒体的推广力度
②巩固足球、举重、体操、射击、乒乓球、羽毛球六大传统优势项目基本盘
③探索建立“小学—初中—高中”贯通的足球、篮球、排球后备人才培养体系
④推动构建“国家—省—市—县”四级青少年竞赛体系
⑤发挥社会机构在竞技体育后备人才培养中的主渠道作用',
  '[{"key":"A","text":"①③④"},{"key":"B","text":"①②④"},{"key":"C","text":"①④⑤"},{"key":"D","text":"②③⑤"}]',
  'A',
  '',
  '原题',
  '2026-07-24'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  2,
  'document',
  '单选',
  '全国基础教育工作会议2026年7月22日在京召开。会上传达了习近平重要指示。下列说法正确的有几项？（  ）
①全面贯彻党的教育方针，落实立德树人根本任务
②遵循教育规律，落实健康第一教育理念
③推进基础教育扩优提质，牢牢守住教育公平底线
④弘扬教育家精神，培养造就高素质专业化教师队伍',
  '[{"key":"A","text":"4项"},{"key":"B","text":"3项"},{"key":"C","text":"2项"},{"key":"D","text":"1项"}]',
  'A',
  '',
  '原题',
  '2026-07-24'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  3,
  'document',
  '单选',
  '国家发展改革委、国家能源局日前联合印发的《可再生能源发展“十五五”规划》提出，“十五五”时期，我国可再生能源将进入（  ）的新发展阶段。',
  '[{"key":"A","text":"扩量提质、可靠替代"},{"key":"B","text":"高速扩张、全面替代"},{"key":"C","text":"存量优化、稳步收缩"},{"key":"D","text":"增量优先、规模扩张"}]',
  'A',
  '',
  '原题',
  '2026-07-24'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  4,
  'document',
  '单选',
  '为进一步扩大开放增进合作，助力中国式现代化建设，经国务院批准，海关总署和国家发展改革委日前联合印发了《口岸现代化“十五五”规划》。规划明确，到（  ）年，中国式现代化口岸基本建成。',
  '[{"key":"A","text":"2035"},{"key":"B","text":"2030"},{"key":"C","text":"2029"},{"key":"D","text":"2027"}]',
  'A',
  '',
  '原题',
  '2026-07-24'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  5,
  'document',
  '单选',
  '2026年7月22日，庆祝《中俄睦邻友好合作条约》签署（  ）周年大会在黑龙江省哈尔滨市举行。',
  '[{"key":"A","text":"50"},{"key":"B","text":"35"},{"key":"C","text":"30"},{"key":"D","text":"25"}]',
  'D',
  '',
  '原题',
  '2026-07-24'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  1,
  '历史上的今天',
  '1828年世界第一台打字机诞生',
  '1828年世界第一台打字机诞生',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1828年世界第一台打字机诞生|1828年世界第一台打字机诞生',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  2,
  '历史上的今天',
  '1878年开平矿务局成立',
  '1878年开平矿务局成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1878年开平矿务局成立|1878年开平矿务局成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  3,
  '历史上的今天',
  '1914年美国宣布巴拿马运河开通',
  '1914年美国宣布巴拿马运河开通',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1914年美国宣布巴拿马运河开通|1914年美国宣布巴拿马运河开通',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  4,
  '历史上的今天',
  '1938年武汉会战拉开帷幕',
  '1938年武汉会战拉开帷幕',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1938年武汉会战拉开帷幕|1938年武汉会战拉开帷幕',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  5,
  '历史上的今天',
  '1980年中共中央在中南海开办科技讲座',
  '1980年中共中央在中南海开办科技讲座',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1980年中共中央在中南海开办科技讲座|1980年中共中央在中南海开办科技讲座',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  6,
  '常识',
  '内科基础知识',
  '1.诊疗对象：主要诊治心、肺、肝、肾、脾胃、血液、内分泌、神经等内脏系统性疾病、全身性疾病、慢性功能性疾病。
2.治疗方式：以吃药、输液、打针、保守调理、慢病管控为主，不首选开刀手术。
3.常见疾病：高血压、糖尿病、冠心病、肺炎、胃炎、肾炎、贫血、甲亢、脑梗塞、感冒感染等。
4.核心特点：查找全身病因，调节机体功能，依靠药物控制病情，无创、保守治疗为主。',
  '常识',
  '内科VS外科',
  'common',
  '常识|内科VS外科 |内科基础知识|1.诊疗对象：主要诊治心、肺、肝、肾、脾胃、血液、内分泌、神经等内脏系统性疾病、全身性疾病、慢性功能性疾病。
2.治疗方式：以吃药、输液、打针、保守调理、慢病管',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  7,
  '常识',
  '外科基础知识',
  '1.诊疗对象：外伤、骨折、器官穿孔、肿瘤、疝气、结石梗阻、先天畸形、组织破损、结构异常病变。
2.治疗方式：以开刀手术、微创切除、修补缝合、复位固定等有创操作为主要治疗手段。
3.常见疾病：阑尾炎、胆结石、外伤出血、骨折、痔疮、脏器破裂、肿瘤切除术、关节畸形矫正等。
4.核心特点：修复身体解剖结构，直接切除、修补病变组织，以手术操作为核心。',
  '常识',
  '内科VS外科',
  'common',
  '常识|内科VS外科 |外科基础知识|1.诊疗对象：外伤、骨折、器官穿孔、肿瘤、疝气、结石梗阻、先天畸形、组织破损、结构异常病变。
2.治疗方式：以开刀手术、微创切除、修补缝合、复位固定等有创操作为',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  8,
  '常识',
  '易错误区',
  '很多人固有错误认知：身体里面得病=内科，身体外面得病=外科。
内脏长结石、阑尾发炎穿孔、内脏肿瘤，都在身体内部，却属于外科；
皮肤外伤、体表伤口，看着在外面，部分浅表感染属于内科，大面积创伤、缝合清创属于外科。
真正区分标准是：靠药物调理→内科；靠手术开刀→外科，和病在体内、体外无关。',
  '常识',
  '内科VS外科',
  'common',
  '常识|内科VS外科 |易错误区|很多人固有错误认知：身体里面得病=内科，身体外面得病=外科。
内脏长结石、阑尾发炎穿孔、内脏肿瘤，都在身体内部，却属于外科；
皮肤外伤、体表伤口，看着在外面，部',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.24.docx'),
  9,
  '常识',
  '总结',
  '内科：不动刀，吃药输液调理全身，管慢病、炎症、内脏功能毛病；
外科：开刀做手术，修补切除病灶，管外伤、结构破损、梗阻穿孔毛病。
不是里外分内外，动不动刀才是内外。',
  '常识',
  '内科VS外科',
  'common',
  '常识|内科VS外科 |总结|内科：不动刀，吃药输液调理全身，管慢病、炎症、内脏功能毛病；
外科：开刀做手术，修补切除病灶，管外伤、结构破损、梗阻穿孔毛病。
不是里外分内外，动不动刀才是内外',
  'learning',
  ''
);

COMMIT;
