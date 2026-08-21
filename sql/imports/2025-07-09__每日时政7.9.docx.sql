-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.9.docx
-- doc_date: 2025-07-09
-- generated_at: 2026-08-21T08:42:54.215Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.9.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.9.docx',
  '2025-07-09',
  '474ae2213c04a23e744f6419b0889fc027ca656155709e432121bc94f5c09381',
  'imported',
  '{"paragraphs":65,"articles":5,"questions":5,"knowledge":6,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  1,
  '陈立泉院士、贲德院士获得国家最高科学技术奖',
  '2025年度国家科学技术奖于2026年7月8日揭晓。其中，国家最高科学技术奖分别授予中国科学院物理研究所陈立泉院士、中国电子科技集团第十四研究所贲德院士。（时政来源：央视网）',
  '央视网',
  '2025-07-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  2,
  '我国起吊能力最大全回转半潜起重船今天交付投用',
  '2026年7月8日，我国起吊能力最大全回转半潜起重船“四航永盛”号在广东江门正式交付。（时政来源：央广网）',
  '央广网',
  '2025-07-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  3,
  '城乡三级养老服务网络建设管理指引发布',
  '2026年7月8日，民政部在京召开发布会，发布《城乡三级养老服务网络建设管理指引》。
《管理指引》指出，要整合县级特困人员供养服务机构等各类资源，在县（市、区、旗）设置综合养老服务管理平台，承担服务示范、行业指导、资源协调等职能，推广智慧管理，利用智能设备对老年人状况和需求进行精准画像并及时匹配服务，统筹推动区域养老服务协同发展。依托条件较好的乡镇（街道）特困人员供养服务机构、优质民办养老机构、综合为老服务中心等设置区域养老服务中心。在村（社区）设立养老服务设施站点，大力发展嵌入式社区养老服务设施、互助性养老服务站点，就近就便提供居家上门或社区养老服务。（时政来源：央视网）',
  '央视网',
  '2025-07-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  4,
  '文化和旅游部印发《旅游强国建设“十五五”规划》',
  '经国务院批复同意，文化和旅游部近日印发《旅游强国建设“十五五”规划》。这是首个以“旅游强国”为主题的国家级专项规划。
《规划》要求，坚持旅游为民，推进文旅深度融合，统筹政府与市场、供给与需求、保护与开发、国内与国际、发展与安全，着力完善现代旅游业体系，让旅游业更好服务美好生活、促进经济发展、构筑精神家园、展示中国形象、增进文明互鉴。
《规划》明确，到2030年，旅游业高质量发展取得明显成效，现代旅游业体系更加完善，旅游强国建设取得显著进展。（时政来源：央视网）',
  '央视网',
  '2025-07-09',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  5,
  '宣传贯彻实施生态环境法典座谈会',
  '中共中央政治局委员、全国人大常委会副委员长李鸿忠2026年7月7日在京出席宣传贯彻实施生态环境法典座谈会并讲话。
李鸿忠强调，生态环境法典经十四届全国人大四次会议表决通过，将于2026年8月15日起施行。要以习近平生态文明思想作为法典实施的根本遵循，坚持党的全面领导，保持加强生态文明建设的战略定力；坚持绿水青山就是金山银山理念，统筹推进高质量发展和高水平保护；坚持以人民为中心的发展思想，更好满足人民群众对优美生态环境的需要；坚持共谋全球生态文明建设之路，为建设清洁美丽世界作出中国贡献。（时政来源：人民网）',
  '人民网',
  '2025-07-09',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  1,
  'document',
  '单选',
  '2025年度国家科学技术奖于2026年7月8日揭晓。其中，国家最高科学技术奖分别授予中国科学院物理研究所（  ）院士、中国电子科技集团第十四研究所（  ）院士。',
  '[{"key":"A","text":"陈立泉；贲德"},{"key":"B","text":"钱七虎；黄旭华"},{"key":"C","text":"王大中；李德仁"},{"key":"D","text":"薛其坤；曾庆存"}]',
  'A',
  '',
  '原题',
  '2025-07-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  2,
  'document',
  '单选',
  '2026年7月8日，我国起吊能力最大全回转半潜起重船（  ）在广东江门正式交付。',
  '[{"key":"A","text":"“海宏”号"},{"key":"B","text":"“四航永盛”号"},{"key":"C","text":"“海洋力士”号"},{"key":"D","text":"“四航永兴”号"}]',
  'B',
  '',
  '原题',
  '2025-07-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  3,
  'document',
  '单选',
  '2026年7月8日，民政部在京召开发布会，发布《城乡三级养老服务网络建设管理指引》。《管理指引》指出，依托条件较好的（  ）特困人员供养服务机构、优质民办养老机构、综合为老服务中心等设置区域养老服务中心。',
  '[{"key":"A","text":"乡镇（街道）"},{"key":"B","text":"县级"},{"key":"C","text":"村（社区）"},{"key":"D","text":"中心城市"}]',
  'A',
  '',
  '原题',
  '2025-07-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  4,
  'document',
  '单选',
  '经国务院批复同意，文化和旅游部近日印发《旅游强国建设“十五五”规划》。《规划》要求，坚持旅游为民，推进文旅深度融合，统筹政府与市场、供给与需求、（  ）、国内与国际、发展与安全，着力完善现代旅游业体系，让旅游业更好服务美好生活、促进经济发展、构筑精神家园、展示中国形象、增进文明互鉴。',
  '[{"key":"A","text":"速度与规模"},{"key":"B","text":"传统与效益"},{"key":"C","text":"保护与开发"},{"key":"D","text":"发展与利用"}]',
  'C',
  '',
  '原题',
  '2025-07-09'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  5,
  'document',
  '单选',
  '中共中央政治局委员、全国人大常委会副委员长李鸿忠2026年7月7日在京出席宣传贯彻实施生态环境法典座谈会并讲话。下列选项中有助于贯彻实施生态环境法典的有几项？（  ）
