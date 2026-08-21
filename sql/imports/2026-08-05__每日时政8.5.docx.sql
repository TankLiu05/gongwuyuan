-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.5.docx
-- doc_date: 2026-08-05
-- generated_at: 2026-08-21T08:42:54.225Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.5.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.5.docx',
  '2026-08-05',
  '037221d7931cb8fc3f223d21440b8d60b36829f744b8721040fb01c54b358217',
  'imported',
  '{"paragraphs":84,"articles":5,"questions":5,"knowledge":11,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  1,
  '更可靠、更智能灵活‌的新型电力供给格局正在形成',
  '《新型电力系统建设“十五五”规划》2026年8月3日发布。规划提出，到2030年，我国将基本形成绿色低碳的电力供给格局，为经济社会发展提供坚实能源保障。
“十五五”期间，我国将持续提升非化石能源电力支撑水平，同时，充分发挥省间电力互济、虚拟电厂等作用，夯实煤电、气电等传统电源兜底保障基础，在保障能源安全前提下稳妥推进绿色低碳发展。（时政来源：央视网）',
  '央视网',
  '2026-08-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  2,
  '我国地质灾害防治迈入新阶段',
  '自然资源部2026年8月4日介绍，《全国地质灾害防治“十五五”实施方案》近日发布。“十五五”期间，我国地质灾害防治工作将以“提升气候变化应对能力、减轻地质灾害风险”为主线，在全国划分21个地质灾害重点防治区，进一步扩大管控范围，推动地质灾害防治工作向精细化、智能化迈进，最大限度减少人员伤亡和财产损失。（时政来源：央视网）',
  '央视网',
  '2026-08-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  3,
  '加快建设统一开放的交通运输市场',
  '近日，交通运输部等四部门联合印发《交通运输纵深推进全国统一大市场建设实施方案》，旨在解决基础设施联通不足、运输服务融合不够、制度规则标准不一、资源要素共享不够等突出问题，为纵深推进全国统一大市场建设提供有力交通运输服务保障。（时政来源：人民网）',
  '人民网',
  '2026-08-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  4,
  '第20届亚运会中国体育代表团领奖装备发布',
  '8月3日，中国奥委会在北京国家奥林匹克体育中心正式发布2026年第20届亚运会中国体育代表团领奖装备。
2026年亚运会中国体育代表团领奖装备以“熠熠星辉”为核心设计理念，充分展现中国体育代表团朝气蓬勃、阳光时尚、拼搏向上的精神风貌。领奖服主色为品月蓝，取自苍穹深海，尽显大国沉稳气度与未来科技感。（时政来源：央广网）',
  '央广网',
  '2026-08-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  5,
  '中国科学家首获威廉·诺德伯格奖章',
  '当地时间2026年8月3日，在意大利佛罗伦萨举办的第46届国际空间研究委员会（COSPAR）科学大会上，中国气象局王劲松研究员荣获威廉·诺德伯格奖章。
自1988年奖章设立以来，王劲松是首位获此殊荣的中国科学家，并同步获得一颗小行星命名。（时政来源：央广网）',
  '央广网',
  '2026-08-05',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  1,
  'document',
  '单选',
  '《新型电力系统建设“十五五”规划》2026年8月3日发布。“十五五”期间，我国将持续提升（  ）支撑水平，夯实（  ）兜底保障基础，在保障能源安全前提下稳妥推进绿色低碳发展。',
  '[{"key":"A","text":"煤电；火电"},{"key":"B","text":"光电；水电"},{"key":"C","text":"传统电源；非化石能源电力"},{"key":"D","text":"非化石能源电力；传统电源"}]',
  'D',
  '',
  '原题',
  '2026-08-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  2,
  'document',
  '单选',
  '自然资源部2026年8月4日介绍，《全国地质灾害防治“十五五”实施方案》近日发布。“十五五”期间，我国地质灾害防治工作将以（  ）为主线，在全国划分（  ）个地质灾害重点防治区',
  '[{"key":"A","text":"“提升气候变化应对能力、减少地质灾害类别”；"},{"key":"B","text":"“提升气候变化应对能力、减少地质灾害类别”；"},{"key":"C","text":"“提升气候变化应对能力、减轻地质灾害风险”；"},{"key":"D","text":"“提升气候变化应对能力、减轻地质灾害风险”；"}]',
  'C',
  '',
  '原题',
  '2026-08-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  3,
  'document',
  '单选',
  '近日，交通运输部等四部门联合印发《交通运输纵深推进全国统一大市场建设实施方案》，旨在解决（  ）等突出问题，为纵深推进全国统一大市场建设提供有力交通运输服务保障。
