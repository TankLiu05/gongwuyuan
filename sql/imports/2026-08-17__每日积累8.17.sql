-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.17
-- doc_date: 2026-08-17
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.17',
  'manual://每日积累8.17',
  '2026-08-17',
  'd95364c14310ea101b6d705027fbc42429a98fad8b017c1536fd00b3ec3d996e',
  'imported',
  '{"source":"daily-digest","idioms":5,"quotes":2,"questions":1,"warnings":[],"knowledge":7}',
  '每日积累手工写入',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.17');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.17');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.17');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  1,
  'digest',
  '单选',
  '下列选项与中医药有关的是（）。',
  '[{"key":"A","text":"生旦净末"},{"key":"B","text":"君臣佐使"},{"key":"C","text":"五谷杂粮"},{"key":"D","text":"梅兰竹菊"}]',
  'B',
  '本题考查人文历史。A项错误，“生旦净末”是中国戏曲中人物角色的行当分类，按传统习惯，有“生、旦、净、丑”和“生、旦、净、末、丑”两种分行方法，近代以来，由于不少剧种的“末”行已逐渐归入“生”行，因此，通常把“生、旦、净、丑”作为行当的四种基本类型。B项正确，“君臣佐使”是一个词组，也可以视为是方剂学术语，系方剂配伍组成的基本原则。原指君主、臣僚、僚佐、使者四种人分别起着不同的作用，后指中药处方中的各味药的不同作用。C项错误，五谷的意思是指五种谷，一般指稻谷、麦子、大豆、玉米、薯类。随着社会经济和农业生产的发展，五谷的概念在不断演变着，所谓五谷，实际只是粮食作物的总名称，或者泛指粮食作物罢了。D项错误，“梅兰竹菊”是指：梅花、兰花、竹子、菊花。被人称为“四君子”。品质分别是：傲、幽、坚、淡。梅、兰、竹、菊成为中国人感物喻志的象征，也是咏物诗和文人画中最常见的题材。故正确答案为B。',
  '常识判断',
  '2026-08-17'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  1,
  '成语',
  '江郎才尽',
  '比喻才思枯竭。',
  '成语',
  '成语积累',
  'idiom',
  '成语||江郎才尽|比喻才思枯竭。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  2,
  '成语',
  '江河日下',
  '江河的水天天向下游流。比喻情况一天天坏下去。',
  '成语',
  '成语积累',
  'idiom',
  '成语||江河日下|江河的水天天向下游流。比喻情况一天天坏下去。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  3,
  '成语',
  '胶柱鼓瑟',
  '比喻拘泥固执，不知变通。柱瑟上调弦的短木，被粘住，就不能调整音高。',
  '成语',
  '成语积累',
  'idiom',
  '成语||胶柱鼓瑟|比喻拘泥固执，不知变通。柱瑟上调弦的短木，被粘住，就不能调整音高。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  4,
  '成语',
  '金科玉律',
  '必须遵守、不能更改的信条。多含贬义。',
  '成语',
  '成语积累',
  'idiom',
  '成语||金科玉律|必须遵守、不能更改的信条。多含贬义。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  5,
  '成语',
  '开门揖盗',
  '比喻引进坏人，自招祸患。揖，作揖，表示欢迎。',
  '成语',
  '成语积累',
  'idiom',
  '成语||开门揖盗|比喻引进坏人，自招祸患。揖，作揖，表示欢迎。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  6,
  '金句',
  '金句 · 国际合作',
  '当前，世界之变、时代之变、历史之变正以前所未有的方式展开。在这一关乎世界和平发展的关键当口，中国同地区国家团结协作、砥砺前行，将为世界和平发展、合作共赢注入正能量，为构建人类命运共同体作出新贡献。',
  '金句',
  '国际合作',
  'quote',
  '金句|国际合作|金句 · 国际合作|当前，世界之变、时代之变、历史之变正以前所未有的方式展开。在这一关乎世界和平发展的关键当口，中国同地区国家团结协作、砥砺前行，将为世界和平发展、合作共赢注入正能',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.17'),
  7,
  '金句',
  '金句 · 教书育人',
  '“ 三寸粉笔，三尺讲台系国运；一颗丹心，一生秉烛铸民魂。”教师是立教之本、兴教之源。我们要继续满腔热情关心教师，在全社会营造尊师重教的良好风尚。期待一批批 “大国良师”脱颖而出，守教育初心、担筑梦使命，言为士则、行为世范，在教书育人工作中不断创造新业绩！',
  '金句',
  '教书育人',
  'quote',
  '金句|教书育人|金句 · 教书育人|“ 三寸粉笔，三尺讲台系国运；一颗丹心，一生秉烛铸民魂。”教师是立教之本、兴教之源。我们要继续满腔热情关心教师，在全社会营造尊师重教的良好风尚。期待一批批 “大',
  'learning',
  ''
);

COMMIT;
