-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.21.docx
-- doc_date: 2026-07-21
-- generated_at: 2026-08-21T08:42:54.222Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.21.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.21.docx',
  '2026-07-21',
  '2e1ab8639395b552964b6345043953a13fb845df27747afae0182679cf9ac473',
  'imported',
  '{"paragraphs":74,"articles":5,"questions":5,"knowledge":14,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  1,
  '首届世界华语文学奖在港启动',
  '首届世界华语文学大会暨世界华语文学奖主办方2026年7月17日在香港举行新闻发布会宣布，大会定于2027年2月28日在香港举行，届时将汇聚全球华语文学专家学者交流讨论，并颁发世界华语文学奖，奖项总奖金达400万港元。
本届奖项设有长篇小说、中篇小说、短篇小说、诗歌及散文等五个组别，聚焦港澳台及海外华语文学作者的作品，将邀请知名文学评论家、作家、学者组成评审委员会。（时政来源：人民网）',
  '人民网',
  '2026-07-21',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  2,
  '马龙/许昕三夺乒乓球全锦赛男双冠军',
  '在7月19日进行的2026年全国乒乓球锦标赛男双决赛中，马龙/许昕以3:0战胜黄友政/向鹏，继2015年、2020年之后，第三次夺得全锦赛男双冠军。（时政来源：人民网）',
  '人民网',
  '2026-07-21',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  3,
  '世界杯丨西班牙队夺冠',
  '当地时间2026年7月19日，在美国纽约新泽西体育场进行的2026美加墨世界杯足球赛决赛中，西班牙队1比0战胜阿根廷队，获得冠军。（时政来源：新华网）',
  '新华网',
  '2026-07-21',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  4,
  '国门学校优秀青年教师培养支持计划正式启动实施',
  '近日，国门学校优秀青年教师培养支持计划启动会在黑龙江省黑河市召开，教育部党组成员、副部长杜江峰出席并讲话。
会议指出，边境地区教师是扎根国门一线、托举边疆未来的重要力量。办好国门学校、建强边境地区教师队伍，是维护教育公平的重要举措，事关边疆稳固和国家长远发展。（时政来源：新华网）',
  '新华网',
  '2026-07-21',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  5,
  '中华环保世纪行2026年宣传活动在青海启动',
  '由全国人大常委会办公厅牵头举办的中华环保世纪行2026年宣传活动7月19日在青海西宁启动。今年宣传活动的主题是“贯彻实施生态环境法典 加强青藏高原生态保护”。（时政来源：新华网）',
  '新华网',
  '2026-07-21',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  1,
  'document',
  '单选',
  '首届世界华语文学大会暨世界华语文学奖定于2027年2月28日在（  ）举行。本届奖项设有长篇小说、中篇小说、短篇小说、诗歌及（  ）等五个组别。',
  '[{"key":"A","text":"香港；散文"},{"key":"B","text":"上海；报告文学"},{"key":"C","text":"澳门；戏剧"},{"key":"D","text":"北京；杂文"}]',
  'A',
  '',
  '原题',
  '2026-07-21'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  2,
  'document',
  '单选',
  '在7月19日进行的2026年全国乒乓球锦标赛男双决赛中，（  ）以3:0战胜黄友政/向鹏，继2015年、2020年之后，第三次夺得全锦赛男双冠军。',
  '[{"key":"A","text":"樊振东/林诗栋"},{"key":"B","text":"马龙/许昕"},{"key":"C","text":"王楚钦/樊振东"},{"key":"D","text":"马龙/樊振东"}]',
  'B',
  '',
  '原题',
  '2026-07-21'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  3,
  'document',
  '单选',
  '当地时间2026年7月19日，在美国纽约新泽西体育场进行的2026美加墨世界杯足球赛决赛中，（  ）获得冠军。',
  '[{"key":"A","text":"西班牙队"},{"key":"B","text":"阿根廷队"},{"key":"C","text":"法国队"},{"key":"D","text":"英格兰队"}]',
  'A',
  '',
  '原题',
  '2026-07-21'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  4,
  'document',
  '单选',
  '近日，国门学校优秀青年教师培养支持计划启动会在黑龙江省黑河市召开。会议指出，（  ）是扎根国门一线、托举边疆未来的重要力量。',
  '[{"key":"A","text":"革命地区教师"},{"key":"B","text":"沿海地区教师"},{"key":"C","text":"边境地区教师"},{"key":"D","text":"内陆地区教师"}]',
  'C',
  '',
  '原题',
  '2026-07-21'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  5,
  'document',
  '单选',
  '由全国人大常委会办公厅牵头举办的中华环保世纪行2026年宣传活动7月19日在青海西宁启动。今年宣传活动的主题是（  ）。',
  '[{"key":"A","text":"“全面绿色转型，共建美丽中国”"},{"key":"B","text":"“守护三江源，筑牢国家生态安全屏障”"},{"key":"C","text":"“深入打好污染防治攻坚战”"},{"key":"D","text":"“贯彻实施生态环境法典 加强青藏高原生态保护”"}]',
  'D',
  '',
  '原题',
  '2026-07-21'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  1,
  '历史上的今天',
  '1842年镇江抗敌',
  '1842年镇江抗敌',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1842年镇江抗敌|1842年镇江抗敌',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  2,
  '历史上的今天',
  '1861年美国南北战争 布尔伦河战役爆发',
  '1861年美国南北战争 布尔伦河战役爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1861年美国南北战争 布尔伦河战役爆发|1861年美国南北战争 布尔伦河战役爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  3,
  '历史上的今天',
  '1928年全国反日大会在上海召开',
  '1928年全国反日大会在上海召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1928年全国反日大会在上海召开|1928年全国反日大会在上海召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  4,
  '历史上的今天',
  '1944年豫鄂农民起义并歼国民党军第二十八师',
  '1944年豫鄂农民起义并歼国民党军第二十八师',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1944年豫鄂农民起义并歼国民党军第二十八师|1944年豫鄂农民起义并歼国民党军第二十八师',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  5,
  '历史上的今天',
  '1969年“阿波罗”登上月球',
  '1969年“阿波罗”登上月球',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1969年“阿波罗”登上月球|1969年“阿波罗”登上月球',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  6,
  '常识',
  '运动系统',
  '由骨、关节和骨骼肌三种器官组成，人体有206个骨头。肌肉占人体体积的一半，它和骨骼一起产生运动。最坚硬的骨头是头骨，最坚硬的器官是牙齿。
