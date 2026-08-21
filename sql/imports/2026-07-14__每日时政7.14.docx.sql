-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.14.docx
-- doc_date: 2026-07-14
-- generated_at: 2026-08-21T08:42:54.220Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.14.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.14.docx',
  '2026-07-14',
  '775d12789237fc706a3dd18c447805123ad67dbd92f131fddf6dc99252c7b669',
  'imported',
  '{"paragraphs":63,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  1,
  '国内首次成品油长输管道顺序输送甲醇现场试验完成',
  '国家管网集团2026年7月13日宣布，国内首次成品油长输管道顺序输送甲醇现场试验在陕西咸阳顺利完成。这标志着我国成品油管道顺序输送甲醇技术实现从理论探索到工程验证的关键跨越，为跨区域绿色甲醇安全、高效输送提供了完整技术方案与实践示范。（时政来源：新华网）',
  '新华网',
  '2026-07-14',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  2,
  '刘国中在北京调研',
  '中共中央政治局委员、国务院副总理刘国中2026年7月12日到北京调研。他强调，要深入学习贯彻习近平总书记重要指示批示精神和中央政治局会议精神，贯彻落实国务院常务会议部署，牢固树立底线思维、极限思维，全面压实政治责任，落实落细暴雨洪水防御应对措施，全力以赴抓好水库安全度汛工作，切实保障人民群众生命财产安全。（时政来源：人民网）',
  '人民网',
  '2026-07-14',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  3,
  '新中国第一辆汽车下线70年了',
  '1956年7月13日，新中国第一辆国产解放牌卡车在长春第一汽车制造厂驶下生产线，结束了新中国不能制造汽车的历史，开启了中国汽车工业从无到有、从弱到强的征程。
2026年7月13日，新中国第一辆汽车下线迎来70周年，中国汽车工业协会与中国第一汽车集团有限公司在长春举办系列活动，纪念这一历史性时刻。（时政来源：新华网）',
  '新华网',
  '2026-07-14',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  4,
  '《南海仲裁案裁决新批驳》报告发布',
  '2026年是菲律宾单方面提起的所谓“南海仲裁案裁决”出台第十年。10年来，“南海仲裁案裁决”的非法性和荒谬性，以及给中菲关系和地区局势带来的伤害已暴露无遗，全面清理其遗毒刻不容缓。2026年7月13日上午，南海安全圆桌对话在香港开幕，会议期间发布《南海仲裁案裁决新批驳》报告。（时政来源：环球网）',
  '环球网',
  '2026-07-14',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  5,
  '中国队斩获艺术体操世界杯集体全能年度总冠军',
  '北京时间7月12日，2026年世界体联艺术体操世界杯米兰站结束集体全能项目争夺，中国艺术体操队以总分55.850分收获银牌。凭借索菲亚、塔什干、米兰这三站的稳定发挥，中国队成功摘得本年度世界杯系列赛集体全能总冠军，实现该奖项三连冠。（时政来源：人民网）',
  '人民网',
  '2026-07-14',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  1,
  'document',
  '单选',
  '国家管网集团2026年7月13日宣布，国内首次成品油长输管道顺序输送（  ）现场试验在陕西咸阳顺利完成。这标志着我国成品油管道顺序输送（  ）技术实现从理论探索到工程验证的关键跨越。',
  '[{"key":"A","text":"甲醇"},{"key":"B","text":"甲烷"},{"key":"C","text":"乙醇"},{"key":"D","text":"二甲醚"}]',
  'A',
  '',
  '原题',
  '2026-07-14'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  2,
  'document',
  '单选',
  '中共中央政治局委员、国务院副总理刘国中2026年7月12日到北京调研。他强调，要牢固树立（  ），全面压实政治责任，落实落细暴雨洪水防御应对措施，全力以赴抓好水库安全度汛工作，切实保障人民群众生命财产安全。',
  '[{"key":"A","text":"创新思维、历史思维"},{"key":"B","text":"底线思维、极限思维"},{"key":"C","text":"法治思维、辩证思维"},{"key":"D","text":"战略思维、历史思维"}]',
  'B',
  '',
  '原题',
  '2026-07-14'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  3,
  'document',
  '单选',
  '新中国第一辆国产解放牌卡车在长春第一汽车制造厂驶下生产线，结束了新中国不能制造汽车的历史，开启了中国汽车工业从无到有、从弱到强的征程。2026年7月13日，新中国第一辆汽车下线迎来（  ）周年。',
  '[{"key":"A","text":"70"},{"key":"B","text":"80"},{"key":"C","text":"90"},{"key":"D","text":"100"}]',
  'A',
  '',
  '原题',
  '2026-07-14'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  4,
  'document',
  '单选',
  '2026年是菲律宾单方面提起的所谓“南海仲裁案裁决”出台第十年。10年来，“南海仲裁案裁决”的（  ），以及给中菲关系和地区局势带来的伤害已暴露无遗，全面清理其遗毒刻不容缓。',
  '[{"key":"A","text":"片面性与局限性"},{"key":"B","text":"主观性与随意性"},{"key":"C","text":"非法性和荒谬性"},{"key":"D","text":"无效性与片面性"}]',
  'C',
  '',
  '原题',
  '2026-07-14'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  5,
  'document',
  '单选',
  '北京时间7月12日，2026年世界体联艺术体操世界杯米兰站结束集体全能项目争夺。凭借索菲亚、塔什干、米兰这三站的稳定发挥，（  ）成功摘得本年度世界杯系列赛集体全能总冠军，实现该奖项三连冠。',
  '[{"key":"A","text":"法国队"},{"key":"B","text":"新西兰队"},{"key":"C","text":"摩洛哥队"},{"key":"D","text":"中国队"}]',
  'D',
  '',
  '原题',
  '2026-07-14'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  1,
  '历史上的今天',
  '1683年维也纳战役打响',
  '1683年维也纳战役打响',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1683年维也纳战役打响|1683年维也纳战役打响',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  2,
  '历史上的今天',
  '1889年第二国际成立',
  '1889年第二国际成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1889年第二国际成立|1889年第二国际成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  3,
  '历史上的今天',
  '1900年八国联军占领天津',
  '1900年八国联军占领天津',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年八国联军占领天津|1900年八国联军占领天津',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  4,
  '历史上的今天',
  '1976年坦赞铁路通车',
  '1976年坦赞铁路通车',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1976年坦赞铁路通车|1976年坦赞铁路通车',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  5,
  '历史上的今天',
  '1980年联合国“妇女十年”世界会议开幕',
  '1980年联合国“妇女十年”世界会议开幕',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1980年联合国“妇女十年”世界会议开幕|1980年联合国“妇女十年”世界会议开幕',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  6,
  '常识',
  '主体',
  '法律关系，是指法律规范在调整人们的行为过程中所形成的具有法律上权利义务形式的社会关系。现实社会关系的主观形式。就其主观形式特征而言，它属于上层建筑范畴，就其社会内容而言，它包括政治、经济、文化等各个领域的社会关系。其构成要素有三项：（1）法律关系主体；（2）法律关系内容；（3）法律关系客体。
