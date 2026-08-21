-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政6.25.docx
-- doc_date: 2026-06-25
-- generated_at: 2026-08-21T08:42:54.216Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政6.25.docx',
  '/Users/tank/Desktop/每日时政/每日时政6.25.docx',
  '2026-06-25',
  '272dc12f73b8aa1d1b94330b8fa16675b76cef5591a0c369aba71521d3aad7d8',
  'imported',
  '{"paragraphs":66,"articles":5,"questions":5,"knowledge":7,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  1,
  '李强出席2026年夏季达沃斯论坛开幕式并致辞',
  '6月24日上午，国务院总理李强在大连出席2026年夏季达沃斯论坛开幕式并致辞。
李强表示，在国际形势愈发动荡不安背景下，中国经济不惧风雨、奋楫破浪，呈现出“稳、新、活、融”的一幅多维图景。
李强表示，创新驱动是中国经济长期向好、行稳致远的关键密码。多年来，中国经济之所以能够始终平稳健康发展，有两大要诀：一个是稳定的环境，一个是创新的驱动。
李强表示，创新合作是破解全球增长困境的必然选择。（时政来源：新华网）',
  '新华网',
  '2026-06-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  2,
  '民族团结进步促进法是30多年来第一部设序言的法律',
  '国务院新闻办公室2026年6月24日举行新闻发布会，介绍《中华人民共和国民族团结进步促进法》和我国民族工作有关情况。记者从新闻发布会上了解到，民族团结进步促进法是新时代实施宪法有关规定、处理民族事务和开展民族工作的基本法律。在体例上专门设置序言，是30多年来第一部设置序言的法律，凸显了这部法律的政治性、原则性、宣示性、导向性。（时政来源：新华网）',
  '新华网',
  '2026-06-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  3,
  '中国超算“灵晟”登顶全球超算500强新榜单',
  '2026年6月23日在德国汉堡发布的第67期全球超级计算机500强榜单显示，首次入榜的中国超级计算机“灵晟”位列榜首。这是自2017年“神威·太湖之光”以后，中国超算再次登顶榜单。（时政来源：新华网）',
  '新华网',
  '2026-06-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  4,
  '最高检发布《中国未成年人检察工作40年发展报告》',
  '2026年是我国未成年人检察工作创建‌40周年。2026年6月23日上午，最高人民检察院举行“未成年人检察工作40年”新闻发布会，发布《中国未成年人检察工作40年发展报告》和未成年人检察40年大事记，并介绍有关情况。
报告提到，未成年人检察实行“四大检察”综合履职，加强综合司法保护，是一个重要亮点。（时政来源：人民网）',
  '人民网',
  '2026-06-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  5,
  '《习近平党建文选》第一卷、第二卷出版发行',
  '中共中央党史和文献研究院编辑的《习近平党建文选》第一卷、第二卷，近日由中央文献出版社出版，在全国发行。
