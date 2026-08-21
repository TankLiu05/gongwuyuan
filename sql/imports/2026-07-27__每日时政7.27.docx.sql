-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.27.docx
-- doc_date: 2026-07-27
-- generated_at: 2026-08-21T08:42:54.223Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.27.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.27.docx',
  '2026-07-27',
  '6f5a705d9bca427b7d6ede9151e33c1f8cd04e78612518783ed7aef2f1b5c6c9',
  'imported',
  '{"paragraphs":69,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  1,
  '景德镇手工瓷业遗存申遗成功',
  '2026年7月25日，在韩国釜山举行的联合国教科文组织第48届世界遗产大会上，中国申报的“景德镇手工瓷业遗存”成功列入《世界遗产名录》，成为中国第61项世界遗产。这是中国陶瓷文化首次以完整的手工瓷业遗存体系列入《世界遗产名录》。（时政来源：央视网）',
  '央视网',
  '2026-07-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  2,
  '国际射联全项世界杯：16岁杜雨宸首夺国际赛事金牌',
  '2026年国际射联全项世界杯7月25日进行了女子10米气步枪项目的角逐，年仅16岁的中国队小将杜雨宸以254.6环的成绩夺得冠军，这也是她个人首枚国际赛事金牌。（时政来源：新华网）',
  '新华网',
  '2026-07-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  3,
  '“新新三样”又来了!',
  '近日举办的“在高质量发展中保障和改善民生”形势政策系列报告会上，科技部党组书记、部长阴和俊表示，被称为“新新三样”的人工智能、机器人、创新药正迅猛发展，有望形成新的支柱产业。（时政来源：人民网）',
  '人民网',
  '2026-07-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  4,
  '全球首个零碳机场能源系统技术成果发布',
  '2026年7月25日，全球首个零碳机场技术成果发布会在鄂尔多斯伊金霍洛国际机场举行。
据介绍，全球首创的基于二氧化碳冷热一体化的“风－光－储－冷－热－电”零碳能源系统技术路线颠覆了传统化石能源供能体系，具备在民航机场、产业园区、算力中心、制造工厂等场景产业化应用和规模化推广的条件，对节能降碳具有重要意义。（时政来源：人民网）',
  '人民网',
  '2026-07-27',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  5,
  '《小型个人信息处理者个人信息保护简化措施规定》公布',
  '国家网信办、公安部近日联合公布《小型个人信息处理者个人信息保护简化措施规定》，自2026年9月1日起施行。
规定明确小型个人信息处理者，是指处理不满10万人个人信息的个人信息处理者。（时政来源：人民网）',
  '人民网',
  '2026-07-27',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  1,
  'document',
  '单选',
  '2026年7月25日，在韩国釜山举行的联合国教科文组织第48届世界遗产大会上，中国申报的（  ）成功列入《世界遗产名录》，成为中国第61项世界遗产。',
  '[{"key":"A","text":"西夏陵"},{"key":"B","text":"“北京中轴线——中国理想都城秩序的杰作”"},{"key":"C","text":"“巴丹吉林沙漠－沙山湖泊群”"},{"key":"D","text":"“景德镇手工瓷业遗存”"}]',
  'D',
  '',
  '原题',
  '2026-07-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  2,
  'document',
  '单选',
  '2026年国际射联全项世界杯7月25日进行了女子10米气步枪项目的角逐，年仅16岁的中国队小将（  ）以254.6环的成绩夺得冠军，这也是她个人首枚国际赛事金牌。',
  '[{"key":"A","text":"王子菲"},{"key":"B","text":"韩佳予"},{"key":"C","text":"杜雨宸"},{"key":"D","text":"黄雨婷"}]',
  'C',
  '',
  '原题',
  '2026-07-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  3,
  'document',
  '单选',
  '近日举办的“在高质量发展中保障和改善民生”形势政策系列报告会上，科技部党组书记、部长阴和俊表示，被称为“新新三样”的（  ）正迅猛发展，有望形成新的支柱产业。',
  '[{"key":"A","text":"新能源汽车、锂电池、光伏产品"},{"key":"B","text":"量子科技、低空经济、新材料"},{"key":"C","text":"人工智能、机器人、创新药"},{"key":"D","text":"服装、家具、家电"}]',
  'C',
  '',
  '原题',
  '2026-07-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  4,
  'document',
  '单选',
  '2026年7月25日，全球首个零碳机场技术成果发布会在鄂尔多斯伊金霍洛国际机场举行。全球首创的基于二氧化碳冷热一体化的（  ）零碳能源系统技术路线颠覆了传统化石能源供能体系，对节能降碳具有重要意义。',
  '[{"key":"A","text":"“风光－制氢－储能－供热”"},{"key":"B","text":"“光－储－地热－热－电”"},{"key":"C","text":"“风－储－氢－冷－电”"},{"key":"D","text":"“风－光－储－冷－热－电”"}]',
  'D',
  '',
  '原题',
  '2026-07-27'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  5,
  'document',
  '单选',
  '《小型个人信息处理者个人信息保护简化措施规定》自2026年9月1日起施行。规定明确小型个人信息处理者，是指处理不满（  ）万人个人信息的个人信息处理者。',
  '[{"key":"A","text":"50"},{"key":"B","text":"10"},{"key":"C","text":"100"},{"key":"D","text":"200"}]',
  'B',
  '',
  '原题',
  '2026-07-27'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  1,
  '历史上的今天',
  '1921年胰岛素分离成功',
  '1921年胰岛素分离成功',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1921年胰岛素分离成功|1921年胰岛素分离成功',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  2,
  '历史上的今天',
  '1930年红三军团攻占长沙',
  '1930年红三军团攻占长沙',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1930年红三军团攻占长沙|1930年红三军团攻占长沙',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  3,
  '历史上的今天',
  '1949年世界第一架喷气客机号试飞',
  '1949年世界第一架喷气客机号试飞',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年世界第一架喷气客机号试飞|1949年世界第一架喷气客机号试飞',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  4,
  '历史上的今天',
  '1953年朝鲜战争结束',
  '1953年朝鲜战争结束',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1953年朝鲜战争结束|1953年朝鲜战争结束',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  5,
  '历史上的今天',
  '1958年包兰铁路通车',
  '1958年包兰铁路通车',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1958年包兰铁路通车|1958年包兰铁路通车',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  6,
  '常识',
  '简介',
  '《八仙！》是2026年上映的中国神话题材喜剧动画电影，影片以中国民间“八仙过海”传说为蓝本，将叙事重心置于八位神仙的凡人阶段，讲述一群出身草根的普通人机缘巧合凑到一起，假扮神仙、组团搞钱，最终踏上守护苍生旅程的故事。',
  '常识',
  '电影《八仙！》',
  'common',
  '常识|电影《八仙！》|简介|《八仙！》是2026年上映的中国神话题材喜剧动画电影，影片以中国民间“八仙过海”传说为蓝本，将叙事重心置于八位神仙的凡人阶段，讲述一群出身草根的普通人机缘巧合凑',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  7,
  '常识',
  '神话常识考点',
  '1.八仙：是中国民间传说中广为流传的八位神仙，分别为吕洞宾、钟离权（汉钟离）、张果老、铁拐李、韩湘子、曹国舅、蓝采和、何仙姑。
