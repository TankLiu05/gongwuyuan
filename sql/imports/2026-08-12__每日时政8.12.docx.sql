-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政8.12.docx
-- doc_date: 2026-08-12
-- generated_at: 2026-08-21T08:42:54.227Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政8.12.docx',
  '/Users/tank/Desktop/每日时政/每日时政8.12.docx',
  '2026-08-12',
  '929f34f9711b30c48be58dc3af8e26e3c6fc8d137c6d3476d8d80e911553f321',
  'imported',
  '{"paragraphs":72,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
  '模型没有返回内容。',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  1,
  '世界最大冲击式水电机组顺利完成转子吊装',
  '2026年8月11日，世界最大冲击式水电机组在大唐扎拉水电站顺利完成转子吊装，标志着我国超高水头、大容量冲击式水电装备核心技术跻身世界领先行列，有力助推藏东南清洁能源基地建设。（时政来源：央视网）',
  '央视网',
  '2026-08-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  2,
  '第38届大众电影百花奖揭晓',
  '第38届大众电影百花奖2026年8月10日在北京揭晓。《哪吒之魔童闹海》获最佳影片奖，《惊蛰无声》获优秀影片奖，许渌洋、张珂、申奥凭借《南京照相馆》获最佳编剧奖，大鹏凭借《长安的荔枝》获最佳导演奖，易烊千玺获最佳男主角奖，卫诗雅获最佳女主角奖。（时政来源：新华网）',
  '新华网',
  '2026-08-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  3,
  '《中国人民银行“十五五”改革发展规划》印发',
  '中国人民银行近日印发《中国人民银行“十五五”改革发展规划》，就“十五五”时期中国人民银行改革发展重点任务作出部署。
在各项重点任务中，构建科学稳健的货币政策体系和覆盖全面的宏观审慎管理体系位列首位。规划提出，健全中国特色现代货币政策框架，完善基础货币投放机制，发挥好货币信贷政策工具的总量和结构功能。健全市场化利率形成、调控和传导机制。发挥市场在汇率形成中的决定性作用，保持人民币汇率在合理均衡水平上基本稳定。
规划要求，持续增强金融服务实体经济质效。
规划指出，持续建设开放包容、富有活力韧性的现代金融市场。（时政来源：人民网）',
  '人民网',
  '2026-08-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  4,
  '浙江发布台风“白海豚”评估报告',
  '2026年8月11日，浙江省气象局发布台风“白海豚”气象评估报告。
