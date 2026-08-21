-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.14
-- doc_date: 2026-08-14
-- generated_at: 2026-08-21T08:42:54.227Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.14',
  'manual://每日积累8.14',
  '2026-08-14',
  'a112c74a364d8302b53c799a56ffe7b15ba7ee493b6c2b705068f103a9899d7a',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.14');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.14');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.14');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  1,
  'digest',
  '单选',
  '中华优秀传统文化有很多重要元素，共同塑造出中华文明的突出特性，其中之一就是具有突出的创新性。对于中华文明具有突出的创新性，下列理解正确的是（）。①从根本上决定了中华文化对世界文明兼收并蓄的开放胸怀②从根本上决定了中华民族守正不守旧、尊古不复古的进取精神③从根本上决定了中华民族不惧新挑战、勇于接受新事物的无畏品格④从根本上决定了中华民族交往交流交融的历史取向',
  '[{"key":"A","text":"①②"},{"key":"B","text":"②③"},{"key":"C","text":"①④"},{"key":"D","text":"③④"}]',
  'B',
  '【解析】本题为选是题。本题考查时政。

2023年6月2日，中共中央总书记、国家主席、中央军委主席习近平在北京出席文化传承发展座谈会并发表重要讲话。

①④错误。中华文明具有突出的包容性，从根本上决定了中华民族交往交流交融的历史取向，决定了中国各宗教信仰多元并存的和谐格局，决定了中华文化对世界文明兼收并蓄的开放胸怀。 

②③正确。中华文明具有突出的创新性，从根本上决定了中华民族守正不守旧、尊古不复古的进取精神，决定了中华民族不惧新挑战、勇于接受新事物的无畏品格。

理解正确的是②③。

本题答案为B项。',
  '常识判断',
  '2026-08-14'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  1,
  '成语',
  '拾遗补缺',
  '指补充他人遗漏或缺失的地方。',
  '成语',
  '成语积累',
  'idiom',
  '成语||拾遗补缺|指补充他人遗漏或缺失的地方。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  2,
  '成语',
  '矢志不渝',
  '立志不会改变，表示永远不变心。',
  '成语',
  '成语积累',
  'idiom',
  '成语||矢志不渝|立志不会改变，表示永远不变心。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  3,
  '成语',
  '势不可挡',
  '比喻来势凶猛，不可阻挡。',
  '成语',
  '成语积累',
  'idiom',
  '成语||势不可挡|比喻来势凶猛，不可阻挡。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  4,
  '成语',
  '势在必行',
  '意思是不能躲开或回避；从事情发展的趋势看，必须采取行动。',
  '成语',
  '成语积累',
  'idiom',
  '成语||势在必行|意思是不能躲开或回避；从事情发展的趋势看，必须采取行动。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  5,
  '成语',
  '势如破竹',
  '比喻节节胜利，毫无阻碍。',
  '成语',
  '成语积累',
  'idiom',
  '成语||势如破竹|比喻节节胜利，毫无阻碍。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.14'),
  6,
  '金句',
  '金句 · 人民至上',
  '为民服务只有进行时没有完成时。想群众之所想，急群众之所急，解群众之所难，这是中国共产党人的价值追求，也是满足人民日益增长的美好生活需要的必然要求。 “保障和改善民生没有终点，只有连续不断的新起点”。当前，我国社会建设成绩斐然，人民生活福祉达到新的水平，但民生保障还存在短板，社会治理仍有弱项，需要我们继续坚持以人民为中心的发展思想，把促进发展、保障民生放在突出位置，完善共建共治共享的社会治理制度，扎实推动共同富裕，让改革发展成果更多更公平惠及广大人民群众，推动社会建设达到更高水平。',
  '金句',
  '人民至上',
  'quote',
  '金句|人民至上|金句 · 人民至上|为民服务只有进行时没有完成时。想群众之所想，急群众之所急，解群众之所难，这是中国共产党人的价值追求，也是满足人民日益增长的美好生活需要的必然要求。 “保障和改善',
  'learning',
  ''
);

COMMIT;