常见疾病：肩周炎、骨质增生、佝偻病、骨质疏松、骨折等。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|运动系统|由骨、关节和骨骼肌三种器官组成，人体有206个骨头。肌肉占人体体积的一半，它和骨骼一起产生运动。最坚硬的骨头是头骨，最坚硬的器官是牙齿。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  7,
  '常识',
  '循环系统',
  '循环系统最基本的功能是将血液泵送到身体的各个部位。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|循环系统|循环系统最基本的功能是将血液泵送到身体的各个部位。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  8,
  '常识',
  '消化系统',
  '主要由消化管和消化腺组成。消化管通常是指从口腔到肛门的管道，包括口腔、咽、食管、胃、小肠、大肠和肛门;消化腺主要包括肝脏、胰腺、唾液腺、胃腺、肠腺、食道腺等。人体最重要的消化和吸收器官是小肠;大肠最主要的功能是排泄，最大的解毒器官是肝脏。
常见疾病：肝胆疾病(胆结石、肝硬化、肝炎)、消化道溃疡、肠胃炎、痔疮等。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|消化系统|主要由消化管和消化腺组成。消化管通常是指从口腔到肛门的管道，包括口腔、咽、食管、胃、小肠、大肠和肛门;消化腺主要包括肝脏、胰腺、唾液腺、胃腺、肠腺、食道腺等。人',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  9,
  '常识',
  '呼吸系统',
  '由呼吸道、肺血管、肺和呼吸肌组成。
常见疾病：肺部疾病(肺炎、肺心病、肺结核等)、支气管炎、哮喘、感冒等。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|呼吸系统|由呼吸道、肺血管、肺和呼吸肌组成。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  10,
  '常识',
  '泌尿系统',
  '由肾脏、输尿管、膀胱和尿道组成。在机体代谢过程中，排出多余的水分和代谢废物，保持机体内环境稳定。
常见疾病：肾病(肾炎等)、泌尿系统结石(输尿管结石、肾结石、膀胱结石)等。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|泌尿系统|由肾脏、输尿管、膀胱和尿道组成。在机体代谢过程中，排出多余的水分和代谢废物，保持机体内环境稳定。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  11,
  '常识',
  '神经系统',
  '是机体内起主导作用的系统。分为中枢神经系统和周围神经系统两大部分。中枢神经系统由脑和脊髓组成;周围神经系统由脑神经、脊神经和内脏神经组成。
常见疾病：智商低下、癫痫病、多动症、老年痴呆。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|神经系统|是机体内起主导作用的系统。分为中枢神经系统和周围神经系统两大部分。中枢神经系统由脑和脊髓组成;周围神经系统由脑神经、脊神经和内脏神经组成。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  12,
  '常识',
  '生殖系统',
  '它的功能是繁殖后代和形成并保持第二性特征。
常见疾病：不孕症、痛经、前列腺炎等。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|生殖系统|它的功能是繁殖后代和形成并保持第二性特征。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  13,
  '常识',
  '内分泌系统',
  '属于机体的调节系统，与神经系统共同作用，维持人体内环境的稳定，调节人体的生长发育、生殖和各种代谢活动。
常见疾病：糖尿病、甲状腺疾病等。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|内分泌系统|属于机体的调节系统，与神经系统共同作用，维持人体内环境的稳定，调节人体的生长发育、生殖和各种代谢活动。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.21.docx'),
  14,
  '常识',
  '免疫系统',
  '免疫系统具有免疫监视、防御、调控的作用。
免疫器官：是骨髓、脾脏、淋巴结、扁桃体等。
免疫细胞：是淋巴细胞等。
免疫分子：是免疫球蛋白、干扰素等。
常见疾病：艾滋病、风湿性关节炎。',
  '常识',
  '人体的九大系统',
  'common',
  '常识|人体的九大系统|免疫系统|免疫系统具有免疫监视、防御、调控的作用。',
  'learning',
  ''
);

COMMIT;
