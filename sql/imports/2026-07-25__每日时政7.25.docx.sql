-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.25.docx
-- doc_date: 2026-07-25
-- generated_at: 2026-08-21T08:42:54.223Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.25.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.25.docx',
  '2026-07-25',
  'dd53760eb0a2adc9b60d92c6bf7536da456302bfc0510f835ee6360b0df65d8b',
  'imported',
  '{"paragraphs":82,"articles":5,"questions":5,"knowledge":7,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  1,
  '《关于加强新时代社会工作的意见》印发',
  '近日，中共中央、国务院印发《关于加强新时代社会工作的意见》（以下简称《意见》）。
《意见》要求，加强党建引领基层治理和基层政权建设。加强基层政权建设，构建党委领导、党政统筹、简约高效便民的乡镇（街道）管理体制，增强行政执行、为民服务、议事协商、应急管理、平安建设能力。
《意见》要求，健全党组织领导的自治、法治、德治相结合的城乡基层治理体系。
《意见》要求，做好人民建议征集工作，分级分层健全人民建议征集工作制度，畅通和拓展征集渠道，完善成果转化机制。（时政来源：中国政府网）',
  '中国政府网',
  '2026-07-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  2,
  '力箭一号“一箭五星”成功“拼车”',
  '2026年7月24日7时33分，我国在东风商业航天创新试验区使用力箭一号遥十五运载火箭，成功将天仪48星、甘德一号01星、西光贰号03星、吉天星A-04星和应龙风光一号卫星等5颗卫星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。此次任务是力箭一号运载火箭的第15次飞行。（时政来源：央视网）',
  '央视网',
  '2026-07-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  3,
  '中国数学家邓煜、王虹获得菲尔兹奖',
  '在2026年7月23日于美国费城宾夕法尼亚州会展中心举行的2026年国际数学家大会开幕式上，中国数学家邓煜、王虹获得菲尔兹奖。这是中国籍数学家首次获得这一奖项。（时政来源：新华网）',
  '新华网',
  '2026-07-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  4,
  '国内首条穿越长江高铁隧道贯通',
  '2026年7月24日，随着隧道最后一次掘进施工完成，渝厦高铁重庆菜园坝长江铁路隧道顺利贯通，为渝厦高铁全线通车运营打下坚实基础。这条隧道也是国内首条穿越长江并实现贯通的高铁隧道。（时政来源：新华网）',
  '新华网',
  '2026-07-25',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  5,
  '“在高质量发展中保障和改善民生”形势政策系列报告会第六场报告会',
  '“在高质量发展中保障和改善民生”形势政策系列报告会第六场报告会2026年7月23日在北京举行。教育部党组书记、部长怀进鹏作了“奋力推进教育强国建设 办好人民满意的教育”专题报告。
怀进鹏表示，“十五五”时期教育强国建设面临的内外部环境发生深刻变化，我国教育进入由大到强系统跃升关键节点。
怀进鹏表示，要坚持民生为大、基教为先，努力提供公平且有质量的教育公共服务。（时政来源：人民网）',
  '人民网',
  '2026-07-25',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  1,
  'document',
  '单选',
  '社会工作是党和国家工作的重要组成部分，事关党长期执政和国家长治久安，事关社会和谐稳定和人民幸福安康。根据《关于加强XIN SHI DAI社会工作的意见》，下列说法正确的有几项？（  ）
①构建党委领导、党政统筹、简约高效便民的乡镇（街道）管理体制
②健全党组织领导的自治、法治、德治相结合的城乡基层治理体系
③分级分层健全人民建议征集工作制度，畅通和拓展征集渠道，完善成果转化机制
④加强党建引领基层治理和基层政权建设',
  '[{"key":"A","text":"4项"},{"key":"B","text":"3项"},{"key":"C","text":"2项"},{"key":"D","text":"1项"}]',
  'A',
  '',
  '原题',
  '2026-07-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  2,
  'document',
  '单选',
  '2026年7月24日7时33分，我国在东风商业航天创新试验区使用（  ），成功将天仪48星、甘德一号01星、西光贰号03星、吉天星A-04星和应龙风光一号卫星等5颗卫星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。',
  '[{"key":"A","text":"长征十二号乙运载火箭"},{"key":"B","text":"力箭一号遥十五运载火箭"},{"key":"C","text":"朱雀三号遥二运载火箭"},{"key":"D","text":"引力一号遥二运载火箭"}]',
  'B',
  '',
  '原题',
  '2026-07-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  3,
  'document',
  '单选',
  '在2026年7月23日于美国费城宾夕法尼亚州会展中心举行的2026年国际数学家大会开幕式上，中国数学家（  ）获得菲尔兹奖。这是中国籍数学家首次获得这一奖项。',
  '[{"key":"A","text":"邓煜、王虹"},{"key":"B","text":"丘成桐、邓煜"},{"key":"C","text":"张伟、王虹"},{"key":"D","text":"张益唐、张伟"}]',
  'A',
  '',
  '原题',
  '2026-07-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  4,
  'document',
  '单选',
  '2026年7月24日，（  ）重庆菜园坝长江铁路隧道顺利贯通，为（  ）全线通车运营打下坚实基础。这条隧道也是国内首条穿越长江并实现贯通的高铁隧道。',
  '[{"key":"A","text":"渝贵高铁"},{"key":"B","text":"渝万高铁"},{"key":"C","text":"渝厦高铁"},{"key":"D","text":"成渝中线高铁"}]',
  'C',
  '',
  '原题',
  '2026-07-25'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  5,
  'document',
  '单选',
  '2026年7月23日，教育部党组书记、部长怀进鹏在“在高质量发展中保障和改善民生”形势政策系列报告会第六场报告会上表示，“十五五”时期教育强国建设面临的内外部环境发生深刻变化，我国教育进入（  ）系统跃升关键节点。',
  '[{"key":"A","text":"由点到面"},{"key":"B","text":"由均衡到优质"},{"key":"C","text":"由小到大"},{"key":"D","text":"由大到强"}]',
  'D',
  '',
  '原题',
  '2026-07-25'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  1,
  '历史上的今天',
  '1886年重庆教案发生',
  '1886年重庆教案发生',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1886年重庆教案发生|1886年重庆教案发生',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  2,
  '历史上的今天',
  '1894年日舰袭击中国船舰　发动侵略战争',
  '1894年日舰袭击中国船舰　发动侵略战争',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1894年日舰袭击中国船舰　发动侵略战争|1894年日舰袭击中国船舰　发动侵略战争',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  3,
  '历史上的今天',
  '1909年飞机第一次成功飞越英吉利海峡',
  '1909年飞机第一次成功飞越英吉利海峡',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1909年飞机第一次成功飞越英吉利海峡|1909年飞机第一次成功飞越英吉利海峡',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  4,
  '历史上的今天',
  '1919年苏俄发表第一次对华宣言',
  '1919年苏俄发表第一次对华宣言',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1919年苏俄发表第一次对华宣言|1919年苏俄发表第一次对华宣言',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  5,
  '历史上的今天',
  '1953年成渝铁路交付运营',
  '1953年成渝铁路交付运营',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1953年成渝铁路交付运营|1953年成渝铁路交付运营',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  6,
  '常识',
  '‌数学界的诺贝尔奖：菲尔兹奖',
  '【时政链接】2026年7月23日，2026年国际数学家大会在美国费城开幕，现场揭晓2026年菲尔兹奖得主。中国青年数学家王虹、邓煜获奖。
