-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.13.docx
-- doc_date: 2026-08-13
-- generated_at: 2026-08-21T08:42:54.227Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.13.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.13.docx',
  '2026-08-13',
  '01a16a59688181af97ae7227a339df45a3102094333b3be0de18821f85eebcb7',
  'imported',
  '{"paragraphs":65,"articles":5,"questions":5,"knowledge":9,"warnings":[]}',
  '模型没有返回内容。',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  1,
  '《生态保护“十五五”规划》印发',
  '生态环境部、自然资源部等部门日前联合印发《生态保护“十五五”规划》，推进山水林田湖草沙一体化保护和系统治理，构建从山顶到海洋的保护治理大格局。
规划提出，持续优化生态空间格局。持续巩固以“三区四带”为骨架的国家生态安全屏障体系，构筑“三北”工程区绿色屏障。建立健全国土空间规划动态维护机制，优化生态保护红线范围。全面推进以国家公园为主体、自然保护区为基础、各类自然公园为补充的自然保护地体系建设。统筹考虑区域生态结构完整性、生态功能重要性，优化生态保护与修复监管重点区域，并根据生态状况调查评估结果、人为活动影响情况等动态调整。（时政来源：央视网）',
  '央视网',
  '2026-08-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  2,
  '平陆运河实船试验正式启动',
  '2026年8月12日上午，随着一艘5000吨级空载试验船缓缓从平陆运河新福水上综合服务区驶出，平陆运河实船试验正式启动。
平陆运河是西部陆海新通道骨干工程、新中国成立以来第一条国家层面统筹的通江达海运河工程，开辟了西江至北部湾的江海直连通道。（时政来源：新华网）',
  '新华网',
  '2026-08-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  3,
  'C919首条国际航线将开通',
  '由C919执飞的国航CA723航班于2026年8月12日15时许从北京首都国际机场起飞，前往蒙古国首都乌兰巴托，这是C919首次执飞国际商业航班。（时政来源：新华网）',
  '新华网',
  '2026-08-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  4,
  '武大靖出任中国短道速滑队主教练',
  '2026年8月12日，国家体育总局冬季运动管理中心宣布，经公开选聘，冬奥冠军武大靖出任中国短道速滑队主教练。（时政来源：央视网）',
  '央视网',
  '2026-08-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  5,
  '云南临沧发现距今约4220年史前岩画',
  '2026年8月12日，记者从云南省文物考古研究所获悉，该研究所联合南京师范大学等单位组成的研究团队，对云南省临沧市耿马傣族佤族自治县芒关岩画遗址的系统考古调查与高精度铀系测年取得突破性进展。
研究团队首次为芒关岩画提供了绝对年代数据，并发现该岩画早于著名的沧源岩画（年代距今约3800—2700年），将中国西南地区史前定居人群岩画的历史推前至距今约4220年。（时政来源：央视网）',
  '央视网',
  '2026-08-13',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  1,
  'document',
  '单选',
  '生态环境部、自然资源部等部门日前联合印发《生态保护“十五五”规划》。根据规划，下列说法错误的是（  ）。',
  '[{"key":"A","text":"统筹考虑区域生态结构完整性、生态功能重要性，优化生态保护与修复监管重点区域"},{"key":"B","text":"持续巩固以“三区四带”为骨架的国家生态安全屏障体系"},{"key":"C","text":"扩大生态保护红线范围"},{"key":"D","text":"全面推进以国家公园为主体、自然保护区为基础、各类自然公园为补充的自然保护地体系建设"}]',
  'C',
  '',
  '原题',
  '2026-08-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  2,
  'document',
  '单选',
  '2026年8月12日上午，随着一艘5000吨级空载试验船缓缓从（  ）新福水上综合服务区驶出，（  ）实船试验正式启动。',
  '[{"key":"A","text":"京杭大运河"},{"key":"B","text":"平陆运河"},{"key":"C","text":"赣粤运河"},{"key":"D","text":"湘桂运河"}]',
  'B',
  '',
  '原题',
  '2026-08-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  3,
  'document',
  '单选',
  '由C919执飞的国航CA723航班于2026年8月12日15时许从北京首都国际机场起飞，前往（  ），这是C919首次执飞国际商业航班。',
  '[{"key":"A","text":"蒙古国首都乌兰巴托"},{"key":"B","text":"泰国首都曼谷"},{"key":"C","text":"越南首都河内"},{"key":"D","text":"韩国首都首尔"}]',
  'A',
  '',
  '原题',
  '2026-08-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  4,
  'document',
  '单选',
  '2026年8月12日，国家体育总局冬季运动管理中心宣布，经公开选聘，冬奥冠军（  ）出任中国短道速滑队主教练。',
  '[{"key":"A","text":"王濛"},{"key":"B","text":"周洋"},{"key":"C","text":"武大靖"},{"key":"D","text":"任子威"}]',
  'C',
  '',
  '原题',
  '2026-08-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  5,
  'document',
  '单选',
  '2026年8月12日，记者从云南省文物考古研究所获悉，该研究所联合南京师范大学等单位组成的研究团队，对云南省临沧市耿马傣族佤族自治县芒关岩画遗址的系统考古调查与高精度铀系测年取得突破性进展。研究团队首次为芒关岩画提供了绝对年代数据，将中国西南地区史前定居人群岩画的历史推前至距今约（  ）年。',
  '[{"key":"A","text":"3800"},{"key":"B","text":"5900"},{"key":"C","text":"6140"},{"key":"D","text":"4220"}]',
  'D',
  '',
  '原题',
  '2026-08-13'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  1,
  '历史上的今天',
  '1905年挪威成为独立国家',
  '1905年挪威成为独立国家',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1905年挪威成为独立国家|1905年挪威成为独立国家',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  2,
  '历史上的今天',
  '1912年法国医生发现癌细胞',
  '1912年法国医生发现癌细胞',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1912年法国医生发现癌细胞|1912年法国医生发现癌细胞',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  3,
  '历史上的今天',
  '1927年蒋介石第一次下野',
  '1927年蒋介石第一次下野',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1927年蒋介石第一次下野|1927年蒋介石第一次下野',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  4,
  '历史上的今天',
  '1937年日军进攻上海，“八·一三”事变爆发',
  '1937年日军进攻上海，“八·一三”事变爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1937年日军进攻上海，“八·一三”事变爆发|1937年日军进攻上海，“八·一三”事变爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  5,
  '历史上的今天',
  '1961年东德开始建造柏林墙                          …',
  '1961年东德开始建造柏林墙                                         ——8月13日',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1961年东德开始建造柏林墙                          …|1961年东德开始建造柏林墙                                         ——8月13日',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  6,
  '常识',
  '电影简介',
  '【时政联想】2026年8月10日，第38届大众电影百花奖揭晓，易烊千玺、卫诗雅分获最佳男、女主角，《哪吒之魔童闹海》获最佳影片。
