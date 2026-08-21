-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政6.26.docx
-- doc_date: 2026-06-26
-- generated_at: 2026-08-21T08:42:54.216Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政6.26.docx',
  '/Users/tank/Desktop/每日时政/每日时政6.26.docx',
  '2026-06-26',
  '0d7668d2e498407ae175a7595d19f91b7bb364903a61026f91e6bff564035b17',
  'imported',
  '{"paragraphs":65,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  1,
  '习近平总书记在山东德州考察',
  '2026年6月24日，中共中央总书记、国家主席、中央军委主席习近平在山东省委书记林武和省长周乃翔陪同下，来到德州市考察调研。
习近平强调，保障粮食等重要农产品稳定供给是农业生产的重中之重。要落实粮食生产各项支持政策，做好农资保供稳价，积极推广先进适用品种、技术、装备，稳步提高单产和效益，力争全年粮食丰收。
习近平表示，树立和践行正确政绩观，最终要落到为民造福上。（时政来源：央视网）',
  '央视网',
  '2026-06-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  2,
  '黄岩岛蓝洞调查报告发布',
  '生态环境部2026年6月25日发布《2025年黄岩岛蓝洞调查报告》。报告显示，黄岩岛蓝洞属于世界罕见的珊瑚礁生长结构成因型海洋蓝洞，也是我国迄今探明的第一个珊瑚礁蓝洞，洞口面积约1491.7平方米、最大直径56.3米，深度16.6米，内部结构呈漏斗状，洞底狭窄，存在水体浊度分层。地质年代学研究初步表明，该蓝洞至少形成于距今3200年前。（时政来源：央视网）',
  '央视网',
  '2026-06-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  3,
  '中国气象学家许健民获颁国际气象组织奖',
  '世界气象组织2026年6月24日在日内瓦为中国工程院院士、中国气象局卫星气象专家许健民颁发第70届国际气象组织奖，表彰他为天气预报、卫星气象事业以及气象业务服务作出的卓越贡献。（时政来源：新华网）',
  '新华网',
  '2026-06-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  4,
  '第三十六个全国土地日',
  '2026年6月25日是第三十六个全国土地日，活动主题是“珍惜每一寸土地 促进高质量发展”。（时政来源：光明网）',
  '光明网',
  '2026-06-26',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  5,
  '全球首艘三文鱼养殖工船“苏海1号”完成首捕',
  '2026年6月23日，全球首艘10万吨级三文鱼养殖工船“苏海1号”，在山东威海海域启动首批商品鱼起捕作业。（时政来源：光明网）',
  '光明网',
  '2026-06-26',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  1,
  'document',
  '单选',
  '2026年6月24日，中共中央总书记、国家主席、中央军委主席习近平在山东省委书记林武和省长周乃翔陪同下，来到德州市考察调研。习近平强调，（  ）是农业生产的重中之重。',
  '[{"key":"A","text":"严守耕地保护红线"},{"key":"B","text":"保障粮食等重要农产品稳定供给"},{"key":"C","text":"推进高标准农田建设"},{"key":"D","text":"发展乡村特色产业"}]',
  'B',
  '',
  '原题',
  '2026-06-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  2,
  'document',
  '单选',
  '生态环境部2026年6月25日发布《2025年黄岩岛蓝洞调查报告》。报告显示，黄岩岛蓝洞属于世界罕见的珊瑚礁生长结构成因型海洋蓝洞，也是我国迄今探明的第一个珊瑚礁蓝洞，内部结构呈（  ）。',
  '[{"key":"A","text":"圆筒状"},{"key":"B","text":"竖井状"},{"key":"C","text":"漏斗状"},{"key":"D","text":"椭球状"}]',
  'C',
  '',
  '原题',
  '2026-06-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  3,
  'document',
  '单选',
  '世界气象组织2026年6月24日在日内瓦为中国工程院院士、中国气象局卫星气象专家（  ）颁发第70届国际气象组织奖，表彰他为天气预报、卫星气象事业以及气象业务服务作出的卓越贡献。',
  '[{"key":"A","text":"秦大河"},{"key":"B","text":"许健民"},{"key":"C","text":"叶笃正"},{"key":"D","text":"曾庆存"}]',
  'B',
  '',
  '原题',
  '2026-06-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  4,
  'document',
  '单选',
  '2026年（  ）是第三十六个全国土地日，活动主题是（  ）。',
  '[{"key":"A","text":"6月24日；“严守耕地红线 保障粮食安全”"},{"key":"B","text":"6月25日；“统筹土地利用 守护生态基底”"},{"key":"C","text":"6月24日；“节约集约用地 严守耕地红线”"},{"key":"D","text":"6月25日；“珍惜每一寸土地 促进高质量发展”"}]',
  'D',
  '',
  '原题',
  '2026-06-26'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  5,
  'document',
  '单选',
  '2026年6月23日，全球首艘10万吨级三文鱼养殖工船（  ），在山东威海海域启动首批商品鱼起捕作业。',
  '[{"key":"A","text":"“苏海1号”"},{"key":"B","text":"“深蓝1号”"},{"key":"C","text":"“国信1号”"},{"key":"D","text":"“耕海1号”"}]',
  'A',
  '',
  '原题',
  '2026-06-26'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  1,
  '历史上的今天',
  '1923年紫禁城发生大火',
  '1923年紫禁城发生大火',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1923年紫禁城发生大火|1923年紫禁城发生大火',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  2,
  '历史上的今天',
  '930年埃及六月起义爆发',
  '930年埃及六月起义爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|930年埃及六月起义爆发|930年埃及六月起义爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  3,
  '历史上的今天',
  '1945年苏联斯大林获“苏联英雄”称号',
  '1945年苏联斯大林获“苏联英雄”称号',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年苏联斯大林获“苏联英雄”称号|1945年苏联斯大林获“苏联英雄”称号',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  4,
  '历史上的今天',
  '1946年解放战争开始',
  '1946年解放战争开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1946年解放战争开始|1946年解放战争开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  5,
  '历史上的今天',
  '1949年以刘少奇为首的中共代表团开始访问苏联',
  '1949年以刘少奇为首的中共代表团开始访问苏联',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年以刘少奇为首的中共代表团开始访问苏联|1949年以刘少奇为首的中共代表团开始访问苏联',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  6,
  '常识',
  '基本养老保险',
  '基本养老保险，是国家根据法律、法规的规定，强制建立和实施的一种社会保险制度，是我国正在完善的城镇职工养老保障体系的“第一支柱”。
