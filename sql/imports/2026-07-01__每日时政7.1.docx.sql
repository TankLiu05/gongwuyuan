-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.1.docx
-- doc_date: 2026-07-01
-- generated_at: 2026-08-21T08:42:54.217Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.1.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.1.docx',
  '2026-07-01',
  '0087ff92b58526c7a34da6c3208f8e675b13cd4976f352d40790d6cd5f4aee1f',
  'imported',
  '{"paragraphs":61,"articles":5,"questions":5,"knowledge":9,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  1,
  '庆祝中国共产党成立105周年音乐会在京举行',
  '庆祝中国共产党成立105周年音乐会《人民至上》2026年6月29日晚在京举行。（时政来源：新华网）',
  '新华网',
  '2026-07-01',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  2,
  '重复使用火箭“力箭二号” 主发动机完成长程试车',
  '近日，由中科宇航研制的110吨级液氧煤油发动机力擎二号完成连续长程鉴定试车，全面考核了该发动机的工作可靠性，未来它将成为重复使用火箭“力箭二号”的主发动机。（时政来源：央视网）',
  '央视网',
  '2026-07-01',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  3,
  '首届“AI+OPC”创新发展大会在杭州举行',
  '2026年6月29日，首届“AI+OPC”创新发展大会（杭州）在浙江省杭州市上城区开幕。（时政来源：新华网）',
  '新华网',
  '2026-07-01',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  4,
  '朱雀三号重复使用遥二运载火箭顺利完成静态点火试验',
  '2026年6月29日，蓝箭航天朱雀三号重复使用遥二运载火箭在东风商业航天创新试验区顺利完成静态点火试验。（时政来源：人民网）',
  '人民网',
  '2026-07-01',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  5,
  '李强主持召开国务院常务会议',
  '国务院总理李强2026年6月29日主持召开国务院常务会议，听取人工智能发展情况汇报，研究当前外贸形势和贸易强国建设有关工作，审议通过《“十五五”碳达峰行动方案》和《国民健康“十五五”规划》。
