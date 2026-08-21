-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.28.docx
-- doc_date: 2026-07-28
-- generated_at: 2026-08-21T08:42:54.224Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.28.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.28.docx',
  '2026-07-28',
  '2d6fc1b1a7f9d2c1eaab0d2165e859742de75e7916f4eed7e2da9cf04412b6e9',
  'imported',
  '{"paragraphs":79,"articles":5,"questions":5,"knowledge":15,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  1,
  '三处受威胁遗产地经紧急程序列入《世界遗产名录》',
  '总部位于法国巴黎的联合国教科文组织2026年7月26日宣布，世界遗产委员会决定通过紧急程序将3处“面临重大威胁”的遗产地同时列入《世界遗产名录》和《濒危世界遗产名录》。
上述决定是在韩国釜山举行的联合国教科文组织第48届世界遗产大会上作出的。通过紧急程序列入名录的3处遗产地项目分别是南苏丹的博马-巴丁吉洛迁徙景观、黎巴嫩的阿迈勒山区城堡群和巴勒斯坦的塞巴斯提亚。（时政来源：央视网）',
  '央视网',
  '2026-07-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  2,
  '房五高速全线首条隧道顺利贯通',
  '记者2026年7月27日从中国铁建股份有限公司获悉，由湖北交投集团投资建设、中铁二十局承建的房五高速兴长段熊家岭隧道顺利贯通，这是房五高速全线贯通的首条隧道，标志着全线建设取得重要进展。
房五高速是“鄂湘三江三山”（长江、清江、汉江、武当山、神农架、武陵山）旅游走廊的关键通道，建设里程全长约251公里，桥隧比达87.88%，为湖北省桥隧比最高的交通工程。（时政来源：新华网）',
  '新华网',
  '2026-07-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  3,
  '第13版《新华字典》全国出版发行',
  '《新华字典》（第13版）已由商务印书馆出版。在2026年7月26日举行的出版座谈会上，与会嘉宾认为，《新华字典》是以字词条目形式呈现的知识工程，包含文化基因，典藏家国记忆。（时政来源：新华网）',
  '新华网',
  '2026-07-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  4,
  '时隔20年！第三次全国残疾人抽样调查已启动',
  '记者2026年7月27日从中国残联了解到，第三次全国残疾人抽样调查已启动。
此次全国残疾人抽样调查是继1987年、2006年之后面向残疾人开展的一次重要国情调查，调查对象为我国境内抽取调查小区的全部常住人口，全国共抽取约280万人，约占总人口的2‰。调查时间从2026年6月开始，到2028年12月结束，调查的标准时点是2027年9月1日。（时政来源：央广网）',
  '央广网',
  '2026-07-28',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  5,
  '王毅将出席全球发展倡议5周年高级别会议',
  '外交部发言人2026年7月27日宣布：全球发展倡议5周年高级别会议将于7月28日在北京举行。中共中央政治局委员、外交部长王毅将出席高级别会议并致辞。会议以“全球发展倡议5周年再出发，构建可持续发展的美好未来”为主题。（时政来源：新华网）',
  '新华网',
  '2026-07-28',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  1,
  'document',
  '单选',
  '总部位于法国巴黎的联合国教科文组织2026年7月26日宣布，世界遗产委员会决定通过紧急程序将3处“面临重大威胁”的遗产地同时列入《世界遗产名录》和《濒危世界遗产名录》，分别是（  ）。
