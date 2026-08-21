-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.16
-- doc_date: 2026-08-16
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.16',
  'manual://每日积累8.16',
  '2026-08-16',
  'c09fc4ccc0ccf21fabc00a9ef9ec2171f59563d6ca1cb39e1e6e99bf5b557f6f',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.16');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.16');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.16');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  1,
  'digest',
  '单选',
  '“只有天在上，更无山与齐。举头红日近，回首白云低。”描写的是（）。',
  '[{"key":"A","text":"黄山"},{"key":"B","text":"庐山"},{"key":"C","text":"华山"},{"key":"D","text":"泰山"}]',
  'C',
  '本题考查人文历史。
A项错误，黄山，世界文化与自然双重遗产，世界地质公园，国家AAAAA级旅游景区，国家级风景名胜区，全国文明风景旅游区示范点，中华十大名山，天下第一奇山。
B项错误，庐山以雄、奇、险、秀闻名于世，素有“匡庐奇秀甲天下”之美誉，是世界文化遗产、世界地质公园、国家重点风景名胜区、国家AAAAA级旅游景区、中华十大名山、中国最美十大名山、全国重点文物保护单位、中国四大避暑胜地、首批全国文明风景旅游区示范点。
C项正确，“只有天在上，更无山与齐。举头红日近，回首白云低。”出自于北宋寇准的《咏华山》。华山，古称“西岳”，雅称“太华山”，为中国著名的五岳之一，中华十大名山之一，自古以来就有“奇险天下第一山”的说法，是第一批国家重点风景名胜区，国家AAAAA级旅游景区，全国重点文物保护单位，国家地质公园。
D项错误，泰山，又名岱山、岱宗、岱岳、东岳、泰岳，为中国著名的五岳之一，有“五岳之首”、“五岳之长”、“五岳之尊”之称，是世界自然与文化遗产，世界地质公园，国家AAAAA级旅游景区，国家级风景名胜区，全国重点文物保护单位，全国文明风景旅游区。
故正确答案为C。',
  '常识判断',
  '2026-08-16'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  1,
  '成语',
  '岌岌可危',
  '形容十分危险，快要倾覆或灭亡。',
  '成语',
  '成语积累',
  'idiom',
  '成语||岌岌可危|形容十分危险，快要倾覆或灭亡。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  2,
  '成语',
  '无可奈何',
  '指没有一点办法，只好这样了。',
  '成语',
  '成语积累',
  'idiom',
  '成语||无可奈何|指没有一点办法，只好这样了。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  3,
  '成语',
  '顺势而为',
  '做事要顺应潮流，不要逆势而行。',
  '成语',
  '成语积累',
  'idiom',
  '成语||顺势而为|做事要顺应潮流，不要逆势而行。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  4,
  '成语',
  '利在千秋',
  '做一件事情，其功劳建立于当代，而其所产生的利益将惠及千秋万代。(功在当代，利在千秋)',
  '成语',
  '成语积累',
  'idiom',
  '成语||利在千秋|做一件事情，其功劳建立于当代，而其所产生的利益将惠及千秋万代。(功在当代，利在千秋)',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  5,
  '成语',
  '泽被后世',
  '恩惠遍及到后代的人民。',
  '成语',
  '成语积累',
  'idiom',
  '成语||泽被后世|恩惠遍及到后代的人民。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  6,
  '金句',
  '金句 · 攻坚克难',
  '国家也好，企业也好，个人也好，只有对自己追求的目标有着坚定信心、稳定预期，才可能抵达终点、取得成功。我们深知，前进路上必然还会遇到这样或那样的风险挑战；我们深信，保持 “会当水击三千里” 的自信，挺起 “泰山压顶不弯腰” 的脊梁，涵养 “乱云飞渡仍从容” 的定力，就一定能开辟新天地、创造新奇迹、书写新辉煌。',
  '金句',
  '攻坚克难',
  'quote',
  '金句|攻坚克难|金句 · 攻坚克难|国家也好，企业也好，个人也好，只有对自己追求的目标有着坚定信心、稳定预期，才可能抵达终点、取得成功。我们深知，前进路上必然还会遇到这样或那样的风险挑战；我们深信',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.16'),
  7,
  '金句',
  '金句 · 家国情怀',
  '心手相牵，守望相助。中国人历来抱有家国情怀，崇尚天下为公、克己奉公，信奉天下兴亡、匹夫有责，强调和衷共济、风雨同舟。正因此，每逢危急时刻，总有无数平凡人无惧风浪、慷慨前行。这是中华民族穿越风雨的文化基因，也是我们砥砺前行的精神力量。涵养家国情怀，激扬英雄精神，把感动转化为行动，我们必能进一步凝聚起攻坚克难的强大力量，风雨无阻向前进。',
  '金句',
  '家国情怀',
  'quote',
  '金句|家国情怀|金句 · 家国情怀|心手相牵，守望相助。中国人历来抱有家国情怀，崇尚天下为公、克己奉公，信奉天下兴亡、匹夫有责，强调和衷共济、风雨同舟。正因此，每逢危急时刻，总有无数平凡人无惧风浪',
  'learning',
  ''
);

COMMIT;
