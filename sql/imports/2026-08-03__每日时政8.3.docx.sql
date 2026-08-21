-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.3.docx
-- doc_date: 2026-08-03
-- generated_at: 2026-08-21T08:42:54.224Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.3.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.3.docx',
  '2026-08-03',
  'f5d44ad0c7bb0d014f4b75b2fb1c0954cbc58a3bdd42d996c9eab8897339d038',
  'imported',
  '{"paragraphs":73,"articles":5,"questions":5,"knowledge":7,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  1,
  '李强主持召开国务院常务会议',
  '国务院总理李强2026年7月31日主持召开国务院常务会议。会议强调，要有效扩大国内需求，抓住潜力大、带动强的领域推出一批有力举措，加快实施“十五五”规划确定的重大项目，扎实推进“六张网”规划建设。（时政来源：新华网）',
  '新华网',
  '2026-08-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  2,
  '《知识产权保护和运用“十五五”规划》印发',
  '国务院日前印发《知识产权保护和运用“十五五”规划》，明确了“十五五”时期开展知识产权工作的目标指标、重点任务和专项工程。
《规划》提出，展望2035年，我国知识产权综合竞争力跻身世界前列，中国特色、世界水平的知识产权强国基本建成。（时政来源：新华网）',
  '新华网',
  '2026-08-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  3,
  '热烈庆祝中国人民解放军建军99周年',
  '中华人民共和国国防部2026年7月31日在人民大会堂举办招待会，热烈庆祝中国人民解放军建军99周年。（时政来源：新华网）',
  '新华网',
  '2026-08-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  4,
  '十二名“最美新时代革命军人”',
  '在中国人民解放军建军99周年之际，中央宣传部、中央军委政治工作部联合发布12名“最美新时代革命军人”。
李灿、王晓明、王涛、步佳文、周宏潮、高德宝、顾巧云、王文彬、张峰、常超、范汉杰、陈玉浩等12名官兵，是全军部队在党的旗帜下，加强政治上的革命性锻造、推动实现建军一百年奋斗目标的伟大实践中涌现出的先进典型。（时政来源：人民网）',
  '人民网',
  '2026-08-03',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  5,
  '《黄岩岛国家级自然保护区管理办法》发布',
  '2026年8月1日，自然资源部、国家林业和草原局、中国海警局、海南省人民政府联合印发《黄岩岛国家级自然保护区管理办法》。
黄岩岛位于我国中沙群岛，拥有独特的珊瑚礁生态系统和特殊的地质构造，分布有玳瑁、绿海龟、番红砗磲等大量珍稀濒危生物，具有丰富的生物多样性和独特的物种稀有性。（时政来源：新华网）',
  '新华网',
  '2026-08-03',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  1,
  'document',
  '单选',
  '国务院总理李强2026年7月31日主持召开国务院常务会议。会议强调，加快实施“十五五”规划确定的重大项目，扎实推进（  ）规划建设。',
  '[{"key":"A","text":"“三张网”"},{"key":"B","text":"“四张网”"},{"key":"C","text":"“五张网”"},{"key":"D","text":"“六张网”"}]',
  'D',
  '',
  '原题',
  '2026-08-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  2,
  'document',
  '单选',
  '《知识产权保护和运用“十五五”规划》提出，展望2035年，我国知识产权综合竞争力跻身世界前列，（  ）的知识产权强国基本建成。',
  '[{"key":"A","text":"制度完善、治理高效"},{"key":"B","text":"布局合理、安全稳固"},{"key":"C","text":"中国特色、世界水平"},{"key":"D","text":"创新驱动、开放包容"}]',
  'C',
  '',
  '原题',
  '2026-08-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  3,
  'document',
  '单选',
  '中华人民共和国国防部2026年7月31日在人民大会堂举办招待会，热烈庆祝中国人民解放军建军（  ）周年。',
  '[{"key":"A","text":"95"},{"key":"B","text":"98"},{"key":"C","text":"99"},{"key":"D","text":"100"}]',
  'C',
  '',
  '原题',
  '2026-08-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  4,
  'document',
  '单选',
  '在中国人民解放军建军99周年之际，中央宣传部、中央军委政治工作部联合发布12名“最美XIN时代革命军人”。下列人物当选的有（  ）。
