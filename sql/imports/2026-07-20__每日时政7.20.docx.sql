-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.20.docx
-- doc_date: 2026-07-20
-- generated_at: 2026-08-21T08:42:54.222Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.20.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.20.docx',
  '2026-07-20',
  '3fafd2262abe1b528a76a37335dd9001846cee43078915c07308d0cc2a7257c1',
  'imported',
  '{"paragraphs":91,"articles":5,"questions":5,"knowledge":24,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  1,
  '京港高铁雄商段正式进入运行试验阶段',
  '2026年7月17日凌晨4时20分，随着京港高铁雄安新区至商丘段国铁集团郑州局管段当日施工维修天窗结束，该段线路正式进入运行试验阶段，距离正式开通运营更近一步。
京港高铁雄商段是我国“八纵八横”高速铁路网京港（台）通道的重要组成部分，线路途经河北、山东、河南三省，北起雄安站，南至商丘站，与已建成的商合杭高速铁路实现互联互通，正线全长552公里，设计时速350公里，其中，河南段长25公里。（时政来源：人民网）',
  '人民网',
  '2026-07-20',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  2,
  '全国蓝碳交易联盟在深圳成立',
  '全国蓝碳交易联盟成立暨第一届联盟大会2026年7月17日在深圳举行。联盟秉持开放平等、共建共享、合作共赢的发展原则，旨在规范蓝碳交易市场、提升蓝碳交易规模、促进蓝碳信息共享、拓展国际交流合作。（时政来源：新华网）',
  '新华网',
  '2026-07-20',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  3,
  '第十六次全国检察工作会议在京召开',
  '第十六次全国检察工作会议2026年7月16日至17日在京召开。中共中央政治局委员、中央政法委书记陈文清出席会议并讲话。他强调，要坚持聚焦主责、强化监督，充分发挥国家法律监督机关职能作用，全面履行刑事、民事、行政、公益诉讼“四大检察”职能，全面加强对立案、侦查、审判、执行活动的监督，依法监督、敢于监督、善于监督，努力让人民群众在每一个司法案件中感受到公平正义。（时政来源：人民网）',
  '人民网',
  '2026-07-20',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  4,
  '到2030年我国美丽乡村整县建成比例要达到55%',
  '记者2026年7月17日获悉，生态环境部等六部门联合印发的《土壤、地下水和农业农村生态环境保护“十五五”规划》提出，到2030年，美丽乡村整县建成比例达到55%。（时政来源：新华网）',
  '新华网',
  '2026-07-20',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  5,
  '国产超大直径盾构机“先锋号”在长沙下线',
  '2026年7月17日，由中铁十四局和铁建重工联合打造的国产14米级超大直径盾构机“先锋号”在湖南长沙顺利下线，此次下线的“先锋号”盾构机开挖直径达14.02米，整机全长约112米，总重量约3200吨，将应用于国内首条下穿太湖超大直径盾构隧道——无锡至宜兴城际轨道交通工程（锡宜S2线）穿太湖段隧道建设。（时政来源：人民网）',
  '人民网',
  '2026-07-20',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  1,
  'document',
  '单选',
  '2026年7月17日凌晨4时20分，京港高铁雄商段正式进入运行试验阶段，距离正式开通运营更近一步。京港高铁雄商段是我国“八纵八横”高速铁路网京港（台）通道的重要组成部分，线路途经（  ）三省。',
  '[{"key":"A","text":"北京、河南、河北"},{"key":"B","text":"天津、山东、河南"},{"key":"C","text":"北京、天津、山东"},{"key":"D","text":"河北、山东、河南"}]',
  'D',
  '',
  '原题',
  '2026-07-20'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  2,
  'document',
  '单选',
  '全国蓝碳交易联盟成立暨第一届联盟大会2026年7月17日在深圳举行。联盟秉持（  ）的发展原则，旨在规范蓝碳交易市场、提升蓝碳交易规模、促进蓝碳信息共享、拓展国际交流合作。
