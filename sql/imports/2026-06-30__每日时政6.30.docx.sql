-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政6.30.docx
-- doc_date: 2026-06-30
-- generated_at: 2026-08-21T08:42:54.217Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政6.30.docx',
  '/Users/tank/Desktop/每日时政/每日时政6.30.docx',
  '2026-06-30',
  'eb9867e7293ed3b25970af2a35075647aade839353b8df204f1820e5cfde5e86',
  'imported',
  '{"paragraphs":74,"articles":5,"questions":5,"knowledge":11,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  1,
  '东北地区首座！我国纬度最高光热电站投产发电',
  '2026年6月29日，我国东北首座光热电站——中广核吉西基地10万千瓦光热电站在吉林省大安市投产发电，我国在高纬度严寒地区光热发电技术应用上取得新突破。（时政来源：央视网）',
  '央视网',
  '2026-06-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  2,
  '《推进农家书屋改革提升促进乡村阅读行动方案》印发',
  '近日，中央宣传部、财政部、农业农村部三部门联合印发《推进农家书屋改革提升促进乡村阅读行动方案》。
方案指出，要以习近平新时代中国特色社会主义思想为指导，按照分类管理、差异投入、动态调整、效能优先的工作原则，立足“农家”定位，提升“书”的品质，丰富“屋”的功能，浓厚“读”的氛围，不断完善适应农村人口结构变化、满足农民群众阅读需求和顺应信息技术发展潮流的乡村阅读服务体系，提高城乡基本公共服务均等化水平。（时政来源：央视网）',
  '央视网',
  '2026-06-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  3,
  '2025年我国文化产业营收规模突破20万亿元',
  '国家统计局2026年6月29日发布的2025年全国文化及相关产业发展情况报告显示，2025年，我国文化及相关产业实现营业收入208254亿元，再创历史新高，比上年增长8.8%。（时政来源：新华网）',
  '新华网',
  '2026-06-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  4,
  '我国第三艘万车级汽车运输船交付',
  '2026年6月29日，由中船集团广船国际建造的10800车汽车运输船在广州南沙完成交付。这是我国交付的第三艘万车级汽车运输船，标志着我国在该领域已具备批量化、系列化建造能力。（时政来源：央视网）',
  '央视网',
  '2026-06-30',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  5,
  '再添重磅里程碑！三条世界级高性能碳纤维生产线集中投产',
  '2026年6月28日记者从中国建材集团获悉，中国建材三条世界级高性能碳纤维生产线在中复神鹰连云港基地集中投产，覆盖通用、高强、高模三大主流碳纤维品类。这标志着我国碳纤维产业高质量发展再添重磅里程碑。（时政来源：央广网）',
  '央广网',
  '2026-06-30',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  1,
  'document',
  '单选',
  '2026年6月29日，我国东北首座光热电站——（  ）投产发电，我国在高纬度严寒地区光热发电技术应用上取得新突破。',
  '[{"key":"A","text":"中广核吉西基地10万千瓦光热电站"},{"key":"B","text":"鲁能海西州8万千瓦光热电站"},{"key":"C","text":"三峡乌拉特5万千瓦光热电站"},{"key":"D","text":"华能敦煌12万千瓦光热电站"}]',
  'A',
  '',
  '原题',
  '2026-06-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  2,
  'document',
  '单选',
  '近日，中央宣传部、财政部、农业农村部三部门联合印发《推进农家书屋改革提升促进乡村阅读行动方案》。方案指出，按照（  ）的工作原则，立足“农家”定位，提升“书”的品质，丰富“屋”的功能，浓厚“读”的氛围，不断完善适应农村人口结构变化、满足农民群众阅读需求和顺应信息技术发展潮流的乡村阅读服务体系，提高城乡基本公共服务均等化水平。',
  '[{"key":"A","text":"因地制宜、城乡统筹、共建共享、长效运行"},{"key":"B","text":"分类管理、差异投入、动态调整、效能优先"},{"key":"C","text":"统筹规划、标准统一、均衡配置、普惠均等"},{"key":"D","text":"政府主导、社会参与、供需匹配、数字赋能"}]',
  'B',
  '',
  '原题',
  '2026-06-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  3,
  'document',
  '单选',
  '国家统计局2026年6月29日发布的2025年全国文化及相关产业发展情况报告显示，2025年，我国文化及相关产业实现营业收入（  ），再创历史新高，比上年增长8.8%。',
  '[{"key":"A","text":"208254亿元"},{"key":"B","text":"108254亿元"},{"key":"C","text":"308254亿元"},{"key":"D","text":"408254亿元"}]',
  'A',
  '',
  '原题',
  '2026-06-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  4,
  'document',
  '单选',
  '2026年6月29日，由中船集团广船国际建造的（  ）在广州南沙完成交付。这是我国交付的第三艘万车级汽车运输船。',
  '[{"key":"A","text":"20000车汽车运输船"},{"key":"B","text":"18000车汽车运输船"},{"key":"C","text":"10800车汽车运输船"},{"key":"D","text":"32100车汽车运输船"}]',
  'C',
  '',
  '原题',
  '2026-06-30'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  5,
  'document',
  '单选',
  '2026年6月28日记者从中国建材集团获悉，中国建材三条世界级高性能碳纤维生产线在中复神鹰连云港基地集中投产，覆盖（  ）三大主流碳纤维品类。',
  '[{"key":"A","text":"民用、航空、航天"},{"key":"B","text":"标准、中强、超高强"},{"key":"C","text":"工业、军工、航天"},{"key":"D","text":"通用、高强、高模"}]',
  'D',
  '',
  '原题',
  '2026-06-30'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  1,
  '历史上的今天',
  '1930年法国军队提前撤出莱茵兰',
  '1930年法国军队提前撤出莱茵兰',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1930年法国军队提前撤出莱茵兰|1930年法国军队提前撤出莱茵兰',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  2,
  '历史上的今天',
  '1932年中共定八月一日为建军节',
  '1932年中共定八月一日为建军节',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1932年中共定八月一日为建军节|1932年中共定八月一日为建军节',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  3,
  '历史上的今天',
  '1941年纳粹全面入侵俄国',
  '1941年纳粹全面入侵俄国',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1941年纳粹全面入侵俄国|1941年纳粹全面入侵俄国',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  4,
  '历史上的今天',
  '1945年安阳战役',
  '1945年安阳战役',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1945年安阳战役|1945年安阳战役',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  5,
  '历史上的今天',
  '1958年北京十三陵水库完工',
  '1958年北京十三陵水库完工',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1958年北京十三陵水库完工|1958年北京十三陵水库完工',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  6,
  '常识',
  '原始社会时期',
  '1.旧石器时代：以石斧、石刀、砍斫器等简单石器为主，用于砍伐树木、采集果实和狩猎，属于刀耕火种阶段。
