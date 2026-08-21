-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.20
-- doc_date: 2026-08-20
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.20',
  'manual://每日积累8.20',
  '2026-08-20',
  'b17ae99a74253b12b5014b4b2188ce5bfde53d97dc8336a972f451baad66b733',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.20');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.20');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.20');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.20'),
  1,
  'digest',
  '单选',
  '下列古诗词与我国传统艺术对应正确的是（）。',
  '[{"key":"A","text":"镂金作胜传荆俗，翦彩为人起晋风——舞狮"},{"key":"B","text":"兰亭茧纸入昭陵，世间遗迹犹龙腾——绘画"},{"key":"C","text":"来如雷霆收震怒，罢如江海凝清光——剑舞"},{"key":"D","text":"春工不与人争巧，玉笋羞拈五色丝——木雕"}]',
  'C',
  '【解析】本题为选是题。本题考查艺术。

A项错误。“镂金作胜传荆俗，翦彩为人起晋风”出自唐代李商隐的《人日即事》，意为：传承自荆州镂金工艺做得如此之好；流传自晋代的剪纸技艺是如此为人称道。对应的是剪纸。

B项错误。“兰亭茧纸入昭陵，世间遗迹犹龙腾”出自宋代苏轼的《孙莘老求墨妙亭诗》，意为：茧纸书写的《兰亭集序》真迹已埋入昭陵（李世民陵墓），人间还遗留下王羲之龙腾虎跃的字形。对应的是书法。

C项正确。“来如雷霆收震怒，罢如江海凝清光”出自唐代杜甫的《观公孙大娘弟子舞剑器行》，意为：起舞时剑势如雷霆万钧，令人屏息，收舞时平静，好象江海凝聚的波光。对应的是剑舞。

D项错误。“春工不与人争巧，玉笋羞拈五色丝”出自宋代王炎的《题杨秀才园三亭·绣春》，意为：春天有造化万物之工，但是不和人们争夺技艺，女子用手指头拿起五色丝线。对应的是刺绣。

本题答案为C项。',
  '常识判断',
  '2026-08-20'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.20'),
  1,
  '成语',
  '如数家珍',
  '指对所讲的事情十分熟悉。',
  '成语',
  '成语积累',
  'idiom',
  '成语||如数家珍|指对所讲的事情十分熟悉。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.20'),
  2,
  '成语',
  '齐心协力',
  '意思是认识一致，共同努力。',
  '成语',
  '成语积累',
  'idiom',
  '成语||齐心协力|意思是认识一致，共同努力。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.20'),
  3,
  '成语',
  '气定神宁',
  '形容一个人的神态镇定自若。',
  '成语',
  '成语积累',
  'idiom',
  '成语||气定神宁|形容一个人的神态镇定自若。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.20'),
  4,
  '成语',
  '千差万别',
  '形容差别大，均没有强调分布广。',
  '成语',
  '成语积累',
  'idiom',
  '成语||千差万别|形容差别大，均没有强调分布广。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.20'),
  5,
  '成语',
  '千帆竞发',
  '意思是数不尽的船只竞相出发，形容事物蓬勃向上，生机勃勃地向前发展。',
  '成语',
  '成语积累',
  'idiom',
  '成语||千帆竞发|意思是数不尽的船只竞相出发，形容事物蓬勃向上，生机勃勃地向前发展。',
  'learning',
  ''
);

COMMIT;