①钱七虎；②王晓明；③陈玉浩；④顾巧云',
  '[{"key":"A","text":"①②③"},{"key":"B","text":"①③④"},{"key":"C","text":"②③④"},{"key":"D","text":"①②③④"}]',
  'C',
  '',
  '原题',
  '2026-08-03'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  5,
  'document',
  '单选',
  '2026年8月1日，自然资源部、国家林业和草原局、中国海警局、海南省人民政府联合印发《黄岩岛（  ）自然保护区管理办法》。黄岩岛位于我国（  ），拥有独特的珊瑚礁生态系统和特殊的地质构造，具有丰富的生物多样性和独特的物种稀有性。',
  '[{"key":"A","text":"省级；西沙群岛"},{"key":"B","text":"国家级；中沙群岛"},{"key":"C","text":"省级；南沙群岛"},{"key":"D","text":"国家级；西沙群岛"}]',
  'B',
  '',
  '原题',
  '2026-08-03'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  1,
  '历史上的今天',
  '1965年我国首次人工合成了牛胰岛素结晶',
  '1965年我国首次人工合成了牛胰岛素结晶',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1965年我国首次人工合成了牛胰岛素结晶|1965年我国首次人工合成了牛胰岛素结晶',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  2,
  '历史上的今天',
  '1986年建国后首次企业宣告破产（沈阳防爆器械厂）',
  '1986年建国后首次企业宣告破产（沈阳防爆器械厂）',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1986年建国后首次企业宣告破产（沈阳防爆器械厂）|1986年建国后首次企业宣告破产（沈阳防爆器械厂）',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  3,
  '历史上的今天',
  '2008年第十五届南亚区域合作联盟首脑会议闭幕',
  '2008年第十五届南亚区域合作联盟首脑会议闭幕',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2008年第十五届南亚区域合作联盟首脑会议闭幕|2008年第十五届南亚区域合作联盟首脑会议闭幕',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  4,
  '历史上的今天',
  '2009年山东栖霞出现“龙吸水”奇观',
  '2009年山东栖霞出现“龙吸水”奇观',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2009年山东栖霞出现“龙吸水”奇观|2009年山东栖霞出现“龙吸水”奇观',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  5,
  '历史上的今天',
  '2009年中国海军第三批护航编队首次采用单舰护航',
  '2009年中国海军第三批护航编队首次采用单舰护航',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2009年中国海军第三批护航编队首次采用单舰护航|2009年中国海军第三批护航编队首次采用单舰护航',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  6,
  '常识',
  '简介',
  '《年会不能停2》是由董润年执导并编剧的职场喜剧电影，影片承接前作“众和集团”的故事线，讲述因年会风波被贬至分公司的老员工马杰与热血新人刘奔意外触发“离职即重启”的时间循环魔咒，在无限重复的职场困境中不断试错、探寻职场真相与工作意义的故事。',
  '常识',
  '电影《年会不能停2》考点梳理',
  'common',
  '常识|电影《年会不能停2》考点梳理|简介|《年会不能停2》是由董润年执导并编剧的职场喜剧电影，影片承接前作“众和集团”的故事线，讲述因年会风波被贬至分公司的老员工马杰与热血新人刘奔意外触发“离职即重启”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.3.docx'),
  7,
  '常识',
  '职场劳动法常识考点',
  '（一）经济性裁员
指企业由于经营不善、转产、技术革新等经济性原因，一次性裁减一定数量劳动者的行为。根据《劳动合同法》，需裁减人员二十人以上或裁减不足二十人但占企业职工总数百分之十以上的，用人单位应提前三十日向工会或全体职工说明情况，听取意见后，裁减方案经向劳动行政部门报告，方可裁减人员。
裁减人员时，应当优先留用下列人员：（1）与本单位订立较长期限的固定期限劳动合同的；（2）与本单位订立无固定期限劳动合同的；（3）家庭无其他就业人员，有需要扶养的老人或者未成年人的。
（二）经济补偿“三兄弟”——N、N+1、2N
1.N（经济补偿金）：按劳动者在本单位工作年限，每满一年支付一个月工资，六个月以上不满一年的，按一年计算；不满六个月的，支付半个月工资。是合法解除劳动合同时的常规补偿。
2.N+1（代通知金）：用人单位未提前三十日书面通知即解除劳动合同的，需额外支付一个月工资作为“代通知金”。
【注意】N+1仅适用于三种无过失性辞退情形（医疗期满、不胜任工作、客观情况发生重大变化），且用人单位选择不提前三十日书面通知而立即解除时，才需支付。
3.2N（赔偿金）：用人单位违法解除或终止劳动合同的，应按经济补偿标准的二倍向劳动者支付赔偿金。支付赔偿金后，不再支付经济补偿金。
（三）加班制度
我国实行劳动者每日工作时间不超过八小时、平均每周工作时间不超过四十四小时的工时制度。用人单位因生产经营需要，经与工会和劳动者协商后可延长工作时间，一般每日不得超过一小时；因特殊原因延长的，每日不得超过三小时，每月不得超过三十六小时。
安排劳动者延长工作时间（平日加班）的，支付不低于工资的150%的工资报酬；休息日安排工作又不能安排补休的，支付不低于工资的200%的工资报酬；法定休假日安排工作的，支付不低于工资的300%的工资报酬。
（四）KPI
指关键绩效指标，是将企业宏观战略目标层层分解后产生的可操作战术目标。其理论基础是意大利经济学家帕累托提出的“二八原理”，即关键的20%决定了80%的结果。KPI理念深受彼得・德鲁克“目标管理”理论影响，是企业绩效管理的核心工具之一。在具体制定时，通常遵循SMART原则（具体、可衡量、可达成、相关性、时限性）。
（五）试用期
劳动合同期限三个月以上不满一年的，试用期不得超过一个月；一年以上不满三年的，不得超过二个月；三年以上固定期限和无固定期限劳动合同，不得超过六个月。以完成一定工作任务为期限或合同期限不满三个月的，不得约定试用期。同一用人单位与同一劳动者只能约定一次试用期。',
  '常识',
  '电影《年会不能停2》考点梳理',
  'common',
  '常识|电影《年会不能停2》考点梳理|职场劳动法常识考点|（一）经济性裁员
指企业由于经营不善、转产、技术革新等经济性原因，一次性裁减一定数量劳动者的行为。根据《劳动合同法》，需裁减人员二十人以上或裁减不足二十人但占企',
  'learning',
  ''
);

COMMIT;