“白海豚”在距离浙江6000公里的远洋生成（东经176.9度），长途奔袭，为有气象记录以来首个在日界线附近生成并登陆我国的台风。（时政来源：央视网）',
  '央视网',
  '2026-08-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  5,
  '中国海军第49批护航编队将赴亚丁湾、索马里海域执行护航任务',
  '2026年8月中旬开始，由中国海军导弹驱逐舰昆明舰、导弹护卫舰岳阳舰、综合补给舰骆马湖舰组成的第49批护航编队，将赴亚丁湾、索马里海域接替第48批护航编队执行护航任务。（时政来源：央视网）',
  '央视网',
  '2026-08-12',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  1,
  'document',
  '单选',
  '2026年8月11日，世界最大冲击式水电机组在（  ）顺利完成转子吊装，标志着我国超高水头、大容量冲击式水电装备核心技术跻身世界领先行列。',
  '[{"key":"A","text":"白鹤滩水电站"},{"key":"B","text":"锦屏水电站"},{"key":"C","text":"两河口水电站"},{"key":"D","text":"大唐扎拉水电站"}]',
  'D',
  '',
  '原题',
  '2026-08-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  2,
  'document',
  '单选',
  '第38届大众电影百花奖2026年8月10日在北京揭晓。（  ）获最佳影片奖。',
  '[{"key":"A","text":"《南京照相馆》"},{"key":"B","text":"《八仙》"},{"key":"C","text":"《哪吒之魔童闹海》"},{"key":"D","text":"《惊蛰无声》"}]',
  'C',
  '',
  '原题',
  '2026-08-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  3,
  'document',
  '单选',
  '中国人民银行近日印发《中国人民银行“十五五”改革发展规划》，就“十五五”时期中国人民银行改革发展重点任务作出部署。下列相关说法错误的是（  ）。',
  '[{"key":"A","text":"在各项重点任务中，构建科学稳健的货币政策体系和覆盖全面的宏观审慎管理体系位列首位"},{"key":"B","text":"发挥央行在汇率形成中的决定性作用"},{"key":"C","text":"持续增强金融服务实体经济质效"},{"key":"D","text":"持续建设开放包容、富有活力韧性的现代金融市场"}]',
  'B',
  '',
  '原题',
  '2026-08-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  4,
  'document',
  '单选',
  '2026年8月11日，浙江省气象局发布台风（  ）气象评估报告。（  ）在距离浙江6000公里的远洋生成（东经176.9度），长途奔袭，为有气象记录以来首个在日界线附近生成并登陆我国的台风。',
  '[{"key":"A","text":"“白海豚”"},{"key":"B","text":"“美莎克”"},{"key":"C","text":"“杜苏芮”"},{"key":"D","text":"“巴威”"}]',
  'A',
  '',
  '原题',
  '2026-08-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  5,
  'document',
  '单选',
  '2026年8月中旬开始，由中国海军导弹驱逐舰（  ）、导弹护卫舰岳阳舰、综合补给舰骆马湖舰组成的第49批护航编队，将赴亚丁湾、索马里海域接替第48批护航编队执行护航任务。',
  '[{"key":"A","text":"唐山舰"},{"key":"B","text":"呼和浩特舰"},{"key":"C","text":"长沙舰"},{"key":"D","text":"昆明舰"}]',
  'D',
  '',
  '原题',
  '2026-08-12'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  1,
  '历史上的今天',
  '1918年新国会成立',
  '1918年新国会成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1918年新国会成立|1918年新国会成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  2,
  '历史上的今天',
  '1941年晋察冀边区反“扫荡”开始',
  '1941年晋察冀边区反“扫荡”开始',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1941年晋察冀边区反“扫荡”开始|1941年晋察冀边区反“扫荡”开始',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  3,
  '历史上的今天',
  '1949年关于保护战争受难者的日内瓦公约签订',
  '1949年关于保护战争受难者的日内瓦公约签订',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年关于保护战争受难者的日内瓦公约签订|1949年关于保护战争受难者的日内瓦公约签订',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  4,
  '历史上的今天',
  '1954年联合国军撤出北朝鲜的最后一块土地',
  '1954年联合国军撤出北朝鲜的最后一块土地',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1954年联合国军撤出北朝鲜的最后一块土地|1954年联合国军撤出北朝鲜的最后一块土地',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  5,
  '历史上的今天',
  '1977年中共十一大宣布文化大革命结束',
  '1977年中共十一大宣布文化大革命结束',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1977年中共十一大宣布文化大革命结束|1977年中共十一大宣布文化大革命结束',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  6,
  '常识',
  '电影简介',
  '《欢迎来龙餐馆》是2026年8月上映的电影，以2003年伊拉克战争前后为背景，讲述东北厨师徐福远赴中东虚构城市巴哈塔经营“龙餐馆”，从打工还债到战火中庇护孤儿平民的故事。',
  '常识',
  '电影《欢迎来龙餐馆》考点梳理',
  'common',
  '常识|电影《欢迎来龙餐馆》考点梳理|电影简介|《欢迎来龙餐馆》是2026年8月上映的电影，以2003年伊拉克战争前后为背景，讲述东北厨师徐福远赴中东虚构城市巴哈塔经营“龙餐馆”，从打工还债到战火中庇护孤儿平',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  7,
  '常识',
  '电影常识考点',
  '“小人物三部曲”：本片为文牧野“小人物三部曲”第三部。前两部为《我不是药神》（2018，救病人）、《奇迹・笨小孩》（2022，护兄妹），本片聚焦战火下海外华人（救战争儿童），均以底层小人物的命运与救赎为核心主题。',
  '常识',
  '电影《欢迎来龙餐馆》考点梳理',
  'common',
  '常识|电影《欢迎来龙餐馆》考点梳理|电影常识考点|“小人物三部曲”：本片为文牧野“小人物三部曲”第三部。前两部为《我不是药神》（2018，救病人）、《奇迹・笨小孩》（2022，护兄妹），本片聚焦战火下海外华人（',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  8,
  '常识',
  '历史常识考点',
  '1.伊拉克战争（2003年）：2003年3月，美英以伊拉克拥有大规模杀伤性武器、与恐怖组织有牵连为由发动战争，推翻萨达姆政权，事后证明情报不实。2003年4月9日萨达姆政权垮台，2011年12月美军撤军。
