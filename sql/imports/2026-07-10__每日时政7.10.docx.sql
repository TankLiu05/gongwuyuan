-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.10.docx
-- doc_date: 2026-07-10
-- generated_at: 2026-08-21T08:42:54.219Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.10.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.10.docx',
  '2026-07-10',
  '4ce7719c128ae47a95dcb1ac4f9644fbbb7a96382f81421fe9c6d6f7fd3024f4',
  'imported',
  '{"paragraphs":74,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  1,
  '中国在世贸组织倡议贸易投资一体化',
  '世界贸易组织2026年7月6日至8日在瑞士日内瓦召开系列会议。中方在会前向世贸组织提交《贸易投资一体化促进工业化》提案。
中方代表在会上表示，中方提议在世贸组织中讨论贸易投资一体化促进工业化，既是源于对中国工业化不同阶段发展经验的总结，也是回应全球南方发展诉求，助力经济全球化普惠包容发展。（时政来源：央广网）',
  '央广网',
  '2026-07-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  2,
  '9部门支持加快零售业创新发展',
  '商务部等9部门近日印发的关于加快零售业创新发展的意见，2026年7月9日对外发布。
意见提出工作新目标，力争到2030年，基本形成布局合理、供给优质、业态多元、智慧便捷、竞争有序的现代零售体系。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  3,
  '“十五五”时期我国城镇新增就业人数将保持相当规模',
  '2026年7月9日，人力资源社会保障部发布《人力资源和社会保障事业发展“十五五”规划》。
《规划》指出，健全以职业技能培训和评价为基础、院校企业为重要载体、职业技能竞赛为平台，覆盖城乡全体劳动者、贯穿职业生涯的终身职业技能培训制度。聚焦离校未就业高校毕业生等青年群体提供就业技能培训、岗前技能培训、企业新型学徒制培训，聚焦企业职工开展岗位技能提升培训、转岗培训、技师培训，聚焦失业人员提供再就业技能培训，聚焦退休后有就业意愿的人员探索提供适合其需求的技能培训。以市场化培训为主导、行业企业自主培训为主体，充分发挥院校、社会化培训机构等优势作用，构建多元化培养体系，扩大高质量培训供给。（时政来源：人民网）',
  '人民网',
  '2026-07-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  4,
  '全面提升内河交通安全水平',
  '2026年7月7日，交通运输部、应急管理部联合发布《关于加强内河交通安全工作的意见》。
意见提出，到2030年，内河交通本质安全水平、管理水平、应急能力等大幅提高，形成安全可靠、监管高效、保障有力的内河交通安全工作格局，“十五五”时期内河交通事故数量比“十四五”时期下降50%以上。（时政来源：人民网）',
  '人民网',
  '2026-07-10',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  5,
  '“大连一号”无人机海上首飞',
  '2026年7月，大连理工大学自主研发的“大连一号”低空跨海长航时复合翼无人机圆满完成海上首次飞行试验，挂载能力、航程航时、抗风能力等核心指标均达预期，为构建“海陆空”一体化低空经济生态增添了高性能实战平台。（时政来源：人民网）',
  '人民网',
  '2026-07-10',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  1,
  'document',
  '单选',
  '世界贸易组织2026年7月6日至8日在瑞士日内瓦召开系列会议。中方代表在会上表示，中方提议在世贸组织中讨论（  ），既是源于对中国工业化不同阶段发展经验的总结，也是回应全球南方发展诉求，助力经济全球化普惠包容发展。',
  '[{"key":"A","text":"数字贸易规范化促进工业化"},{"key":"B","text":"贸易投资一体化促进工业化"},{"key":"C","text":"服务贸易自由化促进全球化"},{"key":"D","text":"发展中成员特殊差别待遇"}]',
  'B',
  '',
  '原题',
  '2026-07-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  2,
  'document',
  '单选',
  '商务部等9部门近日印发的关于加快零售业创新发展的意见，2026年7月9日对外发布。意见提出工作新目标，力争到2030年，基本形成布局合理、供给优质、（  ）、智慧便捷、（  ）的现代零售体系。',
  '[{"key":"A","text":"城乡均衡；便民惠民"},{"key":"B","text":"业态多元；竞争有序"},{"key":"C","text":"品类丰富；规范诚信"},{"key":"D","text":"渠道畅通；绿色低碳"}]',
  'B',
  '',
  '原题',
  '2026-07-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  3,
  'document',
  '单选',
  '2026年7月9日，人力资源社会保障部发布《人力资源和社会保障事业发展“十五五”规划》。根据《规划》，下列表述正确的有哪些？（  ）
