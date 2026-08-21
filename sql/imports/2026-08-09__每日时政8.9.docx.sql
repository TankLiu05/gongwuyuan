-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.9.docx
-- doc_date: 2026-08-09
-- generated_at: 2026-08-21T08:42:54.226Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.9.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.9.docx',
  '2026-08-09',
  'c73a3475e6019687e19a68df8f7c1dfa2cf1058852cda41ae26f7b5a168b7134',
  'imported',
  '{"paragraphs":79,"articles":5,"questions":5,"knowledge":18,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  1,
  '“科学”号完成西太平洋科考归港青岛',
  '2026年8月7日，“科学”号科考船缓缓靠泊中国科学院海洋研究所西海岸码头基地，为期35天、航程5845海里的2026年西太平洋科学考察共享航次顺利收官。
航次期间，科考队完成“琅琊”潜浮标组网，搭建起深海立体观测体系；成功捕捉三次台风过境期间海气协同演变全过程，获取关键实测参数；针对正在演变的超强厄尔尼诺现象，采集大批量海水样品开展深入研究。（时政来源：新华网）',
  '新华网',
  '2026-08-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  2,
  '《民用航空发展“十五五”规划》发布',
  '中国民航局2026年8月7日对外发布《民用航空发展“十五五”规划》。规划提出，“十五五”时期，民航行业将坚持智能化、绿色化、融合化方向，以安全发展为底线，以提质增效为主线，以改革创新为根本动力，确保推动民航实现质的有效提升和量的合理增长，确保安全、便捷、高效、绿色、经济的现代化民航体系建设取得决定性进展。（时政来源：新华网）',
  '新华网',
  '2026-08-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  3,
  '南水北调中线工程调水突破800亿立方米',
  '截至2026年8月7日，南水北调中线工程累计向北方调水突破800亿立方米，惠及河南、河北、天津、北京近1.18亿人，为沿线27座大中城市243个县（市、区）经济社会发展提供有力的水资源支撑。（时政来源：新华网）',
  '新华网',
  '2026-08-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  4,
  '工业和信息化部新增配置P频段资源助力应对极端天气',
  '记者2026年8月7日获悉，为应对当前极端天气频发、重发情况，工业和信息化部日前为气象部门新增配置P频段无线电频率资源，用于北斗卫星导航气象探空系统技术试验，提升我国应对极端天气能力。（时政来源：新华网）',
  '新华网',
  '2026-08-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  5,
  '我国学者发现银河系外围气体盘呈现波纹状褶皱结构',
  '记者从中国科学院紫金山天文台获悉，其“银河画卷”研究团队在银河系分子气体外盘中，首次发现广泛分布的波纹状褶皱结构。该结构叠加在已知的银河系外盘大尺度翘曲结构之上，为理解银河系分子气体外盘三维结构及盘面动力学演化提供了关键观测证据。相关研究成果于2026年8月7日在线发表于国际学术期刊《自然-天文学》。（时政来源：新华网）',
  '新华网',
  '2026-08-09',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  1,
  'document',
  '单选',
  '2026年8月7日，（  ）科考船缓缓靠泊中国科学院海洋研究所西海岸码头基地，为期35天、航程5845海里的2026年西太平洋科学考察共享航次顺利收官。',
  '[{"key":"A","text":"“科学”号"},{"key":"B","text":"“雪龙”号"},{"key":"C","text":"“雪龙2”号"},{"key":"D","text":"“向阳红01”号"}]',
  'A',
  '',
  '原题',
  '2026-08-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  2,
  'document',
  '单选',
  '中国民航局2026年8月7日对外发布的《民用航空发展“十五五”规划》提出，“十五五”时期，民航行业将以（  ）为底线，以（  ）为主线，以改革创新为根本动力，确保安全、便捷、高效、绿色、经济的现代化民航体系建设取得决定性进展。',
  '[{"key":"A","text":"开放发展；提质增效"},{"key":"B","text":"安全发展；提质增效"},{"key":"C","text":"绿色发展；减量提质"},{"key":"D","text":"创新发展；减量提质"}]',
  'B',
  '',
  '原题',
  '2026-08-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  3,
  'document',
  '单选',
  '截至2026年8月7日，南水北调（  ）累计向北方调水突破800亿立方米，惠及河南、河北、天津、北京近1.18亿人，为沿线27座大中城市243个县（市、区）经济社会发展提供有力的水资源支撑。',
  '[{"key":"A","text":"西线工程"},{"key":"B","text":"东线一期工程"},{"key":"C","text":"中线工程"},{"key":"D","text":"东中线联合调水体系"}]',
  'C',
  '',
  '原题',
  '2026-08-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  4,
  'document',
  '单选',
  '记者2026年8月7日获悉，为应对当前极端天气频发、重发情况，工业和信息化部日前为气象部门新增配置（  ）频段无线电频率资源，用于北斗卫星导航气象探空系统技术试验，提升我国应对极端天气能力。',
  '[{"key":"A","text":"K"},{"key":"B","text":"M"},{"key":"C","text":"P"},{"key":"D","text":"S"}]',
  'C',
  '',
  '原题',
  '2026-08-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  5,
  'document',
  '单选',
  '中国科学院紫金山天文台“银河画卷”研究团队在银河系分子气体外盘中，首次发现广泛分布的（  ）。相关研究成果于2026年8月7日在线发表于国际学术期刊《自然-天文学》。',
  '[{"key":"A","text":"大尺度翘曲结构"},{"key":"B","text":"环状空腔嵌套结构"},{"key":"C","text":"丝状纤维网状结构"},{"key":"D","text":"波纹状褶皱结构"}]',
  'D',
  '',
  '原题',
  '2026-08-09'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  1,
  '历史上的今天',
  '1896年维新派创办《时务报》',
  '1896年维新派创办《时务报》',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1896年维新派创办《时务报》|1896年维新派创办《时务报》',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  2,
  '历史上的今天',
  '1897年国际数学家大会在瑞士苏黎世召开',
  '1897年国际数学家大会在瑞士苏黎世召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1897年国际数学家大会在瑞士苏黎世召开|1897年国际数学家大会在瑞士苏黎世召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  3,
  '历史上的今天',
  '1919年中国试制成功第一架水上飞机',
  '1919年中国试制成功第一架水上飞机',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1919年中国试制成功第一架水上飞机|1919年中国试制成功第一架水上飞机',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  4,
  '历史上的今天',
  '1930年中国农工民主党在上海成立',
  '1930年中国农工民主党在上海成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1930年中国农工民主党在上海成立|1930年中国农工民主党在上海成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  5,
  '历史上的今天',
  '1938年晋绥边区形成',
  '1938年晋绥边区形成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1938年晋绥边区形成|1938年晋绥边区形成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  6,
  '常识',
  '中共党员',
  '政治面貌反映了公民在政治上的归属和身份，是填写个人档案、户籍、工作申请等文件时的重要信息。