会议指出，要守牢人工智能安全底线，完善科技伦理、测试认证等制度规则，构建动态适应、分级分类的安全监管体系，加强国际人工智能治理合作。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-01',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  1,
  'document',
  '单选',
  '庆祝中国共产党成立105周年音乐会（  ）2026年6月29日晚在京举行。',
  '[{"key":"A","text":"《东方红》"},{"key":"B","text":"《人民至上》"},{"key":"C","text":"《伟大征程》"},{"key":"D","text":"《百年风华》"}]',
  'B',
  '',
  '原题',
  '2026-07-01'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  2,
  'document',
  '单选',
  '近日，由中科宇航研制的110吨级液氧煤油发动机（  ）完成连续长程鉴定试车，全面考核了该发动机的工作可靠性，未来它将成为重复使用火箭“力箭二号”的主发动机。',
  '[{"key":"A","text":"天和二号"},{"key":"B","text":"力擎二号"},{"key":"C","text":"苍穹二号"},{"key":"D","text":"星火二号"}]',
  'B',
  '',
  '原题',
  '2026-07-01'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  3,
  'document',
  '单选',
  '2026年6月29日，首届“AI+OPC”创新发展大会在（  ）开幕。',
  '[{"key":"A","text":"成都"},{"key":"B","text":"广州"},{"key":"C","text":"武汉"},{"key":"D","text":"杭州"}]',
  'D',
  '',
  '原题',
  '2026-07-01'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  4,
  'document',
  '单选',
  '2026年6月29日，蓝箭航天（  ）重复使用遥二运载火箭在东风商业航天创新试验区顺利完成静态点火试验。',
  '[{"key":"A","text":"朱雀四号"},{"key":"B","text":"朱雀三号"},{"key":"C","text":"朱雀二号"},{"key":"D","text":"朱雀一号"}]',
  'B',
  '',
  '原题',
  '2026-07-01'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  5,
  'document',
  '单选',
  '国务院总理李强2026年6月29日主持召开国务院常务会议。会议指出，要构建（  ）的安全监管体系，加强国际人工智能治理合作。',
  '[{"key":"A","text":"源头管控、闭环处置"},{"key":"B","text":"动态适应、分级分类"},{"key":"C","text":"包容审慎、协同共治"},{"key":"D","text":"前瞻预判、全域覆盖"}]',
  'B',
  '',
  '原题',
  '2026-07-01'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  1,
  '历史上的今天',
  '1898年英国强租威海卫',
  '1898年英国强租威海卫',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1898年英国强租威海卫|1898年英国强租威海卫',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  2,
  '历史上的今天',
  '1900年清军、义和团与八国联军天津激战',
  '1900年清军、义和团与八国联军天津激战',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年清军、义和团与八国联军天津激战|1900年清军、义和团与八国联军天津激战',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  3,
  '历史上的今天',
  '1916年第一次世界大战中英法发动索姆河战役',
  '1916年第一次世界大战中英法发动索姆河战役',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1916年第一次世界大战中英法发动索姆河战役|1916年第一次世界大战中英法发动索姆河战役',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  4,
  '历史上的今天',
  '1941年世界上第一例电视广告在纽约播出',
  '1941年世界上第一例电视广告在纽约播出',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1941年世界上第一例电视广告在纽约播出|1941年世界上第一例电视广告在纽约播出',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  5,
  '历史上的今天',
  '1952年成渝铁路建成通车',
  '1952年成渝铁路建成通车',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1952年成渝铁路建成通车|1952年成渝铁路建成通车',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  6,
  '常识',
  '莫高窟',
  '莫高窟，俗称千佛洞，坐落在河西走廊西端的敦煌。它始建于十六国的前秦天王苻坚时期，后历经北朝、隋朝、唐朝、五代十国、西夏、元朝等历代的兴建，形成巨大的规模，有洞窟735个，壁画4.5万平方米、泥质彩塑2415尊，是世界上现存规模最大、内容最丰富的佛教艺术地。',
  '常识',
  '四大石窟',
  'common',
  '常识|四大石窟|莫高窟|莫高窟，俗称千佛洞，坐落在河西走廊西端的敦煌。它始建于十六国的前秦天王苻坚时期，后历经北朝、隋朝、唐朝、五代十国、西夏、元朝等历代的兴建，形成巨大的规模，有洞窟',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  7,
  '常识',
  '云冈石窟',
  '云冈石窟位于山西省大同市，是中国第一个规模巨大的石窟群，是东方石雕艺术的精魂，也是中西文化融合的典范，代表着公元5-6世纪佛教艺术的最高成就。它是当之无愧的中国瑰宝，与印度阿旃陀石窟、阿富汗巴米扬石窟并称为世界三大石雕艺术宝库。',
  '常识',
  '四大石窟',
  'common',
  '常识|四大石窟|云冈石窟|云冈石窟位于山西省大同市，是中国第一个规模巨大的石窟群，是东方石雕艺术的精魂，也是中西文化融合的典范，代表着公元5-6世纪佛教艺术的最高成就。它是当之无愧的中国',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  8,
  '常识',
  '龙门石窟',
  '龙门石窟位于河南省洛阳市，是世界上造像最多、规模最大的石刻艺术宝库，被联合国科教文组织评为“中国石刻艺术的最高峰”，位居中国各大石窟之首。龙门由大禹治水中所开凿，鱼跃龙门的传说亦发生于此。其石窟则始凿于北魏孝文帝年间，盛于唐，终于清末。历经10多个朝代陆续营造长达1400余年，是世界上营造时间最长的石窟。龙门石窟造像多为皇家贵族所建，是世界上绝无仅有的皇家石窟。',
  '常识',
  '四大石窟',
  'common',
  '常识|四大石窟|龙门石窟|龙门石窟位于河南省洛阳市，是世界上造像最多、规模最大的石刻艺术宝库，被联合国科教文组织评为“中国石刻艺术的最高峰”，位居中国各大石窟之首。龙门由大禹治水中所开凿',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.1.docx'),
  9,
  '常识',
  '麦积山石窟',
  '麦积山位于甘肃省天水市麦积区，因山形酷似麦垛而得名。麦积山石窟以其精美的泥塑艺术闻名世界，被誉为东方雕塑艺术陈列馆。麦积山风景区拥有丰富多样的生物类型和物种，被称为“陇上林泉之冠”，具有深厚的旅游价值，是丝绸古道黄金旅游线上的一颗耀眼的艺术明珠和最具潜力的旅游胜地。',
  '常识',
  '四大石窟',
  'common',
  '常识|四大石窟|麦积山石窟|麦积山位于甘肃省天水市麦积区，因山形酷似麦垛而得名。麦积山石窟以其精美的泥塑艺术闻名世界，被誉为东方雕塑艺术陈列馆。麦积山风景区拥有丰富多样的生物类型和物种，被',
  'learning',
  ''
);

COMMIT;