一、王虹、邓煜介绍
（一）王虹：菲尔兹奖史上首位中国女性得主
王虹1991年出生于桂林，同样是北大数院2007级本科生（和邓煜是同班同学），深耕调和分析与几何测度论领域。她最著名的成果是解决了悬置百年的三维挂谷猜想（Kakeya猜想）。
挂谷猜想通俗讲就是：一根细针在平面/空间中转一圈，最少需要多大面积？三维版本的这个问题困扰了数学家近百年，王虹给出了突破性的证明。她也是菲尔兹奖历史上第三位女性获奖者、第一位中国女性获奖者。
（二）邓煜：破解百年物理数学难题
邓煜1989年出生于深圳，本科就读于北京大学数学科学学院，现任芝加哥大学教授。他主攻偏微分方程和数学物理方向，最重磅的成就是攻克了狭义希尔伯特第六问题的核心难题。
简单说，希尔伯特第六问题是数学大师希尔伯特在1900年提出的23个世纪难题之一，核心是“能不能用数学公理系统把物理定律严格推导出来”。邓煜的工作证明了一类重要物理方程的数学基础，相当于给物理学大厦补了一块关键的地基砖，困扰学界一百多年的问题被他打通了。
【历史性意义】本届菲尔兹奖一共颁给4位数学家，其中2位是中国籍，这是中国籍数学家首次斩获菲尔兹奖，而  且一次拿了两个，被公认为中国数学发展的里程碑时刻。',
  '常识',
  '‌数学界的诺贝尔奖：菲尔兹奖',
  'common',
  '常识|‌数学界的诺贝尔奖：菲尔兹奖|‌数学界的诺贝尔奖：菲尔兹奖|【时政链接】2026年7月23日，2026年国际数学家大会在美国费城开幕，现场揭晓2026年菲尔兹奖得主。中国青年数学家王虹、邓煜获奖。
一、王虹、邓煜介绍
（',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.25.docx'),
  7,
  '拓展',
  '阿贝尔奖也是数学领域的顶级大奖，没有年龄限制，终身成就性质，更接近诺贝尔奖的评选模式，常和菲尔兹奖并称为数学界两大最高荣誉。',
  '二、菲尔兹奖介绍
菲尔兹奖是全球数学领域的最高荣誉，因为诺贝尔奖没有设数学奖，所以被公认为“数学界的诺贝尔奖”。
菲尔兹奖每4年评一次，在国际数学家大会（ICM）上颁发，年龄限制不满40岁，只奖励青年数学家，每次2-4人获奖。
三、其他学界的“诺贝尔奖”
计算机界诺贝尔奖：图灵奖
建筑界诺贝尔奖：普利兹克奖
新闻界诺贝尔奖：普利策奖
统计界诺贝尔奖：考普斯总统奖
工程界诺贝尔奖：拉斯奖
环境领域最高奖：沃尔沃环境奖
电影界最高荣誉：奥斯卡金像奖
音乐界最高奖：格莱美奖',
  '拓展',
  '阿贝尔奖也是数学领域的顶级大奖，没有年龄限制，终身成就性质，更接近诺贝尔奖的评选模式，常和菲尔兹奖并称为数学界两大最高荣誉。',
  'extension',
  '拓展|阿贝尔奖也是数学领域的顶级大奖，没有年龄限制，终身成就性质，更接近诺贝尔奖的评选模式，常和菲尔兹奖并称为数学界两大最高荣誉。|阿贝尔奖也是数学领域的顶级大奖，没有年龄限制，终身成就性质，更接近诺贝尔奖的评选模式，常和菲尔兹奖并称为数学界两大最高荣誉。|二、菲尔兹奖介绍
菲尔兹奖是全球数学领域的最高荣誉，因为诺贝尔奖没有设数学奖，所以被公认为“数学界的诺贝尔奖”。
菲尔兹奖每4年评一次，在国际数学家大会（ICM',
  'learning',
  ''
);

COMMIT;
