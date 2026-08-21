-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.17.docx
-- doc_date: 2026-07-17
-- generated_at: 2026-08-21T08:42:54.221Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.17.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.17.docx',
  '2026-07-17',
  'b1bc939039bb86125e62e26dac558dea830490497baafcd8e83f4bfbf4c3b7da',
  'imported',
  '{"paragraphs":88,"articles":5,"questions":5,"knowledge":22,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  1,
  '我国首个水风光一体化智慧运营大模型发布',
  '记者2026年7月16日从国投集团雅砻江公司获悉，我国首个水风光一体化智慧运营大模型在四川雅砻江流域正式发布。（时政来源：央广网）',
  '央广网',
  '2026-07-17',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  2,
  '“天翼领航者”号入列',
  '中国自主设计建造的首艘深海型、智能化海缆施工船——“天翼领航者”号2026年7月15日在上海正式入列并开展全系统海缆施工试验，为算力和人工智能发展奠定了坚实的基础。（时政来源：央视网）',
  '央视网',
  '2026-07-17',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  3,
  '2026年中国文明乡风大会在临沂举行',
  '以“文明让乡村更美好”为主题的2026年中国文明乡风大会7月16日在山东临沂举行。与会代表认为，培育文明乡风是一项事关乡村全面振兴、社会全面进步和人的全面发展的重要工作，是新时代新征程农村精神文明建设的重要目标任务。要深入贯彻落实习近平总书记关于“三农”工作、精神文明建设的重要论述和重要指示批示精神，大力推进文明乡风建设工程，培育文明乡风、良好家风、淳朴民风。（时政来源：新华网）',
  '新华网',
  '2026-07-17',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  4,
  '我国首个全链条绿色低碳乙烯工程在新疆库尔勒投产',
  '2026年7月16日，中国石油独山子石化公司塔里木120万吨/年二期乙烯及配套绿色低碳示范工程正式投产，成为我国建成投产的首个全链条绿色低碳乙烯工程，每年可减少碳排放137万吨。（时政来源：新华网）',
  '新华网',
  '2026-07-17',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  5,
  '多部门采取行动保护治理群众身边水环境',
  '国务院办公厅近日转发生态环境部等部门《群众身边水体保护治理行动方案》。方案提出，到2030年，基本完成省级及以上工业园区水污染排查整治任务，基本消除县乡黑臭水体，基本控制重点区域畜禽养殖污染对水体的直接影响，群众身边水体基本实现无异色、无异味、无异物，推动水生态环境全面改善。（时政来源：新华网）',
  '新华网',
  '2026-07-17',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  1,
  'document',
  '单选',
  '记者2026年7月16日从国投集团雅砻江公司获悉，我国首个水风光一体化智慧运营大模型在（  ）正式发布。',
  '[{"key":"A","text":"四川雅砻江流域"},{"key":"B","text":"云南金沙江流域"},{"key":"C","text":"青海黄河上游"},{"key":"D","text":"甘肃河西走廊"}]',
  'A',
  '',
  '原题',
  '2026-07-17'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  2,
  'document',
  '单选',
  '中国自主设计建造的首艘深海型、智能化海缆施工船——（  ）2026年7月15日在上海正式入列并开展全系统海缆施工试验，为算力和人工智能发展奠定了坚实的基础。',
  '[{"key":"A","text":"“海洋电力01”号"},{"key":"B","text":"“天翼领航者”号"},{"key":"C","text":"“深海拓路者”号"},{"key":"D","text":"“海峰7001”号"}]',
  'B',
  '',
  '原题',
  '2026-07-17'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  3,
  'document',
  '单选',
  '以“文明让乡村更美好”为主题的2026年中国文明乡风大会7月16日在山东临沂举行。与会代表认为，要深入贯彻落实习近平总书记关于“三农”工作、精神文明建设的重要论述和重要指示批示精神，大力推进文明乡风建设工程，培育（  ）。',
  '[{"key":"A","text":"时代新风、家庭美德、社会正气"},{"key":"B","text":"文明乡风、良好家风、淳朴民风"},{"key":"C","text":"优良党风、和谐家风、乡土民风"},{"key":"D","text":"和美乡村、优良家风、文明新风"}]',
  'B',
  '',
  '原题',
  '2026-07-17'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  4,
  'document',
  '单选',
  '2026年7月16日，中国石油独山子石化公司塔里木120万吨/年二期（  ）及配套绿色低碳示范工程正式投产，成为我国建成投产的首个全链条绿色低碳（  ）工程，每年可减少碳排放137万吨。',
  '[{"key":"A","text":"丙烯"},{"key":"B","text":"乙烯"},{"key":"C","text":"聚丙烯"},{"key":"D","text":"聚乙烯"}]',
  'B',
  '',
  '原题',
  '2026-07-17'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  5,
  'document',
  '单选',
  '国务院办公厅近日转发生态环境部等部门《群众身边水体保护治理行动方案》。方案提出，到2030年，基本完成（  ）及以上工业园区水污染排查整治任务，基本消除县乡黑臭水体，基本控制重点区域畜禽养殖污染对水体的直接影响，群众身边水体基本实现无异色、无异味、无异物，推动水生态环境全面改善。',
  '[{"key":"A","text":"乡级"},{"key":"B","text":"县级"},{"key":"C","text":"市级"},{"key":"D","text":"省级"}]',
  'D',
  '',
  '原题',
  '2026-07-17'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  1,
  '历史上的今天',
  '1928年共产国际六大召开',
  '1928年共产国际六大召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1928年共产国际六大召开|1928年共产国际六大召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  2,
  '历史上的今天',
  '1942年斯大林格勒大会战',
  '1942年斯大林格勒大会战',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1942年斯大林格勒大会战|1942年斯大林格勒大会战',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  3,
  '历史上的今天',
  '1945年波茨坦会议召开',
  '1945年波茨坦会议召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年波茨坦会议召开|1945年波茨坦会议召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  4,
  '历史上的今天',
  '1947年中共中央召开全国土地会议',
  '1947年中共中央召开全国土地会议',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1947年中共中央召开全国土地会议|1947年中共中央召开全国土地会议',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  5,
  '历史上的今天',
  '1976年第21届奥运会在蒙特利尔举行',
  '1976年第21届奥运会在蒙特利尔举行',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1976年第21届奥运会在蒙特利尔举行|1976年第21届奥运会在蒙特利尔举行',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  6,
  '颁奖辞',
  '在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。',
  '颁奖辞：在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。
