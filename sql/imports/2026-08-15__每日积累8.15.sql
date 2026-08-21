-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.15
-- doc_date: 2026-08-15
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.15',
  'manual://每日积累8.15',
  '2026-08-15',
  'ef707a877e57e42bfb156bfca5b07561e44bd53ca837a9f0ea61a0117f0f54f0',
  'imported',
  '{"source":"daily-digest","idioms":5,"quotes":1,"questions":1,"warnings":[],"knowledge":6}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.15');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.15');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.15');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  1,
  'digest',
  '单选',
  '氢能将是打造未来能源体系，实现能源变革的重要媒介，下列说法错误的是（）。',
  '[{"key":"A","text":"氢能属于二次能源"},{"key":"B","text":"氢能资源丰富，可持续发展"},{"key":"C","text":"氢能是世界上最干净的能源"},{"key":"D","text":"氢只能以气态氢化物的形式出现"}]',
  'D',
  '本题考查科技。

A项正确，二次能源是由一次能源经过加工或转换得到的其他种类或形式的能源，氢气是人类利用阳光分解水制取而来的，所以氢能属于二次能源。

B项正确，氢元素是宇宙中含量最多的元素，在地球所有元素储量中居于第三，所以氢元素具有能源供给的充足性。同时大部分氢元素以水的形式存在于大自然，原料容易获取，资源丰富，容易被转化成氢能且可持续发展。

C项正确，氢能所燃烧的产物主要是水，所以氢能是世界上最干净的能源，同时被称为21世纪的“终极能源”。

D项错误，氢在自然界中可以以三种形式存在，即气态、液态和固态。

本题为选非题，故正确答案为D。',
  '常识判断',
  '2026-08-15'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  1,
  '成语',
  '克敌制胜',
  '指制服敌人，取得胜利。',
  '成语',
  '成语积累',
  'idiom',
  '成语||克敌制胜|指制服敌人，取得胜利。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  2,
  '成语',
  '有机可乘',
  '有机会可以利用，有空子可钻。',
  '成语',
  '成语积累',
  'idiom',
  '成语||有机可乘|有机会可以利用，有空子可钻。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  3,
  '成语',
  '攻无不克',
  '指没有攻占不下来的，形容力量无比强大。',
  '成语',
  '成语积累',
  'idiom',
  '成语||攻无不克|指没有攻占不下来的，形容力量无比强大。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  4,
  '成语',
  '纷至沓来',
  '形容纷纷到来，连续不断地到来。用于指人或事物。',
  '成语',
  '成语积累',
  'idiom',
  '成语||纷至沓来|形容纷纷到来，连续不断地到来。用于指人或事物。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  5,
  '成语',
  '所向披靡',
  '比喻力量达到的地方，一切障碍都被扫除。',
  '成语',
  '成语积累',
  'idiom',
  '成语||所向披靡|比喻力量达到的地方，一切障碍都被扫除。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.15'),
  6,
  '金句',
  '金句 · 修身立德',
  '“滴水穿石，一滴不可弃滞。”严于律己，贵在一以贯之，难在坚持不懈。牢记人民的利益高于一切，崇尚严于律己的品德，像珍惜生命一样珍惜自己的节操，不弃微末、久久为功，做一个一尘不染的人，我们就能在新征程上激昂精神、迸发力量、勇毅前行。 青年向上，未来可期。新时代新征程为青年一代成长搭建了广阔舞台，赋予年轻人无限可能。广大团员青年要自觉扣好人生第一粒扣子，严格履行团员义务，坚持从小事小节上加强修养，从一点一滴中完善自己，立大志、明大德、成大才、担大任，用奋斗书写青春华章。',
  '金句',
  '修身立德',
  'quote',
  '金句|修身立德|金句 · 修身立德|“滴水穿石，一滴不可弃滞。”严于律己，贵在一以贯之，难在坚持不懈。牢记人民的利益高于一切，崇尚严于律己的品德，像珍惜生命一样珍惜自己的节操，不弃微末、久久为功，',
  'learning',
  ''
);

COMMIT;