①利益均分；②开放平等；③共建共享；④合作共赢',
  '[{"key":"A","text":"①②③"},{"key":"B","text":"①②④"},{"key":"C","text":"①③④"},{"key":"D","text":"②③④"}]',
  'D',
  '',
  '原题',
  '2026-07-20'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  3,
  'document',
  '单选',
  '第十六次全国检察工作会议2026年7月16日至17日在京召开。中共中央政治局委员、中央政法委书记陈文清出席会议并讲话指出，全面履行（  ）“四大检察”职能，全面加强对立案、侦查、审判、执行活动的监督，依法监督、敢于监督、善于监督，努力让人民群众在每一个司法案件中感受到公平正义。',
  '[{"key":"A","text":"刑事、民事、行政、公益诉讼"},{"key":"B","text":"刑事、商事、行政、公益诉讼"},{"key":"C","text":"刑事、民事、海事、公益诉讼"},{"key":"D","text":"刑事、民事、行政、司法救助"}]',
  'A',
  '',
  '原题',
  '2026-07-20'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  4,
  'document',
  '单选',
  '记者2026年7月17日获悉，生态环境部等六部门联合印发的《土壤、地下水和农业农村生态环境保护“十五五”规划》提出，到2030年，美丽乡村（  ）建成比例达到55%。',
  '[{"key":"A","text":"整市"},{"key":"B","text":"整省"},{"key":"C","text":"整县"},{"key":"D","text":"整村"}]',
  'C',
  '',
  '原题',
  '2026-07-20'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  5,
  'document',
  '单选',
  '2026年7月17日，由中铁十四局和铁建重工联合打造的国产14米级超大直径盾构机（  ）在湖南长沙顺利下线，此次下线的（  ）盾构机将应用于国内首条下穿太湖超大直径盾构隧道——无锡至宜兴城际轨道交通工程（锡宜S2线）穿太湖段隧道建设。',
  '[{"key":"A","text":"“通湖号”"},{"key":"B","text":"“熙怡号”"},{"key":"C","text":"“锡望号”"},{"key":"D","text":"“先锋号”"}]',
  'D',
  '',
  '原题',
  '2026-07-20'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  1,
  '历史上的今天',
  '1847年上海发生徐家汇教案',
  '1847年上海发生徐家汇教案',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1847年上海发生徐家汇教案|1847年上海发生徐家汇教案',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  2,
  '历史上的今天',
  '1900年齐柏林飞艇首次飞行',
  '1900年齐柏林飞艇首次飞行',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年齐柏林飞艇首次飞行|1900年齐柏林飞艇首次飞行',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  3,
  '历史上的今天',
  '1927年中国共产党决定在南昌暴动',
  '1927年中国共产党决定在南昌暴动',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1927年中国共产党决定在南昌暴动|1927年中国共产党决定在南昌暴动',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  4,
  '历史上的今天',
  '1939年中共在延安创办了中国女子大学',
  '1939年中共在延安创办了中国女子大学',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1939年中共在延安创办了中国女子大学|1939年中共在延安创办了中国女子大学',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  5,
  '历史上的今天',
  '1951年毛泽东表述“毛泽东思想”',
  '1951年毛泽东表述“毛泽东思想”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1951年毛泽东表述“毛泽东思想”|1951年毛泽东表述“毛泽东思想”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  6,
  '常识',
  '兵圣',
  '孙武，春秋末期齐国乐安（今山东省北部）人。中国春秋时期著名的军事家、政治家，尊称兵圣或孙子，又称“兵家至圣”，被誉为“百世兵家之师”、“东方兵学的鼻祖”。其著有《孙子兵法》，被誉为“兵学圣典”。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|兵圣|孙武，春秋末期齐国乐安（今山东省北部）人。中国春秋时期著名的军事家、政治家，尊称兵圣或孙子，又称“兵家至圣”，被誉为“百世兵家之师”、“东方兵学的鼻祖”。其著有',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  7,
  '常识',
  '工圣',
  '鲁班，春秋时期鲁国人，尊称公输子，被誉为土木建筑鼻祖、木匠鼻祖、戏班的祖师、工圣等，木工师傅们用的手工工具，如钻、刨子、铲子、曲尺，划线用的墨斗，据说都是鲁班发明的。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|工圣|鲁班，春秋时期鲁国人，尊称公输子，被誉为土木建筑鼻祖、木匠鼻祖、戏班的祖师、工圣等，木工师傅们用的手工工具，如钻、刨子、铲子、曲尺，划线用的墨斗，据说都是鲁班发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  8,
  '常识',
  '医圣',
  '张仲景，东汉南阳涅阳县（今河南省邓州市穰东镇张寨村）人。东汉末年著名医学家，被后人尊称为医圣。著有《伤寒杂病论》，它确立的辨证论治原则，是中医临床的基本原则，是中医的灵魂所在。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|医圣|张仲景，东汉南阳涅阳县（今河南省邓州市穰东镇张寨村）人。东汉末年著名医学家，被后人尊称为医圣。著有《伤寒杂病论》，它确立的辨证论治原则，是中医临床的基本原则，是',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  9,
  '常识',
  '复圣',
  '颜回，鲁国都城人（今山东曲阜市），尊称复圣颜子，春秋末期鲁国思想家，孔门七十二贤之首。孔子对颜回称赞最多，赞其好学仁人。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|复圣|颜回，鲁国都城人（今山东曲阜市），尊称复圣颜子，春秋末期鲁国思想家，孔门七十二贤之首。孔子对颜回称赞最多，赞其好学仁人。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  10,
  '常识',
  '诗圣',
  '杜甫，唐代著名现实主义诗人。杜甫在中国古典诗歌中的影响非常深远，被后人称为“诗圣”，他的诗被称为“诗史”。 六、画圣吴道子，唐代著名画家，画史尊称画圣。他的人物画称作“吴带当风”，主要作品有《送子天王图》，《明皇受篆图》，《十指钟馗图》等。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|诗圣|杜甫，唐代著名现实主义诗人。杜甫在中国古典诗歌中的影响非常深远，被后人称为“诗圣”，他的诗被称为“诗史”。 六、画圣吴道子，唐代著名画家，画史尊称画圣。他的人物',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  11,
  '常识',
  '茶圣',
  '陆羽，唐朝复州竟陵（今湖北天门市）人，唐代茶学家，被誉为“茶仙”，尊为“茶圣”，祀为“茶神”。他著有《茶经》三卷，是世界上第一部茶叶专著。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|茶圣|陆羽，唐朝复州竟陵（今湖北天门市）人，唐代茶学家，被誉为“茶仙”，尊为“茶圣”，祀为“茶神”。他著有《茶经》三卷，是世界上第一部茶叶专著。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  12,
  '常识',
  '药圣',
  '李时珍，湖广黄州府蕲州（今湖北省蕲春县）人，明代著名医药学家，被后世尊为“药圣”，著有《本草纲目》。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|药圣|李时珍，湖广黄州府蕲州（今湖北省蕲春县）人，明代著名医药学家，被后世尊为“药圣”，著有《本草纲目》。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  13,
  '常识',
  '武圣',
  '关羽，河东郡解县（今山西省运城市盐湖区解州镇）人，汉末三国时期名将。关羽去世后，民间尊为“关公”，历代朝廷多有褒封。清朝雍正时期，尊为“武圣”。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|武圣|关羽，河东郡解县（今山西省运城市盐湖区解州镇）人，汉末三国时期名将。关羽去世后，民间尊为“关公”，历代朝廷多有褒封。清朝雍正时期，尊为“武圣”。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  14,
  '常识',
  '史圣',
  '司马迁，陕西省韩城市人，西汉史学家、散文家，后世尊称为史迁、太史公、历史之父、史圣。他以其“究天人之际，通古今之变，成一家之言”的史识创作了中国第一部纪传体通史《史记》，被公认为是中国史书的典范。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|史圣|司马迁，陕西省韩城市人，西汉史学家、散文家，后世尊称为史迁、太史公、历史之父、史圣。他以其“究天人之际，通古今之变，成一家之言”的史识创作了中国第一部纪传体通史',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  15,
  '常识',
  '词圣',
  '苏轼，眉州眉山（今四川省眉山市）人，北宋文学家、书法家、美食家、画家，他的词开创豪放一派，与辛弃疾同是豪放派代表，并称“苏辛”，被誉为词圣。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|词圣|苏轼，眉州眉山（今四川省眉山市）人，北宋文学家、书法家、美食家、画家，他的词开创豪放一派，与辛弃疾同是豪放派代表，并称“苏辛”，被誉为词圣。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  16,
  '常识',
  '文圣',
  '欧阳修，号醉翁，晚号六一居士，绵州（今四川省绵阳市）人，北宋政治家、文学家。在宋代文学史上最早开创一代文风的文坛领袖，被誉为文圣。还有一说文圣是孔子。一说文圣是周公。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|文圣|欧阳修，号醉翁，晚号六一居士，绵州（今四川省绵阳市）人，北宋政治家、文学家。在宋代文学史上最早开创一代文风的文坛领袖，被誉为文圣。还有一说文圣是孔子。一说文圣是',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  17,
  '常识',
  '曲圣',
  '关汉卿，解州（今山西省运城）人，是元杂剧奠基人，与白朴、马致远、郑光祖并称为“元曲四大家”，被誉为曲圣。著有《窦娥冤》《救风尘》《望江亭》《鲁斋郎》《单刀会》等。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|曲圣|关汉卿，解州（今山西省运城）人，是元杂剧奠基人，与白朴、马致远、郑光祖并称为“元曲四大家”，被誉为曲圣。著有《窦娥冤》《救风尘》《望江亭》《鲁斋郎》《单刀会》等',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  18,
  '常识',
  '剑圣',
  '裴旻，东鲁（今山东兖州）人，唐代开元时期的人物。曾镇守北平郡（治今河北卢龙），曾先后参与对奚人、契丹和吐蕃的战事。唐文宗时，称李白的诗、张旭的草书、裴旻的剑舞为“唐代三绝”。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|剑圣|裴旻，东鲁（今山东兖州）人，唐代开元时期的人物。曾镇守北平郡（治今河北卢龙），曾先后参与对奚人、契丹和吐蕃的战事。唐文宗时，称李白的诗、张旭的草书、裴旻的剑舞为',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  19,
  '常识',
  '书圣',
  '王羲之，琅琊临沂（今山东省临沂市）人，东晋大臣、书法家，有“书圣”之称。他撰写的《兰亭序》，成为“天下第一行书”。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|书圣|王羲之，琅琊临沂（今山东省临沂市）人，东晋大臣、书法家，有“书圣”之称。他撰写的《兰亭序》，成为“天下第一行书”。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  20,
  '常识',
  '乐圣',
  '李龟年，邢州柏仁(今河北省邢台市隆尧县西部)人，唐朝音乐家，被后人誉为“乐圣”，代表作是《渭川曲》。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|乐圣|李龟年，邢州柏仁(今河北省邢台市隆尧县西部)人，唐朝音乐家，被后人誉为“乐圣”，代表作是《渭川曲》。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  21,
  '常识',
  '酒圣',
  '杜康，白水县康家卫（今杜康镇）人，相传是周朝时酿酒术的发明者。杜康酒是我国历史名酒，有“贡酒”、“仙酒”之誉。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|酒圣|杜康，白水县康家卫（今杜康镇）人，相传是周朝时酿酒术的发明者。杜康酒是我国历史名酒，有“贡酒”、“仙酒”之誉。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  22,
  '常识',
  '智圣',
  '诸葛亮，琅琊阳都（今山东省沂南县）人，三国时期蜀汉丞相，中国古代杰出的政治家、军事家、文学家、发明家，被誉为“智圣”。诸葛亮散文代表作有《出师表》《诫子书》等。曾发明木牛流马、孔明灯等，并改造连弩，叫做诸葛连弩。还有一说智圣是西汉时期东方朔。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|智圣|诸葛亮，琅琊阳都（今山东省沂南县）人，三国时期蜀汉丞相，中国古代杰出的政治家、军事家、文学家、发明家，被誉为“智圣”。诸葛亮散文代表作有《出师表》《诫子书》等。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  23,
  '常识',
  '算圣',
  '刘洪，东汉泰山郡蒙阴县（今山东省临沂市蒙阴县）人，是我国古代杰出的天文学家和数学家，珠算发明者和月球运动不均匀性理论发现者，被后世尊为“算圣”。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|算圣|刘洪，东汉泰山郡蒙阴县（今山东省临沂市蒙阴县）人，是我国古代杰出的天文学家和数学家，珠算发明者和月球运动不均匀性理论发现者，被后世尊为“算圣”。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.20.docx'),
  24,
  '常识',
  '科圣',
  '张衡，南阳郡西鄂县（今河南省南阳市石桥镇）人。东汉时期杰出的天文学家、数学家、发明家、地理学家、文学家。张衡在天文学方面著有《灵宪》《浑仪图注》等；数学著作有《算罔论》；文学作品以《二京赋》《归田赋》等为代表。',
  '常识',
  '中国古代的‘圣’人',
  'common',
  '常识|中国古代的‘圣’人|科圣|张衡，南阳郡西鄂县（今河南省南阳市石桥镇）人。东汉时期杰出的天文学家、数学家、发明家、地理学家、文学家。张衡在天文学方面著有《灵宪》《浑仪图注》等；数学著作有《',
  'learning',
  ''
);

COMMIT;