核心事迹：潜伏台湾的无名英雄群体，1949年前后渡海潜伏，建立多条情报线；后因台湾戒严大批被捕牺牲；国家自上世纪50年代起持续追授烈士、安置遗属。
关键词：隐蔽战线、台湾潜伏、无名英雄、祖国统一',
  '颁奖辞',
  '在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。',
  'award',
  '颁奖辞|在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。|在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。|颁奖辞：在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  7,
  '颁奖辞',
  '赵兴松、谢红兰（爱心传递夫妻）',
  '赵兴松、谢红兰（爱心传递夫妻）',
  '颁奖辞',
  '在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。',
  'award',
  '颁奖辞|在敌人的心脏里，心跳如常。在黎明前的黑暗中，擦亮火光。为统一而战的勇士，为民族而殇的忠魂，让山河回家的电码，让亲人心碎的家书，穿越风雨不朽，跨越海峡长存。你们的名字，宝岛的风记得，西山的雨记得。|赵兴松、谢红兰（爱心传递夫妻）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  8,
  '颁奖辞',
  '失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。',
  '颁奖辞：失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。
核心事迹：江苏高邮普通打工者，儿子赵恺患骨癌获社会捐助40万，病逝后捐眼角膜和遗体；夫妻俩打多份工六年还完“爱心债”，将40万全捐出回馈社会。
关键词：爱心传递、打工还债、40万善款、知恩图报',
  '颁奖辞',
  '失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。',
  'award',
  '颁奖辞|失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。|失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。|颁奖辞：失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  9,
  '颁奖辞',
  '张军桥（援坦医疗烈士）',
  '张军桥（援坦医疗烈士）',
  '颁奖辞',
  '失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。',
  'award',
  '颁奖辞|失去了最爱，仍然坚守爱；得到过温暖，现在燃烧自己、传递温暖捐的每一分钱都让人心疼，流的每一滴汗都让人敬佩。清贫、辛劳、执着，你们用微光为我们导航被爱环抱的孩子，被爱激荡的父母。|张军桥（援坦医疗烈士）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  10,
  '颁奖辞',
  '世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。',
  '颁奖辞：世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。