①资源要素共享不够
②制度规则标准不一
③运输服务融合不够
④基础设施联通不足',
  '[{"key":"A","text":"①②③④"},{"key":"B","text":"仅①②③"},{"key":"C","text":"仅①③④"},{"key":"D","text":"仅②③④"}]',
  'A',
  '',
  '原题',
  '2026-08-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  4,
  'document',
  '单选',
  '8月3日，中国奥委会在北京国家奥林匹克体育中心正式发布2026年第20届亚运会中国体育代表团领奖装备。2026年亚运会中国体育代表团领奖装备以（  ）为核心设计理念，充分展现中国体育代表团朝气蓬勃、阳光时尚、拼搏向上的精神风貌。',
  '[{"key":"A","text":"“星耀东方”"},{"key":"B","text":"“龙腾华夏”"},{"key":"C","text":"“熠熠星辉”"},{"key":"D","text":"“锦绣山河”"}]',
  'C',
  '',
  '原题',
  '2026-08-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  5,
  'document',
  '单选',
  '当地时间2026年8月3日，在意大利佛罗伦萨举办的第46届国际空间研究委员会（COSPAR）科学大会上，中国气象局（  ）研究员荣获威廉·诺德伯格奖章，是首位获此殊荣的中国科学家。',
  '[{"key":"A","text":"欧阳自远"},{"key":"B","text":"张桂华"},{"key":"C","text":"孙家栋"},{"key":"D","text":"王劲松"}]',
  'D',
  '',
  '原题',
  '2026-08-05'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  1,
  '历史上的今天',
  '1864年美国南北战争中的莫比尔港海战爆发',
  '1864年美国南北战争中的莫比尔港海战爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1864年美国南北战争中的莫比尔港海战爆发|1864年美国南北战争中的莫比尔港海战爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  2,
  '历史上的今天',
  '1919年山东济南镇守使马良制造“济南血案”',
  '1919年山东济南镇守使马良制造“济南血案”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1919年山东济南镇守使马良制造“济南血案”|1919年山东济南镇守使马良制造“济南血案”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  3,
  '历史上的今天',
  '1919年土耳其民族主义运动爆发',
  '1919年土耳其民族主义运动爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1919年土耳其民族主义运动爆发|1919年土耳其民族主义运动爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  4,
  '历史上的今天',
  '1948年国民党与美国签订《美国与中国的关系》“白皮书”',
  '1948年国民党与美国签订《美国与中国的关系》“白皮书”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1948年国民党与美国签订《美国与中国的关系》“白皮书”|1948年国民党与美国签订《美国与中国的关系》“白皮书”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  5,
  '历史上的今天',
  '1966年毛泽东发表《炮打司令部——我的一张大字报》',
  '1966年毛泽东发表《炮打司令部——我的一张大字报》',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1966年毛泽东发表《炮打司令部——我的一张大字报》|1966年毛泽东发表《炮打司令部——我的一张大字报》',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  6,
  '常识',
  '根据式',
  '标志词：根据、遵照、按照、依据
特点：开头就说清楚发文的依据，增强权威性。通常引用法律法规、上级文件、会议精神等。
例：“根据《中华人民共和国数据安全法》及上级有关规定，现就加强我市政务数据安全管理通知如下。”',
  '常识',
  '公文写作的6种开头形式',
  'common',
  '常识|公文写作的6种开头形式|根据式|标志词：根据、遵照、按照、依据
特点：开头就说清楚发文的依据，增强权威性。通常引用法律法规、上级文件、会议精神等。
例：“根据《中华人民共和国数据安全法》及上级',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  7,
  '常识',
  '目的式',
  '标志词：为、为了
特点：开头直接点明发文目的，让读者一眼知道要干什么。
例：“为深入推进‘放管服’改革，进一步优化营商环境，特制定本实施方案。”',
  '常识',
  '公文写作的6种开头形式',
  'common',
  '常识|公文写作的6种开头形式|目的式|标志词：为、为了
特点：开头直接点明发文目的，让读者一眼知道要干什么。
例：“为深入推进‘放管服’改革，进一步优化营商环境，特制定本实施方案。”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  8,
  '常识',
  '原因式',
  '标志词：由于、鉴于、随着、近年来
特点：先讲背景和原因，说明为什么要发这个文，体现必要性。
例：“鉴于近期多地发生安全生产事故，为切实防范化解重大安全风险，现就开展安全隐患排查工作通知如下。”',
  '常识',
  '公文写作的6种开头形式',
  'common',
  '常识|公文写作的6种开头形式|原因式|标志词：由于、鉴于、随着、近年来
特点：先讲背景和原因，说明为什么要发这个文，体现必要性。
例：“鉴于近期多地发生安全生产事故，为切实防范化解重大安全风险，现就',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  9,
  '常识',
  '引文式',
  '标志词：现将、转发、贯彻落实
特点：开头直接引用上级文件名称或领导批示，常用于转发、印发类公文。
例：“现将《2026年全国政务公开工作要点》转发给你们，请结合实际认真贯彻执行。”',
  '常识',
  '公文写作的6种开头形式',
  'common',
  '常识|公文写作的6种开头形式|引文式|标志词：现将、转发、贯彻落实
特点：开头直接引用上级文件名称或领导批示，常用于转发、印发类公文。
例：“现将《2026年全国政务公开工作要点》转发给你们，请结合',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  10,
  '常识',
  '时间式',
  '标志词：近日、近来、XX以来、XX之后
特点：以时间为切入点，交代事件发生的时间背景。
例：“2026年第二季度以来，我市连续出现强降雨天气，部分地区发生洪涝灾害……”',
  '常识',
  '公文写作的6种开头形式',
  'common',
  '常识|公文写作的6种开头形式|时间式|标志词：近日、近来、XX以来、XX之后
特点：以时间为切入点，交代事件发生的时间背景。
例：“2026年第二季度以来，我市连续出现强降雨天气，部分地区发生洪涝灾',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.5.docx'),
  11,
  '常识',
  '事情式',
  '特点：开篇直接交代基本情况或事件，给人清晰印象，常用于情况报告、请示等。
例：“我市政务服务中心自2026年3月运行以来，累计办理各类事项12万件，总体运行平稳，但也存在部分窗口人员不足等问题……"
【一句话记住】
有“根据”找依据，有“为了”看目的，有“现将”是引文，有时间看时间，讲原因用“由于”，摆情况是事情。',
  '常识',
  '公文写作的6种开头形式',
  'common',
  '常识|公文写作的6种开头形式|事情式|特点：开篇直接交代基本情况或事件，给人清晰印象，常用于情况报告、请示等。
例：“我市政务服务中心自2026年3月运行以来，累计办理各类事项12万件，总体运行平稳',
  'learning',
  ''
);

COMMIT;