大众电影百花奖、中国电影金鸡奖、中国电影华表奖并称中国电影的三大奖。',
  '常识',
  '中国电影三大奖',
  'common',
  '常识|中国电影三大奖|电影简介|【时政联想】2026年8月10日，第38届大众电影百花奖揭晓，易烊千玺、卫诗雅分获最佳男、女主角，《哪吒之魔童闹海》获最佳影片。
大众电影百花奖、中国电影金鸡奖',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  7,
  '常识',
  '百花奖',
  '百花奖创办于1962年，每两年举办一届，主要反映了广大观众对电影的评价和喜好，因而被称为“群众奖”“观众奖”。
百花奖之所以用“百花”命名是为了体现“百花齐放、百家争鸣”的文艺方针。',
  '常识',
  '中国电影三大奖',
  'common',
  '常识|中国电影三大奖|百花奖|百花奖创办于1962年，每两年举办一届，主要反映了广大观众对电影的评价和喜好，因而被称为“群众奖”“观众奖”。
百花奖之所以用“百花”命名是为了体现“百花齐放、',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  8,
  '常识',
  '金鸡奖',
  '金鸡奖创办于1981年，每年举办一届，由电影界的专家组成评奖委员会，并由专家实名制投票产生奖项，因而被称为“专家奖”。
金鸡奖评奖创始于中国农历鸡年（1981年），故定名为中国电影金鸡奖，以金鸡啼晓激励电影工作者为中国社会主义电影事业的兴旺发达而奋发努力。',
  '常识',
  '中国电影三大奖',
  'common',
  '常识|中国电影三大奖|金鸡奖|金鸡奖创办于1981年，每年举办一届，由电影界的专家组成评奖委员会，并由专家实名制投票产生奖项，因而被称为“专家奖”。
金鸡奖评奖创始于中国农历鸡年（1981年',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.13.docx'),
  9,
  '常识',
  '华表奖',
  '华表奖设立于1995年，每两年举办一届，由政府出资奖励优秀的电影工作者，是中国电影界的政府奖。
华表奖前身是中国文化部优秀影片奖，始评于1957年，1995年文化部将优秀影片奖文汇奖等奖项正式改革合并后为华表奖。
【大白话总结】百观金专华表政，电影三大要记清。',
  '常识',
  '中国电影三大奖',
  'common',
  '常识|中国电影三大奖|华表奖|华表奖设立于1995年，每两年举办一届，由政府出资奖励优秀的电影工作者，是中国电影界的政府奖。
华表奖前身是中国文化部优秀影片奖，始评于1957年，1995年文',
  'learning',
  ''
);

COMMIT;