2.“邪恶轴心”说：2002年美国总统布什将伊朗、伊拉克、朝鲜列为“邪恶轴心国”，为后续伊拉克战争造势。
3.两河流域文明：影片故事发生地中东地区是人类文明摇篮之一。幼发拉底河与底格里斯河孕育了美索不达米亚文明（两河文明），是世界最早的文明之一，苏美尔、巴比伦、亚述等古国均诞生于此。
4.海湾战争与伊拉克战争的区别：1991年海湾战争因伊拉克入侵科威特而起，由联合国授权；2003年伊拉克战争由美英主导发动，未经联合国授权，二者不可混淆。',
  '常识',
  '电影《欢迎来龙餐馆》考点梳理',
  'common',
  '常识|电影《欢迎来龙餐馆》考点梳理|历史常识考点|1.伊拉克战争（2003年）：2003年3月，美英以伊拉克拥有大规模杀伤性武器、与恐怖组织有牵连为由发动战争，推翻萨达姆政权，事后证明情报不实。2003年4月9',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  9,
  '常识',
  '文化常识考点',
  '1.“民以食为天”：出自《史记・郦生陆贾列传》“王者以民人为天，而民人以食为天”。影片用餐桌烟火诠释这一生存哲学。
2.“一饭之恩”：典出《史记・淮阴侯列传》韩信报漂母赐饭的故事，指微小恩惠也当铭记报答。影片中“加鸡蛋”等报答情节暗合此典故。
3.中华饮食文化：“夫礼之初，始诸饮食”（《礼记》），中国古代的“礼”最早起源于饮食活动。影片中的煎蛋、小火锅、烩饭等菜品各有象征意义，其中“徐福烩饭”用剩饭拼凑而成，暗喻乱世中拼凑希望的主题。
4.“龙”的文化符号：龙是中华民族的图腾与象征。影片中“龙餐馆”最初是外国人对中餐馆的刻板印象标签，后升华为中华文化在海外的微型载体——“人在哪里，龙餐馆就在哪里”。
5.东北饮食文化：主角徐福是东北厨师，东北菜以量大实惠、口味醇厚著称，代表菜有锅包肉、地三鲜、炖菜等，体现了东北人豪爽实在的性格特征。',
  '常识',
  '电影《欢迎来龙餐馆》考点梳理',
  'common',
  '常识|电影《欢迎来龙餐馆》考点梳理|文化常识考点|1.“民以食为天”：出自《史记・郦生陆贾列传》“王者以民人为天，而民人以食为天”。影片用餐桌烟火诠释这一生存哲学。
2.“一饭之恩”：典出《史记・淮阴侯列传》韩',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政8.12.docx'),
  10,
  '常识',
  '地理常识考点',
  '1.中东地区：指地中海东部南部到波斯湾沿岸的部分地区，连接亚、欧、非三大洲，沟通大西洋和印度洋，战略位置极为重要。是世界石油储量最丰富的地区，也是战乱频发的地区。
2.中东气候与饮食：中东地区以热带沙漠气候为主，干旱少雨，饮食以面食、牛羊肉、椰枣等为主。',
  '常识',
  '电影《欢迎来龙餐馆》考点梳理',
  'common',
  '常识|电影《欢迎来龙餐馆》考点梳理|地理常识考点|1.中东地区：指地中海东部南部到波斯湾沿岸的部分地区，连接亚、欧、非三大洲，沟通大西洋和印度洋，战略位置极为重要。是世界石油储量最丰富的地区，也是战乱频发的地区',
  'learning',
  ''
);

COMMIT;