①南苏丹的博马-巴丁吉洛迁徙景观
②叙利亚的帕尔米拉古城
③巴勒斯坦的塞巴斯提亚
④黎巴嫩的阿迈勒山区城堡群',
  '[{"key":"A","text":"①③④"},{"key":"B","text":"①②④"},{"key":"C","text":"①②③"},{"key":"D","text":"②③④"}]',
  'A',
  '',
  '原题',
  '2026-07-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  2,
  'document',
  '单选',
  '记者2026年7月27日从中国铁建股份有限公司获悉，由湖北交投集团投资建设、中铁二十局承建的房五高速兴长段熊家岭隧道顺利贯通。房五高速是“鄂湘三江三山”旅游走廊的关键通道。“鄂湘三江三山”中的“三山”不包括（  ）。',
  '[{"key":"A","text":"神农架"},{"key":"B","text":"武夷山"},{"key":"C","text":"武当山"},{"key":"D","text":"武陵山"}]',
  'B',
  '',
  '原题',
  '2026-07-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  3,
  'document',
  '单选',
  '《新华字典》（第13版）已由商务印书馆出版。在2026年7月26日举行的出版座谈会上，与会嘉宾认为，《新华字典》是以（  ）形式呈现的知识工程，包含文化基因，典藏家国记忆。',
  '[{"key":"A","text":"字词条目"},{"key":"B","text":"传统文学典籍"},{"key":"C","text":"专业学术专著"},{"key":"D","text":"完整文学丛书"}]',
  'A',
  '',
  '原题',
  '2026-07-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  4,
  'document',
  '单选',
  '（  ）全国残疾人抽样调查已启动。调查时间从2026年6月开始，到2028年12月结束，调查的标准时点是2027年9月1日。',
  '[{"key":"A","text":"第一次"},{"key":"B","text":"第二次"},{"key":"C","text":"第三次"},{"key":"D","text":"第四次"}]',
  'C',
  '',
  '原题',
  '2026-07-28'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  5,
  'document',
  '单选',
  '（  ）5周年高级别会议将于2026年7月28日在北京举行。会议以“（  ）5周年再出发，构建可持续发展的美好未来”为主题。',
  '[{"key":"A","text":"全球治理倡议"},{"key":"B","text":"全球安全倡议"},{"key":"C","text":"全球文明倡议"},{"key":"D","text":"全球发展倡议"}]',
  'D',
  '',
  '原题',
  '2026-07-28'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  1,
  '历史上的今天',
  '1830年法国七月革命爆发',
  '1830年法国七月革命爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1830年法国七月革命爆发|1830年法国七月革命爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  2,
  '历史上的今天',
  '1908年我国最早设立的国家储蓄银行-北京储蓄银行',
  '1908年我国最早设立的国家储蓄银行-北京储蓄银行',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1908年我国最早设立的国家储蓄银行-北京储蓄银行|1908年我国最早设立的国家储蓄银行-北京储蓄银行',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  3,
  '历史上的今天',
  '1914年第一次世界大战开始',
  '1914年第一次世界大战开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1914年第一次世界大战开始|1914年第一次世界大战开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  4,
  '历史上的今天',
  '1945年日本政府拒绝《波茨坦公告》',
  '1945年日本政府拒绝《波茨坦公告》',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年日本政府拒绝《波茨坦公告》|1945年日本政府拒绝《波茨坦公告》',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  5,
  '历史上的今天',
  '1976年唐山大地震',
  '1976年唐山大地震',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1976年唐山大地震|1976年唐山大地震',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  6,
  '常识',
  '第一次对马克思主义作系统完整介绍——李大钊',
  '在中国最早接受马克思主义的是李大钊。1919年5月，李大钊为《新青年》主编了《马克思主义研究专号》，并亲自撰写了《我的马克思主义观》一文，对马克思主义的三个组成部分——政治经济学、科学社会主义和唯物史观的基本观点作了系统介绍。这是中国人著作中第一次对马克思主义作系统完整的介绍，它对毛泽东、周恩来等一大批先进青年了解并接受马克思主义起了重要作用。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|第一次对马克思主义作系统完整介绍——李大钊|在中国最早接受马克思主义的是李大钊。1919年5月，李大钊为《新青年》主编了《马克思主义研究专号》，并亲自撰写了《我的马克思主义观》一文，对马克思主义的三个组成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  7,
  '常识',
  '第一个把《共产党宣言》翻译成中文——陈望道',
  '陈望道是第一个把《共产党宣言》翻译成中文，把这一著作全文传入中国的人。他是浙江义乌县人，1915年留学日本，1919年6月回国后，任浙江第一师范学校教师，积极从事新文化运动和宣传马克思主义的活动。1920年6月，他参加了陈独秀等成立上海共产主义小组的活动。他于1919年底，完成了《共产党宣言》的翻译工作，1920年8月，《共产党宣言》第一个中文全译本公开出版。《共产党宣言》等马克思主义经典著作的传播对中国革命产生了重要影响。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|第一个把《共产党宣言》翻译成中文——陈望道|陈望道是第一个把《共产党宣言》翻译成中文，把这一著作全文传入中国的人。他是浙江义乌县人，1915年留学日本，1919年6月回国后，任浙江第一师范学校教师，积极从',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  8,
  '常识',
  '第一个共产党组织——上海共产主义小组的成立',
  '1920年8月，陈独秀、李汉俊、沈宏庐、杨明斋、李达等人经过反复讨论酝酿后，在上海发起建立了中国第一个共产主义小组（据回忆，当时不叫共产主义小组这个名称，当时的名称为“共产党”，或“共产党临时中央”）。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|第一个共产党组织——上海共产主义小组的成立|1920年8月，陈独秀、李汉俊、沈宏庐、杨明斋、李达等人经过反复讨论酝酿后，在上海发起建立了中国第一个共产主义小组（据回忆，当时不叫共产主义小组这个名称，当时的',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  9,
  '常识',
  '建党史上的第一个宣言——《中国共产党宣言》',
  '上海共产主义小组成立后，于1920年11月，制定了《中国共产党宣言》。该宣言是为全国建党提出的纲领性文件。在宣言中，明确提出了要为实现共产主义社会而奋斗的理想和目的，阐明了无产阶级革命和无产阶级专政的基本思想。这是中国共产党的第一个宣言，它曾作为当时收纳党员的标准，起过临时党纲的作用。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|建党史上的第一个宣言——《中国共产党宣言》|上海共产主义小组成立后，于1920年11月，制定了《中国共产党宣言》。该宣言是为全国建党提出的纲领性文件。在宣言中，明确提出了要为实现共产主义社会而奋斗的理想和',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  10,
  '常识',
  '第一次提出反帝反封建的民主革命纲领——中共二大',
  '中国共产党第二次全国代表大会于1922年7月在上海举行，大会的主要任务是要确定党在现阶段的革命纲领。中共二大的主要历史功绩就是，在中国破天荒第一次提出了反帝反封建的民主革命纲领，为中国各族人民指明了现阶段革命斗争的任务和方向。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|第一次提出反帝反封建的民主革命纲领——中共二大|中国共产党第二次全国代表大会于1922年7月在上海举行，大会的主要任务是要确定党在现阶段的革命纲领。中共二大的主要历史功绩就是，在中国破天荒第一次提出了反帝反封',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  11,
  '常识',
  '党领导打响武装反抗国民党反动派的第一枪——八一南…',
  '党领导打响武装反抗国民党反动派的第一枪——八一南昌起义
