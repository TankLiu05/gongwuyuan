-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.6.docx
-- doc_date: 2026-08-06
-- generated_at: 2026-08-21T08:42:54.225Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.6.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.6.docx',
  '2026-08-06',
  '743ad8388822ce572ec7e14c41d0e393dfe94f2e89e0787b8f936a8c35102963',
  'imported',
  '{"paragraphs":66,"articles":5,"questions":5,"knowledge":9,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  1,
  '教育部开展义务教育阶段科学教育“做中学”领航行动',
  '2026年8月4日，教育部印发《义务教育阶段科学教育“做中学”领航行动指南》，部署开展科学教育“做中学”领航行动。
指南指出，领航行动以学生为主体，以兴趣为导向，以实践为路径，聚焦加强科学探究实践，推动科学教育育人方式变革，激发青少年好奇心、想象力、探求欲，回答好科学教育加法“加什么、怎么加”的问题。（时政来源：人民网）',
  '人民网',
  '2026-08-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  2,
  '我国成功发射东方慧眼高光谱01、02星',
  '2026年8月5日10时38分，我国太原卫星发射中心在山东海阳附近海域使用捷龙三号运载火箭，成功将东方慧眼高光谱01、02星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。（时政来源：新华网）',
  '新华网',
  '2026-08-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  3,
  '六部门发文加强聘用制书记员队伍规范管理',
  '记者2026年8月5日从最高人民法院获悉，近日，最高人民法院联合多部门印发《关于进一步加强人民法院聘用制书记员管理工作的意见》。
《意见》明确，人民法院书记员应当配备在审判业务部门，主要实行聘用制管理，原则上不再占用政法专项编制。聘用制书记员实行用人额度总量管理。各省（自治区、直辖市）人民法院书记员（含编制内和聘用制）总量与核定的法官员额数量大体相当，并严格控制规模。人民法院应当直接与聘用制书记员签订劳动合同，逐步取消劳务派遣用工方式，持续增强聘用制书记员的职业归属感和认同感。
《意见》提出，省级以下人民法院招聘聘用制书记员原则上由高级人民法院统一组织。
《意见》规定，聘用制书记员实行分级管理，等级设置为十级，从高到低依次为：一级高级至四级高级聘用制书记员、一级至六级聘用制书记员。（时政来源：央视网）',
  '央视网',
  '2026-08-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  4,
  '自动驾驶系统安全要求国家标准发布',
  '《智能网联汽车 自动驾驶系统安全要求》（GB 44721—2026）强制性国家标准近日由国家市场监督管理总局、国家标准化管理委员会批准发布，拟于2027年7月1日起正式实施。
