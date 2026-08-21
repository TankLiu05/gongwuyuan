-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.13.docx
-- doc_date: 2026-07-13
-- generated_at: 2026-08-21T08:42:54.220Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.13.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.13.docx',
  '2026-07-13',
  'c7aecdd4f51b04373ddc3f868304bf621e761f6749556a39272798c3af48d696',
  'imported',
  '{"paragraphs":75,"articles":5,"questions":5,"knowledge":7,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  1,
  '习近平同纳米比亚总统恩代特瓦会谈',
  '2026年7月10日下午，国家主席习近平在北京人民大会堂同来华进行国事访问的纳米比亚总统恩代特瓦举行会谈。两国领导人共同宣布将双边关系定位提升为新时代中纳命运共同体。（时政来源：央视网）',
  '央视网',
  '2026-07-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  2,
  '《中朝友好合作互助条约》签订65周年',
  '2026年7月11日，中共中央总书记、国家主席习近平同朝鲜劳动党总书记、国务委员会委员长金正恩就《中朝友好合作互助条约》签订65周年互致贺电。（时政来源：央视网）',
  '央视网',
  '2026-07-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  3,
  '2025年我国港口货物、集装箱吞吐量稳居世界第一',
  '2026年7月11日是第22个中国航海日，也是“世界海事日”在我国的实施日。今年活动主题为“数智赋能，领航未来”。
记者当日从交通运输部了解到，2025年，我国港口货物吞吐量183亿吨，集装箱吞吐量3.54亿标箱，稳居世界第一。（时政来源：新华网）',
  '新华网',
  '2026-07-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  4,
  '《能源领域节能降碳行动计划（2026—2028年）》发布',
  '国家能源局日前发布《能源领域节能降碳行动计划（2026—2028年）》，提出到2028年，非化石能源消费比重年均提升约1个百分点；合理控制煤电机组供电煤耗，达到现行能效标杆水平的煤电产能比例力争提高15个百分点；建成一批零碳低碳煤炭矿区、油区；支持建成一批零碳园区，重点行业节能降碳取得显著进展，绿色用能水平不断提升。（时政来源：人民网）',
  '人民网',
  '2026-07-13',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  5,
  '八大山人诞辰400周年特展开展',
  '2026年7月10日，“高山仰止 墨染千秋——八大山人诞辰400周年特展”在江西南昌正式开展。作为史上规模最大的八大山人艺术展，此次开展备受关注。
八大山人原名朱耷，江西南昌人，以水墨写意画著称，擅画山水、花鸟，被联合国教科文组织评为“中国古代十大文化名人”，今年是其诞辰400周年。（时政来源：人民网）',
  '人民网',
  '2026-07-13',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  1,
  'document',
  '单选',
  '2026年7月10日下午，国家主席习近平在北京人民大会堂同来华进行国事访问的纳米比亚总统恩代特瓦举行会谈。两国领导人共同宣布将双边关系定位提升为（  ）。',
  '[{"key":"A","text":"新时代中纳命运共同体"},{"key":"B","text":"全方位战略协作伙伴关系"},{"key":"C","text":"新时代全天候战略伙伴关系"},{"key":"D","text":"全面战略合作伙伴关系"}]',
  'A',
  '',
  '原题',
  '2026-07-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  2,
  'document',
  '单选',
  '2026年7月11日，中共中央总书记、国家主席习近平同朝鲜劳动党总书记、国务委员会委员长金正恩就《中朝友好合作互助条约》签订（  ）周年互致贺电。',
  '[{"key":"A","text":"60"},{"key":"B","text":"65"},{"key":"C","text":"55"},{"key":"D","text":"50"}]',
  'B',
  '',
  '原题',
  '2026-07-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  3,
  'document',
  '单选',
  '2026年（  ）是第22个中国航海日。记者当日从交通运输部了解到，2025年，我国港口货物吞吐量183亿吨，集装箱吞吐量3.54亿标箱，稳居（  ）。',
  '[{"key":"A","text":"7月11日；世界第一"},{"key":"B","text":"7月12日；世界第一"},{"key":"C","text":"7月13日；世界第二"},{"key":"D","text":"7月12日；世界第二"}]',
  'A',
  '',
  '原题',
  '2026-07-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  4,
  'document',
  '单选',
  '国家能源局日前发布《能源领域节能降碳行动计划（2026—2028年）》，提出到2028年，非化石能源消费比重年均（  ）；合理控制煤电机组供电煤耗，达到现行能效标杆水平的煤电产能比例力争（  ）。',
  '[{"key":"A","text":"降低约15个百分点；降低1个百分点"},{"key":"B","text":"降低约1个百分点；提高15个百分点"},{"key":"C","text":"提升约1个百分点；提高15个百分点"},{"key":"D","text":"提升约1个百分点；降低1个百分点"}]',
  'C',
  '',
  '原题',
  '2026-07-13'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  5,
  'document',
  '单选',
  '2026年7月10日，“高山仰止 墨染千秋——八大山人诞辰400周年特展”在江西南昌正式开展。八大山人原名（  ），江西南昌人，被联合国教科文组织评为“中国古代十大文化名人”。',
  '[{"key":"A","text":"朱宸濠"},{"key":"B","text":"朱允炆"},{"key":"C","text":"朱权"},{"key":"D","text":"朱耷"}]',
  'D',
  '',
  '原题',
  '2026-07-13'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  1,
  '历史上的今天',
  '1900年八国联军攻陷天津烧杀抢掠',
  '1900年八国联军攻陷天津烧杀抢掠',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年八国联军攻陷天津烧杀抢掠|1900年八国联军攻陷天津烧杀抢掠',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  2,
  '历史上的今天',
  '1908年第四届奥运会在伦敦开幕',
  '1908年第四届奥运会在伦敦开幕',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1908年第四届奥运会在伦敦开幕|1908年第四届奥运会在伦敦开幕',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  3,
  '历史上的今天',
  '1924年反帝运动大联盟成立',
  '1924年反帝运动大联盟成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1924年反帝运动大联盟成立|1924年反帝运动大联盟成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  4,
  '历史上的今天',
  '1950年东北边防军组成',
  '1950年东北边防军组成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1950年东北边防军组成|1950年东北边防军组成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  5,
  '历史上的今天',
  '1956年宝成铁路全线接轨',
  '1956年宝成铁路全线接轨',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1956年宝成铁路全线接轨|1956年宝成铁路全线接轨',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  6,
  '常识',
  '简介',
  '二十四史是中国古代24部官方认定的纪传体正史，清代乾隆年间正式定名。全书共3249卷，约4000万字，记载上起黄帝、下至明朝崇祯十七年（1644年）的历史，覆盖古代政治、经济、文化等各领域。