1927年8月1日根据中共中央的决定，在周恩来为书记的中共前敌委员会和贺龙、叶挺、朱德、刘伯承等领导下，党所掌握和影响的国民革命军等武装两万余人，在南昌举行武装起义，占领了南昌。这次起义打响了武装反抗国民党反动派的第一枪，开始了中国共产党独立地领导革命武装斗争和创建人民革命军队的新时期。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|党领导打响武装反抗国民党反动派的第一枪——八一南…|党领导打响武装反抗国民党反动派的第一枪——八一南昌起义
1927年8月1日根据中共中央的决定，在周恩来为书记的中共前敌委员会和贺龙、叶挺、朱德、刘伯承等领导下，',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  12,
  '常识',
  '第一次提出“枪杆子里面出政权”',
  '1927年8月7日在汉口召开的“八七”会议上，毛泽东同志在发言中提出的。他指出，大革命失败党中央所犯的一个错误是不认识军队的极端重要性。他强调全党“要非常注意军事，须知政权是由枪杆子中取得的”。这是由中国国情特点决定的，即中国内部没有民主，只能以革命武装斗争为主要形式。无产阶级只有掌握自已的武装力量才能以革命的武装反对反革命的武装，夺取全国政权。这段话后来成为党创建、领导和掌握人民武装并进行斗争的行动口号。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|第一次提出“枪杆子里面出政权”|1927年8月7日在汉口召开的“八七”会议上，毛泽东同志在发言中提出的。他指出，大革命失败党中央所犯的一个错误是不认识军队的极端重要性。他强调全党“要非常注意军',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  13,
  '常识',
  '第一个农村革命根据地——井冈山革命根据地',
  '1927年10月上旬，毛泽东率领起义部队到达湘赣边界罗霄山脉中段的江西省宁冈县茅坪。开始了创建第一个农村革命根据地——井冈山革命根据地。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|第一个农村革命根据地——井冈山革命根据地|1927年10月上旬，毛泽东率领起义部队到达湘赣边界罗霄山脉中段的江西省宁冈县茅坪。开始了创建第一个农村革命根据地——井冈山革命根据地。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  14,
  '常识',
  '中国共产党的第一个公开性机关刊物——《新青年》',
  '《新青年》月刊，五四时期和大革命时期最著名的革命刊物。1915年9月在上海创刊。在新文化运动中，以提倡民主和科学，反对专制和迷信；提倡新道德，反对旧道德；提倡新文学，反对旧文学，而对整个中国思想文化界的革命产生巨大影响。1919年以后，大量刊登介绍十月革命和宣传马克思列宁主义的文章。从1920年9月第八卷起，成为上海共产主义小组公开宣传的机关刊物。中国共产党成立后，《新青年》一度成为党中央的机关刊物。
1922年7月休刊。1923年6月复刊后改为季刊，成为中共中央的理论性机关刊物。1926年7月最后停刊，前后共出63期。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|中国共产党的第一个公开性机关刊物——《新青年》|《新青年》月刊，五四时期和大革命时期最著名的革命刊物。1915年9月在上海创刊。在新文化运动中，以提倡民主和科学，反对专制和迷信；提倡新道德，反对旧道德；提倡新',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.28.docx'),
  15,
  '常识',
  '中共诞生后创办的第一个出版机关——人民出版社',
  '1921年9月1日，中国共产党在上海创办了第一个出版机关——人民出版社。为了避免引起反动当局的注意，在出版社的书刊上故意印了“广州人民出版社出版”的字样。该社印行了《共产党宣言》等10多种马列主义丛书和其他革命书籍，对当时马克思列宁主义的广泛传播产生了重要影响。1923 年，该社与《新青年》合并。',
  '常识',
  '党史上的“第一',
  'common',
  '常识|党史上的“第一|中共诞生后创办的第一个出版机关——人民出版社|1921年9月1日，中国共产党在上海创办了第一个出版机关——人民出版社。为了避免引起反动当局的注意，在出版社的书刊上故意印了“广州人民出版社出版”的字样。该社印',
  'learning',
  ''
);

COMMIT;