2.新石器时代：出现磨制石器，如石耜、石锄、石犁等，以及骨耜、鹿角锄等。耒耜成为主要翻土工具，通过脚踩横梁使尖头深入土壤，实现土地翻整，标志着从单式农具向复式农具发展。',
  '常识',
  '古代农具发展历史',
  'common',
  '常识|古代农具发展历史|原始社会时期|1.旧石器时代：以石斧、石刀、砍斫器等简单石器为主，用于砍伐树木、采集果实和狩猎，属于刀耕火种阶段。
2.新石器时代：出现磨制石器，如石耜、石锄、石犁等，以及骨',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  7,
  '常识',
  '夏、商、西周时期',
  '以木、石、骨、蚌材质农具为主，如石斧、石铲、骨耜等。
青铜铸造技术出现，少量青铜农具如青铜锸、青铜铲、青铜镰等出现，但主要用于贵族或特殊场合，普通民众仍以石、木农具为主。',
  '常识',
  '古代农具发展历史',
  'common',
  '常识|古代农具发展历史|夏、商、西周时期|以木、石、骨、蚌材质农具为主，如石斧、石铲、骨耜等。
青铜铸造技术出现，少量青铜农具如青铜锸、青铜铲、青铜镰等出现，但主要用于贵族或特殊场合，普通民众仍以石、木',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  8,
  '常识',
  '春秋战国时期',
  '冶铁技术兴起，铁制农具开始普及，如铁犁铧、铁锸、铁锄、铁镢等，取代石、木农具，推动农业生产力质的飞跃。
牛耕技术推广，铁犁与牛耕结合，形成铁犁牛耕生产方式，提高耕作效率和土地开垦能力。
出现连耞等脱粒农具，用于谷物脱粒。',
  '常识',
  '古代农具发展历史',
  'common',
  '常识|古代农具发展历史|春秋战国时期|冶铁技术兴起，铁制农具开始普及，如铁犁铧、铁锸、铁锄、铁镢等，取代石、木农具，推动农业生产力质的飞跃。
牛耕技术推广，铁犁与牛耕结合，形成铁犁牛耕生产方式，提高',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  9,
  '常识',
  '秦汉至隋唐五代时期',
  '铁制农具进一步普及和完善，种类更加丰富，如犁铧、耙、镰、锄等。
汉代发明耧车，作为畜力牵引的播种农具，可边开沟边播种，提高播种效率。
唐代发明曲辕犁，将直辕改为曲辕，增加犁壁、犁评、犁盘等部件，操作更灵活省力，适用于江南水田，标志着传统耕犁技术成熟。',
  '常识',
  '古代农具发展历史',
  'common',
  '常识|古代农具发展历史|秦汉至隋唐五代时期|铁制农具进一步普及和完善，种类更加丰富，如犁铧、耙、镰、锄等。
汉代发明耧车，作为畜力牵引的播种农具，可边开沟边播种，提高播种效率。
唐代发明曲辕犁，将直辕改为',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  10,
  '常识',
  '宋元时期',
  '农具发展注重动力利用和效率提升，出现水轮三事、水转连磨等水力驱动谷物加工机械，实现一机多用。
麦钐、麦绰、麦笼等协同作业收麦农具出现，提高收割效率。
秧马等辅助农具出现，减轻农民劳作强度。',
  '常识',
  '古代农具发展历史',
  'common',
  '常识|古代农具发展历史|宋元时期|农具发展注重动力利用和效率提升，出现水轮三事、水转连磨等水力驱动谷物加工机械，实现一机多用。
麦钐、麦绰、麦笼等协同作业收麦农具出现，提高收割效率。
秧马等辅助',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.30.docx'),
  11,
  '常识',
  '明清时期',
  '农具发展相对缓慢，但仍有改进，如深耕犁普遍使用，根据土壤特点分为不同大小和轻重类型。
出现虫梳、除虫滑车等除虫工具，反映精耕细作程度提高。',
  '常识',
  '古代农具发展历史',
  'common',
  '常识|古代农具发展历史|明清时期|农具发展相对缓慢，但仍有改进，如深耕犁普遍使用，根据土壤特点分为不同大小和轻重类型。
出现虫梳、除虫滑车等除虫工具，反映精耕细作程度提高。',
  'learning',
  ''
);

COMMIT;