注意：二十四史并非对应24个朝代，部分内容有交叉；全部为纪传体，编年体史书不在其列。',
  '常识',
  '二十四史',
  'common',
  '常识|二十四史|简介|二十四史是中国古代24部官方认定的纪传体正史，清代乾隆年间正式定名。全书共3249卷，约4000万字，记载上起黄帝、下至明朝崇祯十七年（1644年）的历史，覆盖',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.13.docx'),
  7,
  '常识',
  '五大板块核心考点',
  '1.前四史（史学评价最高）
《史记》：西汉司马迁著，二十四史之首，我国第一部纪传体通史，被称为“史家之绝唱，无韵之离骚”。
《汉书》：东汉班固著，我国第一部纪传体断代史，仅记载西汉一朝历史。
《后汉书》：南朝宋范晔著，记载东汉历史。
《三国志》：西晋陈寿著，记载三国历史，南朝裴松之的注补充了大量关键史料。
2.九书二史
共11部，记载两晋、南北朝及隋朝历史。包含9部单朝断代史，以及李延寿所著、分别贯通南朝、北朝多个朝代的《南史》《北史》。
3.两旧两新
记载唐朝与五代历史，每个阶段各有新旧两部正史：
唐代：《旧唐书》（五代成书）、《新唐书》（北宋欧阳修等主持修订）
五代：《旧五代史》、《新五代史》（欧阳修私修，是唐代以后唯一一部私修正史）
4.元修三史
元朝脱脱主持修撰的《宋史》《辽史》《金史》，承认宋、辽、金三朝各为正统。其中《宋史》是二十四史中篇幅最庞大的一部。
5.元明二史
《元史》：明初修成，成书速度快，保留了大量元代原始档案。
《明史》：清代官方修撰，历时近百年，是二十四史中修撰时间最长、整体质量较高的一部。
【总结】
二十四史最经典、地位最高的是“前四史”，其中只有《史记》是贯穿多个时代的通史，剩下的基本只写一个或几个朝代；二十四史全是纪传体、只写到明朝、《史记》地位最高、《宋史》最厚、《明史》修得最久、《新五代史》是私人写的正史。',
  '常识',
  '二十四史',
  'common',
  '常识|二十四史|五大板块核心考点|1.前四史（史学评价最高）
《史记》：西汉司马迁著，二十四史之首，我国第一部纪传体通史，被称为“史家之绝唱，无韵之离骚”。
《汉书》：东汉班固著，我国第一部纪传',
  'learning',
  ''
);

COMMIT;