此次发布的强制性国家标准适用于搭载L3级、L4级（高度自动驾驶）系统的M类和N类车辆，不适用于自动泊车系统。（时政来源：新华网）',
  '新华网',
  '2026-08-06',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  5,
  '我国成功发射卫星互联网低轨23组卫星',
  '2026年8月4日16时52分，我国在海南商业航天发射场使用长征八号甲运载火箭，成功将卫星互联网低轨23组卫星发射升空，卫星顺利进入预定轨道，发射任务获得圆满成功。（时政来源：新华网）',
  '新华网',
  '2026-08-06',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  1,
  'document',
  '单选',
  '2026年8月4日，教育部印发《义务教育阶段科学教育“做中学”领航行动指南》，部署开展科学教育“做中学”领航行动。指南指出，领航行动以（  ）为主体，以（  ）为导向，以（  ）为路径，聚焦加强科学探究实践，推动科学教育育人方式变革，激发青少年好奇心、想象力、探求欲，回答好科学教育加法“加什么、怎么加”的问题。',
  '[{"key":"A","text":"学生；兴趣；实践"},{"key":"B","text":"老师；兴趣；改革"},{"key":"C","text":"学生；成绩；改革"},{"key":"D","text":"老师；成绩；实践"}]',
  'A',
  '',
  '原题',
  '2026-08-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  2,
  'document',
  '单选',
  '2026年8月5日10时38分，我国太原卫星发射中心在山东海阳附近海域使用捷龙三号运载火箭，成功将（  ）发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。',
  '[{"key":"A","text":"天链三号中继卫星"},{"key":"B","text":"东方慧眼高光谱01、02星"},{"key":"C","text":"互联网低轨通信卫星"},{"key":"D","text":"沧海一号海洋观测卫星"}]',
  'B',
  '',
  '原题',
  '2026-08-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  3,
  'document',
  '单选',
  '近日，最高人民法院联合多部门印发《关于进一步加强人民法院聘用制书记员管理工作的意见》。根据《意见》，下列说法正确的是（  ）。',
  '[{"key":"A","text":"人民法院书记员主要实行政法专项编制管理"},{"key":"B","text":"聘用制书记员实行用人额度总量管理"},{"key":"C","text":"人民法院应当通过第三方与聘用制书记员签订劳务派遣合同"},{"key":"D","text":"聘用制书记员的等级按照从低到高依次为：一级至六级聘用制书记员、一级高级至四级高级聘用制书记员"}]',
  'B',
  '',
  '原题',
  '2026-08-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  4,
  'document',
  '单选',
  '《智能网联汽车 自动驾驶系统安全要求》（GB 44721—2026）强制性国家标准近日由国家市场监督管理总局、国家标准化管理委员会批准发布，拟于2027年7月1日起正式实施。此次发布的强制性国家标准适用于搭载（  ）系统的M类和N类车辆，不适用于自动泊车系统。',
  '[{"key":"A","text":"L1级、L2级"},{"key":"B","text":"L3级、L4级"},{"key":"C","text":"L2级、L3级"},{"key":"D","text":"L2级、L3级、L4级"}]',
  'B',
  '',
  '原题',
  '2026-08-06'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  5,
  'document',
  '单选',
  '2026年8月4日16时52分，我国在海南商业航天发射场使用（  ），成功将卫星互联网低轨23组卫星发射升空，卫星顺利进入预定轨道，发射任务获得圆满成功。',
  '[{"key":"A","text":"长征八号甲运载火箭"},{"key":"B","text":"捷龙三号运载火箭"},{"key":"C","text":"长征十二号运载火箭"},{"key":"D","text":"力箭一号运载火箭"}]',
  'A',
  '',
  '原题',
  '2026-08-06'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  1,
  '历史上的今天',
  '1930年中共成立总行动委员会',
  '1930年中共成立总行动委员会',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1930年中共成立总行动委员会|1930年中共成立总行动委员会',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  2,
  '历史上的今天',
  '1931年第三次反围剿战争开始',
  '1931年第三次反围剿战争开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1931年第三次反围剿战争开始|1931年第三次反围剿战争开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  3,
  '历史上的今天',
  '1943年韦拉湾海战爆发',
  '1943年韦拉湾海战爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1943年韦拉湾海战爆发|1943年韦拉湾海战爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  4,
  '历史上的今天',
  '1945年广岛原子弹爆炸',
  '1945年广岛原子弹爆炸',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年广岛原子弹爆炸|1945年广岛原子弹爆炸',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  5,
  '历史上的今天',
  '1962年牙买加独立',
  '1962年牙买加独立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1962年牙买加独立|1962年牙买加独立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  6,
  '常识',
  '五禽戏',
  '五禽戏由东汉医学家华佗编创，模仿虎、鹿、熊、猿、鸟五种动物的动作和神态，旨在强身健体、预防疾病。五禽戏对身心皆有益，其导引术式对后世动功和武术影响深远，故有“五禽戏为百拳之祖”的说法。2011年，五禽戏被列入第三批国家级非物质文化遗产名录。',
  '常识',
  '中国古代四大健身操',
  'common',
  '常识|中国古代四大健身操|五禽戏|五禽戏由东汉医学家华佗编创，模仿虎、鹿、熊、猿、鸟五种动物的动作和神态，旨在强身健体、预防疾病。五禽戏对身心皆有益，其导引术式对后世动功和武术影响深远，故有“五',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  7,
  '常识',
  '易筋经',
  '相传《易筋经》为菩提达摩所创。达摩传禅时见徒众筋骨柔弱、静坐易昏沉，便传授此功法以强身。易筋经融合道家导引术与少林内功外功，动作由“肢体规范”和“仿生运动”两部分组成，以“伸筋拔骨、疏通经络”为目的。“易”是改变，“筋”指筋骨，合起来就是锻炼筋骨的方法。在武侠小说中，《易筋经》常被渲染为武林绝学。',
  '常识',
  '中国古代四大健身操',
  'common',
  '常识|中国古代四大健身操|易筋经|相传《易筋经》为菩提达摩所创。达摩传禅时见徒众筋骨柔弱、静坐易昏沉，便传授此功法以强身。易筋经融合道家导引术与少林内功外功，动作由“肢体规范”和“仿生运动”两部',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  8,
  '常识',
  '八段锦',
  '八段锦起源于北宋，是中国古代流传最广的气功功法之一。古人将其比喻为“锦”，意为如锦缎般优美连贯。八段锦共分八段，每段一个动作，因此得名。其动作简单舒缓，适合各年龄段人群练习，能有效提高柔韧性、力量和平衡能力，具有调理脏腑、疏通气血的功效。',
  '常识',
  '中国古代四大健身操',
  'common',
  '常识|中国古代四大健身操|八段锦|八段锦起源于北宋，是中国古代流传最广的气功功法之一。古人将其比喻为“锦”，意为如锦缎般优美连贯。八段锦共分八段，每段一个动作，因此得名。其动作简单舒缓，适合各年',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.6.docx'),
  9,
  '常识',
  '太极拳',
  '太极拳以中国传统儒、道哲学中的太极、阴阳辩证理念为核心思想，集颐养性情、强身健体、技击对抗于一体，是一种内外兼修、刚柔相济的传统拳术。太极拳讲究以柔克刚、以静制动，动作圆活连贯。史学界一般认为太极拳成型于清代，由陈王廷创编。2020年12月，“太极拳”被列入联合国教科文组织人类非物质文化遗产代表作名录。2025年11月，联合国教科文组织第43届大会通过决议，将每年3月21日设立为国际太极拳日。这是联合国系统首个以武术项目命名的国际日。
【大白话总结】
一句话记住：五禽戏学动物，易筋经练筋骨，八段锦八动作，太极拳讲阴阳。',
  '常识',
  '中国古代四大健身操',
  'common',
  '常识|中国古代四大健身操|太极拳|太极拳以中国传统儒、道哲学中的太极、阴阳辩证理念为核心思想，集颐养性情、强身健体、技击对抗于一体，是一种内外兼修、刚柔相济的传统拳术。太极拳讲究以柔克刚、以静制',
  'learning',
  ''
);

COMMIT;