核心事迹：援坦医疗烈士，援坦一年半诊治8000余人，填补当地医疗技术空白；2025年6月海边救人时将救生衣让给落水者，体力不支牺牲，年仅38岁。
关键词：援外医生、坦桑尼亚、救人牺牲、国际人道主义',
  '颁奖辞',
  '世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。',
  'award',
  '颁奖辞|世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。|世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。|颁奖辞：世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  11,
  '颁奖辞',
  '张超凡（自强不息公益人）',
  '张超凡（自强不息公益人）',
  '颁奖辞',
  '世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。',
  'award',
  '颁奖辞|世人皆知你奔赴山海，未曾料到你舍身赴险。家人眺望你的归路，你把它换成别人的生路。离祖国很远，离伟大很近，你审视生命的目光已超越国界。你的身体沉入碧蓝海水中，你的名字，化作桥梁，联通万里。|张超凡（自强不息公益人）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  12,
  '颁奖辞',
  '不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。',
  '颁奖辞：不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。
核心事迹：天生左臂缺失的公益创业者，自强不息练速滑拿全省冠军；放弃保研返乡创办“超凡公益梦想课堂”，十几年资助540余名特困残障青少年。
关键词：身残志坚、公益教育、540名青少年、逐梦前行',
  '颁奖辞',
  '不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。',
  'award',
  '颁奖辞|不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。|不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。|颁奖辞：不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  13,
  '颁奖辞',
  '胡建（深海打捞专家）',
  '胡建（深海打捞专家）',
  '颁奖辞',
  '不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。',
  'award',
  '颁奖辞|不想被同情，更愿与世界共情。你的画布不比谁少一分色彩，冲刺的冰刀从不相信失败。一出生你的翅膀就遗落在天上，现在你正在成就别人起飞的梦想。真正的强者不必有惊世壮举，只需要一次次超越平凡。|胡建（深海打捞专家）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  14,
  '颁奖辞',
  '连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。',
  '颁奖辞：连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。
核心事迹：饱和潜水专家、深海打捞工程师，突破313.5米深海“生命禁区”；从业26年参与“世越号”“东方之星”“长江口二号”等百余次重大救捞任务。
关键词：饱和潜水、313.5米、深海打捞、应急救援',
  '颁奖辞',
  '连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。',
  'award',
  '颁奖辞|连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。|连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。|颁奖辞：连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  15,
  '颁奖辞',
  '公安部打击缅北涉我犯罪专项工作组（反诈英雄集体）',
  '公安部打击缅北涉我犯罪专项工作组（反诈英雄集体）',
  '颁奖辞',
  '连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。',
  'award',
  '颁奖辞|连接生与死，过去与未来。下潜不是为了抵达，是托起人间最沉的牵挂；出征不是为了征服，用你的极限给予生命尊严。逆行出征，向险而行，你就是射进深海中的光，把希望一寸寸打捞回人间。|公安部打击缅北涉我犯罪专项工作组（反诈英雄集体）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  16,
  '颁奖辞',
  '穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。',
  '颁奖辞：穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。
核心事迹：2023年7月成立，重拳打击缅北电诈；彻查“10・20”惨案，打掉果敢“四大家族”；截至2026年6月累计押回5.8万名涉诈嫌疑人，电诈园区基本清零。
关键词：缅北反诈、四大家族、5.8万人、虽远必诛',
  '颁奖辞',
  '穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。',
  'award',
  '颁奖辞|穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。|穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。|颁奖辞：穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  17,
  '颁奖辞',
  '刘名芳（基层村干部）',
  '刘名芳（基层村干部）',
  '颁奖辞',
  '穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。',
  'award',
  '颁奖辞|穿过硝烟，在数据中较量；不必奖杯，人民安全就是丰碑。犯我中华，虽远必诛。有心理的博弈，更有刑侦的较力；是科技的助力，更是国家的实力。用出鞘的利剑，斩断一切黑手；用金色的盾牌，守候万家灯火。|刘名芳（基层村干部）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  18,
  '颁奖辞',
  '最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。',
  '颁奖辞：最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。
