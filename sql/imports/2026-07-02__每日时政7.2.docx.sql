-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.2.docx
-- doc_date: 2026-07-02
-- generated_at: 2026-08-21T08:42:54.218Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.2.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.2.docx',
  '2026-07-02',
  'c460011c5bd7279fffc1b1a139f739d0b556b1d69423a53b6b744a7e7f4ce82f',
  'imported',
  '{"paragraphs":79,"articles":5,"questions":5,"knowledge":6,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  1,
  '中共中央政治局召开会议',
  '中共中央政治局2026年6月30日召开会议，研究部署防汛抗旱工作。中共中央总书记习近平主持会议。会议指出，今年主汛期我国极端天气气候事件仍将偏多、旱涝并重。
会议强调，要始终把人民生命安全放在首位，提高监测预报精准度，及时果断组织人员转移避险，严防出现群死群伤。
会议指出，要坚持资源向基层倾斜、力量向一线下沉，着力提升基层防汛减灾救灾能力。
会议要求，各级领导干部要牢固树立和践行正确政绩观，加强值守、靠前指挥，组织发动群众全力做好防灾减灾救灾各项工作。基层党组织和广大党员干部要充分发挥战斗堡垒作用和先锋模范作用，在防汛抗旱、抢险救灾一线勇挑重担、冲锋在前，有力维护人民群众生命财产安全和社会大局稳定。（时政来源：央视网）',
  '央视网',
  '2026-07-02',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  2,
  '《做焦裕禄式的县委书记》',
  '2026年7月1日出版的第13期《求是》杂志重新发表了中共中央总书记、国家主席、中央军委主席习近平的重要文章《做焦裕禄式的县委书记》。
文章强调，在我们党的组织结构和国家政权结构中，县一级处在承上启下的关键环节，是发展经济、保障民生、维护稳定、促进国家长治久安的重要基础。县委是我们党执政兴国的“一线指挥部”，县委书记就是“一线总指挥”。
文章指出，廉洁自律是共产党人为官从政的底线。
文章指出，要求真务实、真抓实干，做工作自觉从人民利益出发，决不能为了树立个人形象，搞华而不实、劳民伤财的“形象工程”、“政绩工程”。（时政来源：新华网）',
  '新华网',
  '2026-07-02',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  3,
  '在庆祝中国共产党成立105周年大会上的讲话',
  '庆祝中国共产党成立105周年大会2026年7月1日上午在北京人民大会堂隆重举行。
习近平总书记讲话指出，历史和人民之所以选择中国共产党，根本在于我们党具有其他政党和政治力量无可比拟的优秀特质：矢志追求真理，始终把准前进方向；深深植根人民，始终拥有坚实根基；勇担历史使命，始终掌握战略主动；顺应发展潮流，始终走在时代前列；敢于善于斗争，始终保持必胜信心；注重强健自身，始终充满生机活力。
习近平总书记讲话指出，促进香港、澳门长期繁荣稳定，是中华民族伟大复兴的内在要求。解决台湾问题、实现祖国完全统一，是我们党矢志不渝的历史任务，是全体中华儿女的共同愿望。
习近平总书记讲话指出，青年是实现中华民族伟大复兴的生力军。
习近平总书记讲话指出，XIN时代中国青年要坚定不移听党话、跟党走，树立远大志向，勇担时代重任，把个人追求融入党和国家事业。（时政来源：央视网）',
  '央视网',
  '2026-07-02',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  4,
  '“七一勋章”获得者',
  '2026年是中国共产党成立105周年。党中央决定，授予马善祥、王於昌、李连成、吾哈斯·苏来曼、吴亚琴、陈俊武、赵亚夫、钟掘同志“七一勋章”。（时政来源：光明网）',
  '光明网',
  '2026-07-02',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  5,
  '青藏铁路全线开通二十年累计运送旅客突破1亿人次',
  '记者2026年6月30日从中国国家铁路集团有限公司获悉，全线开通运营20年来，青藏铁路累计运送旅客1.04亿人次、货物8.24亿吨，为青藏高原经济社会发展提供了坚实运力支撑。（时政来源：新华网）',
  '新华网',
  '2026-07-02',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  1,
  'document',
  '单选',
  '中共中央政治局2026年6月30日召开会议，研究部署防汛抗旱工作。下列说法错误的是（  ）。',
  '[{"key":"A","text":"各级领导干部要坚持在后端指挥，组织发动群众全力做好防灾减灾救灾各项工作"},{"key":"B","text":"要始终把人民生命安全放在首位"},{"key":"C","text":"坚持资源向基层倾斜、力量向一线下沉"},{"key":"D","text":"今年主汛期我国极端天气气候事件仍将偏多、旱涝并重"}]',
  'A',
  '',
  '原题',
  '2026-07-02'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  2,
  'document',
  '单选',
  '怎样才能当好县委书记？焦裕禄同志为县委书记树立了榜样。做县委书记，就要做焦裕禄式的县委书记。下列说法正确的有几项？（  ）
