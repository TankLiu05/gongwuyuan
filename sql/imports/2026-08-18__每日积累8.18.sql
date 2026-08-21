-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.18
-- doc_date: 2026-08-18
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.18',
  'manual://每日积累8.18',
  '2026-08-18',
  'e6b9b5c5be09b5dd9d835ae244514a1ea55c94ad8642dfe13428223c889d5028',
  'imported',
  '{"source":"daily-digest","idioms":5,"quotes":0,"questions":1,"warnings":["未解析到金句"],"knowledge":5}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.18');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.18');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.18');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.18'),
  1,
  'digest',
  '单选',
  '下列诗词中，描写梅花的是（）。',
  '[{"key":"A","text":"不要人夸好颜色，只留清气满乾坤"},{"key":"B","text":"疑是广寒宫里种，一秋三度送天香"},{"key":"C","text":"庭前落尽梧桐，水边开彻芙蓉"},{"key":"D","text":"东篱把酒黄昏后，有暗香盈袖"}]',
  'A',
  '本题考查人文历史。
A项正确，“不要人夸好颜色，只留清气满乾坤”出自元代诗人画家王冕题咏自己所画梅花的诗作《墨梅》。
B项错误，“疑是广寒宫里种，一秋三度送天香”出自宋代王十朋《桂花》，诗句描写的是桂花。
C项错误，“庭前落尽梧桐，水边开彻芙蓉”出自元代朱庭玉的《天净沙·秋》，描写的是庭院前落尽了梧桐的叶子，水中的荷花。
D项错误，“东篱把酒黄昏后，有暗香盈袖”出自宋代李清照的《醉花阴·薄雾浓云愁永昼》，描写的是重阳节赏菊花、饮酒的情景。
故正确答案为A。',
  '常识判断',
  '2026-08-18'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.18'),
  1,
  '成语',
  '星星之火',
  '一小点火星，比喻微小的事物，也比喻开始时微小但有远大发展前途的新事物。',
  '成语',
  '成语积累',
  'idiom',
  '成语||星星之火|一小点火星，比喻微小的事物，也比喻开始时微小但有远大发展前途的新事物。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.18'),
  2,
  '成语',
  '不二法门',
  '意为直接入道，不可言传的法门。后比喻最好的或独一无二的方法。',
  '成语',
  '成语积累',
  'idiom',
  '成语||不二法门|意为直接入道，不可言传的法门。后比喻最好的或独一无二的方法。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.18'),
  3,
  '成语',
  '中流砥柱',
  '比喻坚强的人(或力量)承担起支柱作用的重任，支撑艰危的局面。',
  '成语',
  '成语积累',
  'idiom',
  '成语||中流砥柱|比喻坚强的人(或力量)承担起支柱作用的重任，支撑艰危的局面。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.18'),
  4,
  '成语',
  '源头活水',
  '比喻来源充沛、永不枯竭的事物(多指知识)。也比喻事物发展的动力和源泉。',
  '成语',
  '成语积累',
  'idiom',
  '成语||源头活水|比喻来源充沛、永不枯竭的事物(多指知识)。也比喻事物发展的动力和源泉。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.18'),
  5,
  '成语',
  '敬而远之',
  '用来指对某人表示尊敬却有所顾虑而不去接近他，多指对心术不正、城府深的人采取敬畏而不亲近的态度。',
  '成语',
  '成语积累',
  'idiom',
  '成语||敬而远之|用来指对某人表示尊敬却有所顾虑而不去接近他，多指对心术不正、城府深的人采取敬畏而不亲近的态度。',
  'learning',
  ''
);

COMMIT;