党的十八大以来，以习近平同志为核心的党中央围绕建设什么样的长期执政的马克思主义政党、怎样建设长期执政的马克思主义政党的重大时代课题，提出一系列新理念新思想新战略，形成习近平党建思想。习近平党建思想源自于马克思主义科学理论，植根于中华优秀传统文化，孕育于XIN时代全面从严治党的伟大实践，具有坚实的实践基础和深厚的理论渊源，是加强新时代党的建设的根本遵循。（时政来源：央视网）',
  '央视网',
  '2026-06-25',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  1,
  'document',
  '单选',
  '6月24日上午，国务院总理李强在大连出席2026年夏季达沃斯论坛开幕式并致辞表示，多年来，中国经济之所以能够始终平稳健康发展，有两大要诀：一个是（  ），一个是（  ）。',
  '[{"key":"A","text":"扩大内需潜力；深化改革开放"},{"key":"B","text":"广阔的市场；完善的产业"},{"key":"C","text":"稳定的环境；创新的驱动"},{"key":"D","text":"持续的改革；全面的开放"}]',
  'C',
  '',
  '原题',
  '2026-06-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  2,
  'document',
  '单选',
  '（  ）在体例上专门设置序言，是30多年来第一部设置序言的法律，凸显了这部法律的政治性、原则性、宣示性、导向性。',
  '[{"key":"A","text":"《中华人民共和国生态环境法典》"},{"key":"B","text":"《中华人民共和国民族团结进步促进法》"},{"key":"C","text":"《中华人民共和国国家发展规划法》"},{"key":"D","text":"《中华人民共和国民营经济促进法》"}]',
  'B',
  '',
  '原题',
  '2026-06-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  3,
  'document',
  '单选',
  '2026年6月23日在德国汉堡发布的第67期全球超级计算机500强榜单显示，首次入榜的中国超级计算机（  ）位列榜首。',
  '[{"key":"A","text":"“灵晟”"},{"key":"B","text":"“神威·太湖之光”"},{"key":"C","text":"“天河一号”"},{"key":"D","text":"“天河二号”"}]',
  'A',
  '',
  '原题',
  '2026-06-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  4,
  'document',
  '单选',
  '2026年6月23日上午，最高人民检察院举行“未成年人检察工作40年”新闻发布会，发布《中国未成年人检察工作40年发展报告》。报告提到，未成年人检察实行（  ）综合履职，加强综合司法保护，是一个重要亮点。',
  '[{"key":"A","text":"“两大检察”"},{"key":"B","text":"“三大检察”"},{"key":"C","text":"“四大检察”"},{"key":"D","text":"“五大检察”"}]',
  'C',
  '',
  '原题',
  '2026-06-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  5,
  'document',
  '单选',
  '中共中央党史和文献研究院编辑的《习近平党建文选》第一卷、第二卷，近日由中央文献出版社出版，在全国发行。党的十八大以来，以习近平同志为核心的党中央围绕（  ）的重大时代课题，提出一系列新理念新思想新战略，形成习近平党建思想。',
  '[{"key":"A","text":"建设什么样的社会主义现代化强国、怎样建设社会主义现代化强国"},{"key":"B","text":"建设什么样的中华民族现代文明、怎样建设中华民族现代文明"},{"key":"C","text":"建设什么样的中国式现代化、怎样推进中国式现代化"},{"key":"D","text":"建设什么样的长期执政的马克思主义政党、怎样建设长期执政的马克思主义政党"}]',
  'D',
  '',
  '原题',
  '2026-06-25'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  1,
  '历史上的今天',
  '1859年第二次大沽之战发生',
  '1859年第二次大沽之战发生',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1859年第二次大沽之战发生|1859年第二次大沽之战发生',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  2,
  '历史上的今天',
  '1866年左宗棠在福建奏设船政学堂，成为中国最早的海军学校',
  '1866年左宗棠在福建奏设船政学堂，成为中国最早的海军学校',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1866年左宗棠在福建奏设船政学堂，成为中国最早的海军学校|1866年左宗棠在福建奏设船政学堂，成为中国最早的海军学校',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  3,
  '历史上的今天',
  '1929年蒋桂战争结束',
  '1929年蒋桂战争结束',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1929年蒋桂战争结束|1929年蒋桂战争结束',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  4,
  '历史上的今天',
  '1948年苏联对柏林实行封锁',
  '1948年苏联对柏林实行封锁',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1948年苏联对柏林实行封锁|1948年苏联对柏林实行封锁',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  5,
  '历史上的今天',
  '1951年世界首次播出彩色电视节目',
  '1951年世界首次播出彩色电视节目',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1951年世界首次播出彩色电视节目|1951年世界首次播出彩色电视节目',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  6,
  '常识',
  '罗布泊',
  '罗布泊，是新疆东南部的湖泊，由于形状宛如人耳，被誉为“地球之耳”，又被称作“死亡之海”。这里夏季高温，地表最高温度可达70摄氏度左右。',
  '常识',
  '中国四大无人区',
  'common',
  '常识|中国四大无人区|罗布泊|罗布泊，是新疆东南部的湖泊，由于形状宛如人耳，被誉为“地球之耳”，又被称作“死亡之海”。这里夏季高温，地表最高温度可达70摄氏度左右。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.25.docx'),
  7,
  '常识',
  '阿尔金',
  '阿尔金，位于阿尔金山南部东昆仑山北部，被誉为“东方沙漠明珠”。这片土地极度贫瘠，水源匮乏，植被稀少，几乎没有可供人类生存的自然资源。加之地势险峻，气候干燥，温差大，给人类的生存带来了巨大的挑战。
可可西里
可可西里，位于西藏-新疆-青海之交，是我国最大的无人区，是一个巨大的天然野生动物园。这里被称为“生命禁区”，空气中含氧量低，气候变化反复无常，湖泊虽多，却都是盐碱水，十分不利于生存。
西藏
羌塘羌塘无人区，位于西藏自治区那曲市与阿里地区，这里是中国海拔最高、面积最大的自然保护区，这里高寒缺氧、交通不便，人类无法适应这里的生存环境。',
  '常识',
  '中国四大无人区',
  'common',
  '常识|中国四大无人区|阿尔金|阿尔金，位于阿尔金山南部东昆仑山北部，被誉为“东方沙漠明珠”。这片土地极度贫瘠，水源匮乏，植被稀少，几乎没有可供人类生存的自然资源。加之地势险峻，气候干燥，温差',
  'learning',
  ''
);

COMMIT;