核心事迹：广东信宜中和村村干部，2025年6月台风暴雨夜巡查发现险情，连夜组织转移；25户57名群众全部安全撤离，一小时后泥石流冲毁房屋，零伤亡。
关键词：基层干部、雨夜巡查、提前转移、零伤亡',
  '颁奖辞',
  '最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。',
  'award',
  '颁奖辞|最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。|最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。|颁奖辞：最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  19,
  '颁奖辞',
  '龙进品（基层法官）',
  '龙进品（基层法官）',
  '颁奖辞',
  '最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。',
  'award',
  '颁奖辞|最熟悉大山的脾气，更知道滑坡的威力。宁破十扇门，不弃一村民，所谓安心，就是因为有你这样的人。在灾难来临前，多看了两三眼，多想了七八遍，离不开脚下的土，放不下肩上的担。|龙进品（基层法官）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  20,
  '颁奖辞',
  '火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。',
  '颁奖辞：火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。
主要事迹：云南公郎法庭基层法官，扎根无量山区33年，背着国徽巡回办案；坚持“能调尽调”，用真心化解矛盾，是大理州调解率最高的法官之一。
关键词：巡回法庭、33年扎根、泥腿子法官、调解优先',
  '颁奖辞',
  '火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。',
  'award',
  '颁奖辞|火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。|火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。|颁奖辞：火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  21,
  '颁奖辞',
  '梁建英（高铁总设计师）',
  '梁建英（高铁总设计师）',
  '颁奖辞',
  '火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。',
  'award',
  '颁奖辞|火塘暖，山泉清，向深处走，蹲下来听，会唱他们的山歌，才懂他们的心声。真正的法治，不在高堂之上，而在人心归处。脚步所到，为乡亲们打一把伞，背起国徽，就撑开山里的一片天。|梁建英（高铁总设计师）|',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.17.docx'),
  22,
  '颁奖辞',
  '既然巨人的肩膀不好站，我们就成为巨人。用匠心守初心，以志气助国气，科创逐梦，不惧艰辛，轻轨追风，不负韶华。你在自己的轨道上坚守，成就惊艳的中国速度，三十砥砺寒与暑，八万里路云和月。',
  '颁奖辞：既然巨人的肩膀不好站，我们就成为巨人。用匠心守初心，以志气助国气，科创逐梦，不惧艰辛，轻轨追风，不负韶华。你在自己的轨道上坚守，成就惊艳的中国速度，三十砥砺寒与暑，八万里路云和月。
主要事迹：高铁总设计师，主持研发CRH380A（时速486.1公里创纪录）、“复兴号”动车组（350公里商业运营世界最快）、时速600公里高速磁浮列车。
关键词：复兴号、486.1公里、中国速度、自主研发',
  '颁奖辞',
  '既然巨人的肩膀不好站，我们就成为巨人。用匠心守初心，以志气助国气，科创逐梦，不惧艰辛，轻轨追风，不负韶华。你在自己的轨道上坚守，成就惊艳的中国速度，三十砥砺寒与暑，八万里路云和月。',
  'award',
  '颁奖辞|既然巨人的肩膀不好站，我们就成为巨人。用匠心守初心，以志气助国气，科创逐梦，不惧艰辛，轻轨追风，不负韶华。你在自己的轨道上坚守，成就惊艳的中国速度，三十砥砺寒与暑，八万里路云和月。|既然巨人的肩膀不好站，我们就成为巨人。用匠心守初心，以志气助国气，科创逐梦，不惧艰辛，轻轨追风，不负韶华。你在自己的轨道上坚守，成就惊艳的中国速度，三十砥砺寒与暑，八万里路云和月。|颁奖辞：既然巨人的肩膀不好站，我们就成为巨人。用匠心守初心，以志气助国气，科创逐梦，不惧艰辛，轻轨追风，不负韶华。你在自己的轨道上坚守，成就惊艳的中国速度，三十',
  'learning',
  ''
);

COMMIT;