法律关系是统治阶级通过国家意志作用于社会关系，借以保证统治阶级利益的重要手段和途径。按照不同标准，法律关系的种类可以分为：一般法律关系，具体法律关系；调整性法律关系，保护性法律关系；平权法律关系，隶属法律关系；积极型法律关系，消极型法律关系；简单法律关系，复杂法律关系；以及各部门法的法律关系等。
法律关系主体是法律关系的参加者，是指参加法律关系，依法享有权利和承担义务的当事人。即在法律关系中，一定权利的享有者和一定义务的承担者。在每一具体的法律关系中，主体的多少各不相同，在大体上都属于相对应的双方：一方是权利的享有者，成为权利人；另一方是义务的承担者，成为义务人。
主体能力：公民和法人要能够成为法律关系的主体，享有权利和承担义务，就必须具有权利能力和行为能力，即具有法律关系主体构成的资格。',
  '常识',
  '法律关系的三要素',
  'common',
  '常识|法律关系的三要素|主体|法律关系，是指法律规范在调整人们的行为过程中所形成的具有法律上权利义务形式的社会关系。现实社会关系的主观形式。就其主观形式特征而言，它属于上层建筑范畴，就其社会',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  7,
  '常识',
  '客体',
  '笼统地讲，法律关系客体是指法律关系主体之间的权利和义务所指向的对象。它是构成法律关系的要素之一。归纳起来，有以下几类：物、人身（由各个生理器官组成的生理整体（有机体））、精神产品、行为。',
  '常识',
  '法律关系的三要素',
  'common',
  '常识|法律关系的三要素|客体|笼统地讲，法律关系客体是指法律关系主体之间的权利和义务所指向的对象。它是构成法律关系的要素之一。归纳起来，有以下几类：物、人身（由各个生理器官组成的生理整体（有',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.14.docx'),
  8,
  '常识',
  '内容（权利和义务）',
  '权利义务是一对表征关系和状态的范畴，是法学范畴体系中的最基本的范畴。从本质上看，权利是指法律保护的某种利益；从行为方式的角度看，它表现为要求权利相对人可以怎样行为，必须怎样行为或不得怎样行为。
义务人指人们必须履行的某种责任，它表现为必须怎样行为和不得怎样行为两种方式。在法律调整状态下，权利是受法律保障的利益，其行为方式表现为意志和行为的自由。义务则是对法律所要求的意志和行为的限制，以及利益的付出。权利和义务是法律调整的特有机制，是法律行为区别于道德行为最明显的标志，也是法律和法律关系内容的核心。
权利与义务作为法律关系的重要因素，它体现了人们在社会生活中的地位及其相互关系，反映着法律调整的文明程度，从宏观方面讲，可以把权利与义务的关系概括为：历史进程中曾有的离合关系逻辑结构上的对立统一关系。总体数量上的等值关系，功能上的互补关系，运行中的制约关系，价值意义上的主次关系。',
  '常识',
  '法律关系的三要素',
  'common',
  '常识|法律关系的三要素|内容（权利和义务）|权利义务是一对表征关系和状态的范畴，是法学范畴体系中的最基本的范畴。从本质上看，权利是指法律保护的某种利益；从行为方式的角度看，它表现为要求权利相对人可以怎样行',
  'learning',
  ''
);

COMMIT;