在这一制度下，用人单位和劳动者必须依法缴纳养老保险费，在劳动者达到国家规定的退休年龄或因其他原因而退出劳动岗位后，社会保险经办机构依法向其支付养老金等待遇，从而保障其基本生活。基本养老保险与失业保险、基本医疗保险、工伤保险、生育保险等共同构成现代社会保险制度，并且是社会保险制度中最重要的险种之一。',
  '常识',
  '我国养老保障体系“三大支柱',
  'common',
  '常识|我国养老保障体系“三大支柱|基本养老保险|基本养老保险，是国家根据法律、法规的规定，强制建立和实施的一种社会保险制度，是我国正在完善的城镇职工养老保障体系的“第一支柱”。
在这一制度下，用人单位和劳动者',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  7,
  '常识',
  '企业年金',
  '企业年金，属于“第二支柱”，又称企业退休金或雇主年金。是指在政府强制实施的公共养老金或国家养老金制度之外，企业在国家政策的指导下，根据自身经济实力和经济状况自愿建立的，为本企业职工提供一定程度退休收入保障的补充性养老金制度。
企业年金是对国家基本养老保险的重要补充，在实行现代社会保险制度的国家中，企业年金已经成为一种较为普遍实行的企业补充养老金计划，又称为"企业退休金计划"或"职业养老金计划"，并且成为所在国养老保险制度的重要组成部分。',
  '常识',
  '我国养老保障体系“三大支柱',
  'common',
  '常识|我国养老保障体系“三大支柱|企业年金|企业年金，属于“第二支柱”，又称企业退休金或雇主年金。是指在政府强制实施的公共养老金或国家养老金制度之外，企业在国家政策的指导下，根据自身经济实力和经济状况自愿',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.26.docx'),
  8,
  '常识',
  '个人商业养老保险',
  '个人商业养老计划，属于“第三支柱”，是自己缴费、自己退休后消费，是一种自我保障，既不存在其他缴费者，也不存在再分配的问题，是个人理财规划的结果，是指个人或家庭，为了自己或家庭成员年老后的消费，在其具有劳动能力时，将其收入的一部分以各种方式进行储蓄和投资的一种养老计划。
凡可用于居民养老支出的财务资源，例如居民存款、养老理财、养老基金、养老保险等，都属于第三支柱养老保险的范畴。
某些国家，为了鼓励居民或公民为自己养老而储蓄、投资，往往会给予符合特定条件的个人养老计划一定的税收优惠。
第一支柱承担了主要保障责任，覆盖近10亿人，但支出压力日益加大，替代率呈现下降趋势，目前已降至45%，低于国际劳工组织55%的警戒线水平。第二支柱规模很小，仅覆盖约5600万人。第三支柱长期处于起步阶段，发展缓慢，占比过低，对养老保障的支撑明显不足。',
  '常识',
  '我国养老保障体系“三大支柱',
  'common',
  '常识|我国养老保障体系“三大支柱|个人商业养老保险|个人商业养老计划，属于“第三支柱”，是自己缴费、自己退休后消费，是一种自我保障，既不存在其他缴费者，也不存在再分配的问题，是个人理财规划的结果，是指个人或家庭，',
  'learning',
  ''
);

COMMIT;
