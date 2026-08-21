-- Auto-generated import SQL
-- kind: daily-digest-backfill
-- filename: 每日积累8.21
-- doc_date: 2026-08-21
-- generated_at: 2026-08-21T08:42:54.228Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日积累8.21',
  'manual://每日积累8.21',
  '2026-08-21',
  '58366f1f4c0cd446c56c83fe088c1a7227266a545ac346297db4f24021e5a956',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.21');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.21');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日积累8.21');

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.21'),
  1,
  'digest',
  '单选',
  '习近平总书记指出，人口发展是关系中华民族伟大复兴的大事，必须着力提高人口整体素质，以人口高质量发展支撑中国式现代化。关于习近平总书记对人口高质量发展的重要指示，下列理解正确的有几项？①人口减少也有一些正面效应，比如倒逼经济发展从内涵式发展向外延式扩张转向②更加重视“引导”和“激励”的办法，主要依靠政府力量推动人口高质量发展③推动人口工作由调节数量为主向提升素质、稳定总量、优化结构、畅通流动转变④以消费结构升级引领产业转型升级，基础设施布局要考虑人口达峰和分布变化的影响⑤加快发展多层次、多支柱养老保险体系，强化第二、第三支柱养老保险',
  '[{"key":"A","text":"1项"},{"key":"B","text":"2项"},{"key":"C","text":"3项"},{"key":"D","text":"4项"}]',
  'C',
  '【解析】本题为选是题。本题考查时政。

①错误。根据《以人口高质量发展支撑中国式现代化》：……要辩证看待人口负增长带来的影响。我国用几十年时间走完发达国家上百年工业化道路，人口转变速度快，人口减少来得早，但总体上是符合世界现代化发展一般规律的。人口减少会对发展带来一些不利影响，比如劳动力减少、消费投资动能减弱。同时，人口减少也有一些正面效应，比如减轻资源环境压力、倒逼经济发展从外延式扩张转向内涵式发展。总的看，人口减少对经济社会发展影响利弊兼有，不能只看一面，有些问题要长期看，不能急于下结论，既要反对“人口决定论”，又要反对“人口无关论”，趋利避害做好工作。

②错误。根据《以人口高质量发展支撑中国式现代化》：……坚持以改革创新推动人口高质量发展。过去人口工作以“管”为主，今后工作覆盖面更广了、颗粒度更细了，要更加重视“引导”和“激励”的办法，由主要依靠政府力量向政府和社会协同治理转变。

③正确。根据《以人口高质量发展支撑中国式现代化》：……坚持以人口高质量发展促进经济社会高质量发展。我国已经进入推动高质量发展的关键时期，必须推动人口工作由调节数量为主向提升素质、稳定总量、优化结构、畅通流动转变，以人口高质量发展打造高素质人力资源，加快构建新发展格局，着力推动高质量发展。

④正确。根据《以人口高质量发展支撑中国式现代化》：……更好统筹人口与经济社会、资源环境的关系，维护人口安全。要顺应人口转变新趋势建设现代化产业体系。以消费结构升级引领产业转型升级，基础设施布局要考虑人口达峰和分布变化的影响。

⑤正确。根据《以人口高质量发展支撑中国式现代化》：……实施积极应对人口老龄化国家战略，努力实现老有所养、老有所为、老有所乐。要推进基本养老服务体系建设。完善基本养老服务清单制度，建立居家社区机构相协调、医养康养相结合的养老服务体系。要大力发展银发经济。支持养老产业规模化、标准化、集群化、品牌化发展，培育高精尖产品和高品质服务模式。要增强社会保险制度可持续性。加快发展多层次、多支柱养老保险体系，强化第二、第三支柱养老保险，健全基本医疗保险筹资和待遇调整机制。

理解正确的有③④⑤，3项。

本题答案为C项。',
  '常识判断',
  '2026-08-21'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.21'),
  1,
  '成语',
  '千头万绪',
  '指事物纷繁复杂。',
  '成语',
  '成语积累',
  'idiom',
  '成语||千头万绪|指事物纷繁复杂。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.21'),
  2,
  '成语',
  '千姿百态',
  '指形容姿态多种多样或种类十分丰富。',
  '成语',
  '成语积累',
  'idiom',
  '成语||千姿百态|指形容姿态多种多样或种类十分丰富。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.21'),
  3,
  '成语',
  '前功尽弃',
  '以前的努力全部白费。',
  '成语',
  '成语积累',
  'idiom',
  '成语||前功尽弃|以前的努力全部白费。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.21'),
  4,
  '成语',
  '前途未卜',
  '将来的前程、未来的发展没法预料，不知道是好是坏。',
  '成语',
  '成语积累',
  'idiom',
  '成语||前途未卜|将来的前程、未来的发展没法预料，不知道是好是坏。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日积累8.21'),
  5,
  '成语',
  '能屈能伸',
  '能弯曲也能伸直。指人能适应各种境遇，在失意时能忍耐，在得志时能施展抱负。',
  '成语',
  '成语积累',
  'idiom',
  '成语||能屈能伸|能弯曲也能伸直。指人能适应各种境遇，在失意时能忍耐，在得志时能施展抱负。',
  'learning',
  ''
);

COMMIT;