①健全以职业技能培训和评价为基础、院校企业为重要载体、职业技能竞赛为平台，覆盖城乡全体劳动者、贯穿职业生涯的终身职业技能培训制度
②聚焦离校未就业高校毕业生提供再就业技能培训
③聚焦企业职工开展岗位技能提升培训、转岗培训、技师培训
④以市场化培训为主导、行业企业自主培训为主体',
  '[{"key":"A","text":"①③④"},{"key":"B","text":"②③④"},{"key":"C","text":"①②③"},{"key":"D","text":"①②④"}]',
  'A',
  '',
  '原题',
  '2026-07-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  4,
  'document',
  '单选',
  '2026年7月7日，交通运输部、应急管理部联合发布《关于加强内河交通安全工作的意见》。意见提出，“十五五”时期内河交通事故数量比“十四五”时期下降（  ）以上。',
  '[{"key":"A","text":"80%"},{"key":"B","text":"60%"},{"key":"C","text":"50%"},{"key":"D","text":"20%"}]',
  'C',
  '',
  '原题',
  '2026-07-10'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  5,
  'document',
  '单选',
  '2026年7月，大连理工大学自主研发的（  ）低空跨海长航时复合翼无人机圆满完成海上首次飞行试验，多项核心指标均达预期，为构建“海陆空”一体化低空经济生态增添了高性能实战平台。',
  '[{"key":"A","text":"“连理一号”"},{"key":"B","text":"“星海一号”"},{"key":"C","text":"“海鸥一号”"},{"key":"D","text":"“大连一号”"}]',
  'D',
  '',
  '原题',
  '2026-07-10'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  1,
  '历史上的今天',
  '1912年四川都督尹昌衡出征西藏',
  '1912年四川都督尹昌衡出征西藏',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1912年四川都督尹昌衡出征西藏|1912年四川都督尹昌衡出征西藏',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  2,
  '历史上的今天',
  '1943年二战西西里岛登陆战开始',
  '1943年二战西西里岛登陆战开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1943年二战西西里岛登陆战开始|1943年二战西西里岛登陆战开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  3,
  '历史上的今天',
  '1949年彭德怀歼灭胡宗南部',
  '1949年彭德怀歼灭胡宗南部',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年彭德怀歼灭胡宗南部|1949年彭德怀歼灭胡宗南部',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  4,
  '历史上的今天',
  '1949年林彪指挥三路大军渡江进击两湖地区',
  '1949年林彪指挥三路大军渡江进击两湖地区',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年林彪指挥三路大军渡江进击两湖地区|1949年林彪指挥三路大军渡江进击两湖地区',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  5,
  '历史上的今天',
  '1951年朝鲜停战谈判首次会议在开城举行',
  '1951年朝鲜停战谈判首次会议在开城举行',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1951年朝鲜停战谈判首次会议在开城举行|1951年朝鲜停战谈判首次会议在开城举行',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  6,
  '常识',
  '台风的实质',
  '台风是热带气旋的一种。我国把西北太平洋和南海的热带气旋，按其底层中心附近最大平均风力的大小划分为六个等级，包括热带低压、热带风暴、强热带风暴、台风、强台风和超强台风，其中风力为12级或以上的统称为台风。',
  '常识',
  '关于台风的基础知识',
  'common',
  '常识|关于台风的基础知识|台风的实质|台风是热带气旋的一种。我国把西北太平洋和南海的热带气旋，按其底层中心附近最大平均风力的大小划分为六个等级，包括热带低压、热带风暴、强热带风暴、台风、强台风和超强',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  7,
  '常识',
  '台风发展的过程',
  '台风的初始阶段为热带低压，从最初的低压环流到中心附近最大平均风力达到八级，一般需要两天左右，慢的要三四天，快的只要几个小时。在发展阶段，台风不断吸收能量，直到中心气压达到最低值，风速达到最大值。而台风登陆后，受到地面摩擦和能量供应不足的共同影响，会迅速消亡。',
  '常识',
  '关于台风的基础知识',
  'common',
  '常识|关于台风的基础知识|台风发展的过程|台风的初始阶段为热带低压，从最初的低压环流到中心附近最大平均风力达到八级，一般需要两天左右，慢的要三四天，快的只要几个小时。在发展阶段，台风不断吸收能量，直到中',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  8,
  '常识',
  '全球热带气旋发生的海域',
  '大多数台风发生在南北纬5°-20°左右海面温度较高的洋面上。',
  '常识',
  '关于台风的基础知识',
  'common',
  '常识|关于台风的基础知识|全球热带气旋发生的海域|大多数台风发生在南北纬5°-20°左右海面温度较高的洋面上。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  9,
  '常识',
  '台风的内部结构',
  '台风的结构，从中心向外依次分为：台风眼区（中心）、台风眼壁（云墙）、螺旋雨带三部分。
台风眼区由于有下沉气流，通常是云淡风轻的好天气。台风眼壁（云墙）有强烈的上升气流，因而云墙下常出现狂风暴雨，是台风内天气最恶劣的区域。',
  '常识',
  '关于台风的基础知识',
  'common',
  '常识|关于台风的基础知识|台风的内部结构|台风的结构，从中心向外依次分为：台风眼区（中心）、台风眼壁（云墙）、螺旋雨带三部分。
台风眼区由于有下沉气流，通常是云淡风轻的好天气。台风眼壁（云墙）有强烈的上',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.10.docx'),
  10,
  '常识',
  '台风预警',
  '台风预警信号分四级，分别以蓝色、黄色、橙色和红色表示。
蓝色：24小时内可能或者已经受热带气旋影响,沿海或者陆地平均风力达6级以上，或者阵风8级以上并可能持续。
黄色：24小时内可能或者已经受热带气旋影响,沿海或者陆地平均风力达8级以上，或者阵风10级以上并可能持续。
橙色：12小时内可能或者已经受热带气旋影响,沿海或者陆地平均风力达10级以上，或者阵风12级以上并可能持续。
红色：6小时内可能或者已经受热带气旋影响，沿海或者陆地平均风力达12级以上，或者阵风达14级以上并可能持续。',
  '常识',
  '关于台风的基础知识',
  'common',
  '常识|关于台风的基础知识|台风预警|台风预警信号分四级，分别以蓝色、黄色、橙色和红色表示。
蓝色：24小时内可能或者已经受热带气旋影响,沿海或者陆地平均风力达6级以上，或者阵风8级以上并可能持续。',
  'learning',
  ''
);

COMMIT;