①在我们党的组织结构和国家政权结构中，县一级处在承上启下的关键环节
②廉洁自律是共产党人为官从政的底线
③县委书记要坚决搞好“政绩工程”
④县委是我们党执政兴国的“一线指挥部”，县委书记就是“一线总指挥”',
  '[{"key":"A","text":"4项"},{"key":"B","text":"3项"},{"key":"C","text":"2项"},{"key":"D","text":"1项"}]',
  'B',
  '',
  '原题',
  '2026-07-02'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  3,
  'document',
  '单选',
  '庆祝中国共产党成立105周年大会2026年7月1日上午在北京人民大会堂隆重举行。习近平总书记发表了重要讲话。根据讲话，下列说法正确的有哪些？（  ）
①勇担历史使命，始终掌握战略主动是我们党的优秀特质
②促进香港、澳门长期繁荣稳定，是中华民族伟大复兴的内在要求
③老一辈党员是实现中华民族伟大复兴的生力军
④XIN时代中国青年要把党和国家事业融入个人追求之中',
  '[{"key":"A","text":"①②③④"},{"key":"B","text":"①②③"},{"key":"C","text":"①④"},{"key":"D","text":"①②"}]',
  'D',
  '',
  '原题',
  '2026-07-02'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  4,
  'document',
  '单选',
  '2026年是中国共产党成立105周年。党中央决定，授予七名同志“七一勋章”，下列哪位不是此次当选的人物？（  ）',
  '[{"key":"A","text":"马善祥"},{"key":"B","text":"吾哈斯·苏来曼"},{"key":"C","text":"张桂梅"},{"key":"D","text":"钟掘"}]',
  'C',
  '',
  '原题',
  '2026-07-02'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  5,
  'document',
  '单选',
  '记者2026年6月30日从中国国家铁路集团有限公司获悉，全线开通运营（  ）年来，青藏铁路累计运送旅客1.04亿人次、货物8.24亿吨，为青藏高原经济社会发展提供了坚实运力支撑。',
  '[{"key":"A","text":"25"},{"key":"B","text":"15"},{"key":"C","text":"10"},{"key":"D","text":"20"}]',
  'D',
  '',
  '原题',
  '2026-07-02'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  1,
  '历史上的今天',
  '1644年马斯顿荒原之战爆发',
  '1644年马斯顿荒原之战爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1644年马斯顿荒原之战爆发|1644年马斯顿荒原之战爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  2,
  '历史上的今天',
  '1901年德国人齐柏林设计的人类第一艘飞艇首航成功',
  '1901年德国人齐柏林设计的人类第一艘飞艇首航成功',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1901年德国人齐柏林设计的人类第一艘飞艇首航成功|1901年德国人齐柏林设计的人类第一艘飞艇首航成功',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  3,
  '历史上的今天',
  '1935年日本制定掠夺华北资源大纲',
  '1935年日本制定掠夺华北资源大纲',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1935年日本制定掠夺华北资源大纲|1935年日本制定掠夺华北资源大纲',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  4,
  '历史上的今天',
  '1936年红二、红四方面军开始北上',
  '1936年红二、红四方面军开始北上',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1936年红二、红四方面军开始北上|1936年红二、红四方面军开始北上',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  5,
  '历史上的今天',
  '1959年庐山会议举行',
  '1959年庐山会议举行',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1959年庐山会议举行|1959年庐山会议举行',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.2.docx'),
  6,
  '常识',
  '束脩之礼',
  '脩字的读音为（xiū），象声字，从肉，本义为干肉、肉脯，也表示教学的酬金、酬劳。束脩之礼，又称“束修之礼”，是古代民间上下级、亲戚、朋友之间相互馈赠的一种礼物。
束脩六礼，是古代送给老师的报酬，即入学拜师时学生送给先生的六种食物，组合成的六礼束脩，寓意着对收礼者的敬意和感激。分别是：
肉干（谢师恩）、
芹菜（业精于勤）、
龙眼干（启窍生智）、
莲子（苦心教学）、
红枣（早日高中）、
红豆（宏图大展）。
老师回礼为龙眼干、芹菜和葱，象征着开窍生智、业精于勤、聪明过人。
束脩的致送，表示学生对教师的尊敬。“束脩六礼”在被赋予学有所成、早日成才等寓意的同时，也表明学生感念师恩、勤奋好学之意。',
  '常识',
  '束脩之礼',
  'common',
  '常识|束脩之礼|束脩之礼|脩字的读音为（xiū），象声字，从肉，本义为干肉、肉脯，也表示教学的酬金、酬劳。束脩之礼，又称“束修之礼”，是古代民间上下级、亲戚、朋友之间相互馈赠的一种礼物。',
  'learning',
  ''
);

COMMIT;