①坚持共谋全球生态文明建设之路
②坚持以人民为中心的发展思想
③坚持绿水青山就是金山银山理念
④坚持党的全面领导',
  '[{"key":"A","text":"1项"},{"key":"B","text":"2项"},{"key":"C","text":"3项"},{"key":"D","text":"4项"}]',
  'D',
  '',
  '原题',
  '2025-07-09'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  1,
  '历史上的今天',
  '1926年国民革命军誓师北伐',
  '1926年国民革命军誓师北伐',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1926年国民革命军誓师北伐|1926年国民革命军誓师北伐',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  2,
  '历史上的今天',
  '1929年中国第一支少数民族红军创建',
  '1929年中国第一支少数民族红军创建',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1929年中国第一支少数民族红军创建|1929年中国第一支少数民族红军创建',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  3,
  '历史上的今天',
  '1938年三民主义青年团(三青团)成立',
  '1938年三民主义青年团(三青团)成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1938年三民主义青年团(三青团)成立|1938年三民主义青年团(三青团)成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  4,
  '历史上的今天',
  '1949年鞍山钢铁公司正式开工',
  '1949年鞍山钢铁公司正式开工',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年鞍山钢铁公司正式开工|1949年鞍山钢铁公司正式开工',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  5,
  '历史上的今天',
  '1971年基辛格秘密访华',
  '1971年基辛格秘密访华',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1971年基辛格秘密访华|1971年基辛格秘密访华',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.9.docx'),
  6,
  '常识',
  '三大法宝、三大作风、三个灵魂',
  '三大法宝：统一战线、武装斗争、党的建设。
1939年10月，毛泽东在撰写《<共产党人>发刊词》、论述新民主主义理论时，指出：“统一战线、武装斗争、党的建设，是中国共产党在中国革命中战胜敌人的三个法宝”。“三大法宝”的核心是党的建设。
三大作风：理论联系实际、密切联系群众、批评与自我批评。
毛泽东同志在1945年4月24日党的第七次全国代表大会上所作的《论联合政府》的政治报告中总结了二十四年党建的基本经验，第一次提出了党的三大作风的理论，即理论联系实际，密切联系群众、批评和自我批评的作风。党的三大作风是党的三大优良传统。
三个活的灵魂：“实事求是、独立自主、群众路线”
在1981年党的十一届六中全会通过的《关于建国以来党的若干历史问题的决议》中，将“实事求是、独立自主、群众路线”概括成为毛泽东思想“三个活的灵魂”。',
  '常识',
  '三大法宝、三大作风、三个灵魂',
  'common',
  '常识|三大法宝、三大作风、三个灵魂|三大法宝、三大作风、三个灵魂|三大法宝：统一战线、武装斗争、党的建设。
1939年10月，毛泽东在撰写《<共产党人>发刊词》、论述新民主主义理论时，指出：“统一战线、武装斗争、党的建设，是中',
  'learning',
  ''
);

COMMIT;