2.八仙过海：八仙最著名的典故，出自明代吴元泰《东游记》。相传八仙在蓬莱阁聚会后渡海，各用法宝渡水——铁拐李借拐杖、汉钟离借芭蕉扇、张果老借纸驴、吕洞宾借长剑、韩湘子借花篮、曹国舅借玉板、蓝采和借大拍板、何仙姑借荷花。后世以“八仙过海，各显神通”比喻各自施展本领、各显其能。
3.蓬莱仙境：中国古代神话中的海上仙山，与方丈、瀛洲并称“海上三神山”。相传为仙人居所，是八仙传说的重要舞台。
4.终南山：道教发祥地之一，位于陕西西安，相传为吕洞宾修道之地。道教全真派创始人王重阳曾在此修行，有“仙都”“洞天之冠”之称。
5.福禄寿三星：中国民间信仰中的三位吉神，分别象征幸福、禄位、长寿。电影中将福禄寿藏宝阁设为八仙盗宝的目标地点。',
  '常识',
  '电影《八仙！》',
  'common',
  '常识|电影《八仙！》|神话常识考点|1.八仙：是中国民间传说中广为流传的八位神仙，分别为吕洞宾、钟离权（汉钟离）、张果老、铁拐李、韩湘子、曹国舅、蓝采和、何仙姑。
2.八仙过海：八仙最著名的典故，',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.27.docx'),
  8,
  '常识',
  '文化常识考点',
  '1.道教神仙体系：中国本土宗教道教拥有庞大而复杂的神仙体系，分为先天神（如三清、玉皇大帝等，天地开辟前即存在）与后天仙（凡人修炼得道而成，如八仙）。八仙属于典型的“凡人成仙”类型，体现了道教“人人皆可成仙”的核心观念。
2.“四游记”：明代四部神魔小说的合称，包括：
《西游记》（吴承恩）——唐僧师徒西天取经
《东游记》（吴元泰）——八仙过海故事
《南游记》（余象斗）——华光天王故事
《北游记》（余象斗）——真武大帝故事
3.青绿山水：中国山水画的一种风格，以石青、石绿为主色，代表作为北宋王希孟《千里江山图》。电影《八仙！》的视觉风格即借鉴了青绿山水的东方美学。',
  '常识',
  '电影《八仙！》',
  'common',
  '常识|电影《八仙！》|文化常识考点|1.道教神仙体系：中国本土宗教道教拥有庞大而复杂的神仙体系，分为先天神（如三清、玉皇大帝等，天地开辟前即存在）与后天仙（凡人修炼得道而成，如八仙）。八仙属于典型',
  'learning',
  ''
);

COMMIT;
