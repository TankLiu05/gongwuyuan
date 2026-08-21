-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.19
-- doc_date: 2026-08-19
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.19',
  'manual://每日积累8.19',
  '2026-08-19',
  '27c1301a09dd2a9e945adb3f34c0d6acbe530ad43d31c5729620307fcbc4930e',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.19');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.19');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.19');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.19'),
  1,
  'digest',
  '单选',
  '西部地区在全国改革发展稳定大局中举足轻重。要一以贯之抓好党中央推动西部大开发政策举措的贯彻落实，进一步形成大保护、大开放、高质量发展新格局。关于新时代推动西部大开发，下列表述不正确的是（）。',
  '[{"key":"A","text":"要坚持把全面发展新兴产业作为主攻方向，加快西部地区产业转型升级"},{"key":"B","text":"要坚持以大开放促进大开发，提高西部地区对内对外开放水平"},{"key":"C","text":"要坚持统筹发展和安全，提升能源资源等重点领域安全保障能力"},{"key":"D","text":"要坚持推进新型城镇化和乡村全面振兴有机结合，在发展中保障和改善民生"}]',
  'A',
  'A项错误。总书记在重庆主持召开新时代推动西部大开发座谈会时强调：……要坚持把发展特色优势产业作为主攻方向，因地制宜发展新兴产业，加快西部地区产业转型升级。强化科技创新和产业创新深度融合，积极培养引进用好高层次科技创新人才，努力攻克一批关键核心技术。

B项正确。总书记在重庆主持召开新时代推动西部大开发座谈会时强调：……要坚持以大开放促进大开发，提高西部地区对内对外开放水平。大力推进西部陆海新通道建设，推动沿线地区开发开放，深度融入共建“一带一路”。

C项正确。总书记在重庆主持召开新时代推动西部大开发座谈会时强调：……要坚持统筹发展和安全，提升能源资源等重点领域安全保障能力。加快建设新型能源体系，做大做强一批国家重要能源基地。

D项正确。总书记在重庆主持召开新时代推动西部大开发座谈会时强调：……要坚持推进新型城镇化和乡村全面振兴有机结合，在发展中保障和改善民生。深入实施乡村振兴战略，加大对国家乡村振兴重点帮扶县支持力度，建立低收入人口和欠发达地区常态化帮扶机制，坚决防止发生规模性返贫。

本题答案为A项。',
  '常识判断',
  '2026-08-19'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.19'),
  1,
  '成语',
  '事半功倍',
  '指做事得法，因而费力小，收效大。',
  '成语',
  '成语积累',
  'idiom',
  '成语||事半功倍|指做事得法，因而费力小，收效大。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.19'),
  2,
  '成语',
  '适可而止',
  '指做到适当的程度就停止。',
  '成语',
  '成语积累',
  'idiom',
  '成语||适可而止|指做到适当的程度就停止。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.19'),
  3,
  '成语',
  '去伪存真',
  '去掉虚假的、表面的，保存真实的、本质的。',
  '成语',
  '成语积累',
  'idiom',
  '成语||去伪存真|去掉虚假的、表面的，保存真实的、本质的。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.19'),
  4,
  '成语',
  '任重道远',
  '意思是责任重大，路途遥远。比喻责任重大，要经历长期的奋斗。',
  '成语',
  '成语积累',
  'idiom',
  '成语||任重道远|意思是责任重大，路途遥远。比喻责任重大，要经历长期的奋斗。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.19'),
  5,
  '成语',
  '如履薄冰',
  '指好像踩着薄薄的冰，战战兢兢，比喻行事极为谨慎小心。',
  '成语',
  '成语积累',
  'idiom',
  '成语||如履薄冰|指好像踩着薄薄的冰，战战兢兢，比喻行事极为谨慎小心。',
  'learning',
  ''
);

COMMIT;