指中国共产党正式党员，年满十八岁的中国工人、农民、军人、知识分子和其他社会阶层的先进分子，承认党的纲领和章程，愿意参加党的组织并积极工作，经入党程序批准成为正式党员。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|中共党员|政治面貌反映了公民在政治上的归属和身份，是填写个人档案、户籍、工作申请等文件时的重要信息。
指中国共产党正式党员，年满十八岁的中国工人、农民、军人、知识分子和其',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  7,
  '常识',
  '中共预备党员',
  '指已批准加入中国共产党但处于预备期的党员，预备期为一年，期间需履行党员义务，预备期满后经考察合格转为正式党员。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|中共预备党员|指已批准加入中国共产党但处于预备期的党员，预备期为一年，期间需履行党员义务，预备期满后经考察合格转为正式党员。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  8,
  '常识',
  '共青团员',
  '指中国共产主义青年团团员，年龄在十四周岁以上、二十八周岁以下的中国青年，承认团的章程，愿意参加团的组织并积极工作，是党的助手和后备军。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|共青团员|指中国共产主义青年团团员，年龄在十四周岁以上、二十八周岁以下的中国青年，承认团的章程，愿意参加团的组织并积极工作，是党的助手和后备军。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  9,
  '常识',
  '民革党员',
  '指中国国民党革命委员会党员，主要由同原中国国民党有关系的人士、同民革有历史联系和社会联系的人士、同台湾各界有联系的人士以及社会和法制、“三农”研究领域专业人士组成。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|民革党员|指中国国民党革命委员会党员，主要由同原中国国民党有关系的人士、同民革有历史联系和社会联系的人士、同台湾各界有联系的人士以及社会和法制、“三农”研究领域专业人士组',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  10,
  '常识',
  '民盟盟员',
  '指中国民主同盟盟员，主要由文化教育以及相关的科学技术领域高、中级知识分子组成，致力于推动民主、科学和社会进步。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|民盟盟员|指中国民主同盟盟员，主要由文化教育以及相关的科学技术领域高、中级知识分子组成，致力于推动民主、科学和社会进步。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  11,
  '常识',
  '民建会员',
  '指中国民主建国会会员，主要由经济界人士以及相关的专家学者组成，关注经济发展、企业权益和民生改善。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|民建会员|指中国民主建国会会员，主要由经济界人士以及相关的专家学者组成，关注经济发展、企业权益和民生改善。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  12,
  '常识',
  '民进会员',
  '指中国民主促进会会员，主要由教育文化出版传媒以及相关的科学技术领域高、中级知识分子组成，以推动教育、文化事业发展为宗旨。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|民进会员|指中国民主促进会会员，主要由教育文化出版传媒以及相关的科学技术领域高、中级知识分子组成，以推动教育、文化事业发展为宗旨。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  13,
  '常识',
  '农工党党员',
  '指中国农工民主党党员，主要由医药卫生、人口资源和生态环境以及相关的科学技术、教育领域高、中级知识分子组成，关注医疗卫生、环境保护等民生问题。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|农工党党员|指中国农工民主党党员，主要由医药卫生、人口资源和生态环境以及相关的科学技术、教育领域高、中级知识分子组成，关注医疗卫生、环境保护等民生问题。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  14,
  '常识',
  '致公党党员',
  '指中国致公党党员，主要由归侨、侨眷中的中上层人士和其他有海外关系的代表性人士组成，致力于维护华侨权益和促进祖国统一。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|致公党党员|指中国致公党党员，主要由归侨、侨眷中的中上层人士和其他有海外关系的代表性人士组成，致力于维护华侨权益和促进祖国统一。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  15,
  '常识',
  '九三学社社员',
  '指九三学社社员，主要由科学技术以及相关的高等教育、医药卫生领域高、中级知识分子组成，以“民主与科学”为宗旨，推动科技创新和社会进步。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|九三学社社员|指九三学社社员，主要由科学技术以及相关的高等教育、医药卫生领域高、中级知识分子组成，以“民主与科学”为宗旨，推动科技创新和社会进步。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  16,
  '常识',
  '台盟盟员',
  '指台湾民主自治同盟盟员，主要由居住在祖国大陆的台湾省人士以及从事台湾问题研究的高、中级知识分子组成，致力于促进两岸交流与和平统一。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|台盟盟员|指台湾民主自治同盟盟员，主要由居住在祖国大陆的台湾省人士以及从事台湾问题研究的高、中级知识分子组成，致力于促进两岸交流与和平统一。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  17,
  '常识',
  '无党派人士',
  '指没有参加任何政党，但有参政议政愿望和能力、对社会有积极贡献和一定影响的人士，主体是知识分子，以独立身份参与政治和社会事务。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|无党派人士|指没有参加任何政党，但有参政议政愿望和能力、对社会有积极贡献和一定影响的人士，主体是知识分子，以独立身份参与政治和社会事务。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.9.docx'),
  18,
  '常识',
  '群众',
  '指未加入中国共产党、中国共产主义青年团、民主党派的普通公民，是政治面貌分类中的基础类别，代表广大普通民众。',
  '常识',
  '中国的十三种政治面貌',
  'common',
  '常识|中国的十三种政治面貌|群众|指未加入中国共产党、中国共产主义青年团、民主党派的普通公民，是政治面貌分类中的基础类别，代表广大普通民众。',
  'learning',
  ''
);

COMMIT;
