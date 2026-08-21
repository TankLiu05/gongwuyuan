-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.31.docx
-- doc_date: 2026-07-31
-- generated_at: 2026-08-21T08:42:54.224Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.31.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.31.docx',
  '2026-07-31',
  'ce6affa6bec8cf6474d1c0591ba2b0d40b5abd6bef100e80291d93168a66450b',
  'imported',
  '{"paragraphs":72,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  1,
  '中共中央政治局召开会议',
  '中共中央政治局2026年7月30日召开会议，决定今年10月在北京召开中国共产党第二十届中央委员会第五次全体会议。
会议强调，持之以恒推进全面从严治党要以党章为根本，坚持和加强党中央集中统一领导，着眼于提高党的长期执政能力、保持党的先进性和纯洁性、保持党同人民群众的血肉联系，坚持严的基调不动摇，健全全面从严治党体系，以党的政治建设为统领，全面推进党的各方面建设，充分激发全党积极性主动性创造性，不断实现党的自我净化、自我完善、自我革新、自我提高，确保党始终成为走在时代前列、人民衷心拥护、经得起各种风浪考验、朝气蓬勃的马克思主义执政党，始终成为中国特色社会主义事业的坚强领导核心。
会议认为，我国经济呈现动能向新、结构向优的发展态势。
会议强调，做好下半年经济工作，要实施好更加积极的财政政策和适度宽松的货币政策，充分发挥各项存量政策效能，及时谋划出台务实管用的增量政策，加大逆周期调节力度，加力扩大内需、优化供给，切实保障和改善民生，增强发展动力、激发社会活力，推动经济持续向新向优向好发展，努力实现“十五五”良好开局。
会议强调，稳定房地产市场，实施好一揽子化债方案，扎实推进地方中小金融机构改革化险、减量提质。（时政来源：新华网）',
  '新华网',
  '2026-07-31',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  2,
  '我国成功发射天链三号01星',
  '2026年7月29日19时50分，我国在文昌航天发射场使用长征七号改运载火箭，成功将天链三号01星发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。
天链三号01星主要用于为飞船、空间实验室、空间站等载人航天器提供数据中继和测控服务，为中、低轨道资源卫星提供数据中继和测控服务。（时政来源：新华网）',
  '新华网',
  '2026-07-31',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  3,
  '三部门联合发布《邮政业发展“十五五”规划》',
  '国家邮政局、国家发展改革委、交通运输部联合印发的《邮政业发展“十五五”规划》2026年7月29日对外发布，提出到2030年，邮政行业寄递业务量达到2900亿件，重点地区快递服务72小时妥投率达到88%，国际快递网络覆盖国家和地区数达到110个等目标。（时政来源：人民网）',
  '人民网',
  '2026-07-31',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  4,
  '世界最大直径高铁盾构机成功穿越长江',
  '2026年7月30日上午，世界最大直径高铁盾构机——崇太长江隧道“领航号”，成功穿越长江水域，实现崇太长江隧道水域段盾构隧道贯通，为我国首次实现高铁时速350公里“穿江不减速”奠定基础。（时政来源：新华网）',
  '新华网',
  '2026-07-31',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  5,
  '今年上半年我国煤电发电量占比首次低于50%',
  '记者2026年7月30日从国家能源局举行的新闻发布会上获悉，今年前6个月，我国煤电发电量达2.5万亿千瓦时，占总发电量比重降至49.7%，半年发电量占比首次低于50%，标志着我国能源绿色低碳转型步伐取得新的突破。（时政来源：新华网）',
  '新华网',
  '2026-07-31',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  1,
  'document',
  '单选',
  '中共中央政治局2026年7月30日召开会议，决定今年10月在北京召开中国共产党第二十届中央委员会第五次全体会议。下列表述符合会议精神的有哪些？（  ）
①我国经济呈现动能向新、结构向优的发展态势
②扎实推进地方中小金融机构改革化险、减量提质
③做好下半年经济工作，要实施好更加积极的财政政策和适度宽松的货币政策
④持之以恒推进全面从严治党要以党章为根本，以党的政治建设为统领',
  '[{"key":"A","text":"①②③"},{"key":"B","text":"①③④"},{"key":"C","text":"②③④"},{"key":"D","text":"①②③④"}]',
  'D',
  '',
  '原题',
  '2026-07-31'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  2,
  'document',
  '单选',
  '2026年7月29日19时50分，我国在文昌航天发射场使用长征七号改运载火箭，成功将（  ）发射升空，卫星顺利进入预定轨道，发射任务取得圆满成功。（  ）主要用于为飞船、空间实验室、空间站等载人航天器，为中、低轨道资源卫星提供数据中继和测控服务。',
  '[{"key":"A","text":"遥感四十五号卫星"},{"key":"B","text":"天链三号01星"},{"key":"C","text":"天通一号04星"},{"key":"D","text":"高分十号卫星"}]',
  'B',
  '',
  '原题',
  '2026-07-31'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  3,
  'document',
  '单选',
  '国家邮政局、国家发展改革委、交通运输部联合印发的《邮政业发展“十五五”规划》2026年7月29日对外发布，提出到2030年，邮政行业寄递业务量达到2900亿件，重点地区快递服务（  ）妥投率达到88%，国际快递网络覆盖国家和地区数达到（  ）个等目标。',
  '[{"key":"A","text":"72小时；110"},{"key":"B","text":"48小时；110"},{"key":"C","text":"72小时；210"},{"key":"D","text":"48小时；210"}]',
  'A',
  '',
  '原题',
  '2026-07-31'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  4,
  'document',
  '单选',
  '2026年7月30日上午，世界最大直径高铁盾构机——崇太长江隧道（  ），成功穿越长江水域，实现崇太长江隧道水域段盾构隧道贯通，为我国首次实现高铁时速（  ）奠定基础。',
  '[{"key":"A","text":"“启越号”；300公里“穿江限速通行”"},{"key":"B","text":"“领航号”；350公里“穿江不减速”"},{"key":"C","text":"“先锋号”；350公里“过江分段降速”"},{"key":"D","text":"“蛟龙号”；400公里“全程高速通行”"}]',
  'B',
  '',
  '原题',
  '2026-07-31'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  5,
  'document',
  '单选',
  '2026年前6个月，我国煤电发电量达2.5万亿千瓦时，半年发电量占比首次低于（  ），标志着我国能源绿色低碳转型步伐取得新的突破。',
  '[{"key":"A","text":"70%"},{"key":"B","text":"40%"},{"key":"C","text":"60%"},{"key":"D","text":"50%"}]',
  'D',
  '',
  '原题',
  '2026-07-31'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  1,
  '历史上的今天',
  '1667年第二次英荷战争结束',
  '1667年第二次英荷战争结束',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1667年第二次英荷战争结束|1667年第二次英荷战争结束',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  2,
  '历史上的今天',
  '1894年中日平壤战役打响',
  '1894年中日平壤战役打响',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1894年中日平壤战役打响|1894年中日平壤战役打响',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  3,
  '历史上的今天',
  '1911年同盟会中部总会成立',
  '1911年同盟会中部总会成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1911年同盟会中部总会成立|1911年同盟会中部总会成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  4,
  '历史上的今天',
  '1958年伊拉克政变',
  '1958年伊拉克政变',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1958年伊拉克政变|1958年伊拉克政变',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  5,
  '历史上的今天',
  '1958年赫鲁晓夫秘密访华',
  '1958年赫鲁晓夫秘密访华',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1958年赫鲁晓夫秘密访华|1958年赫鲁晓夫秘密访华',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  6,
  '常识',
  '坎儿井：地下的"生命运河"',
  '坎儿井是在干旱地的劳动人民漫长的历史发展中创造的一种地下水利工程。坎儿井引出了地下水，让沙漠变成绿洲，古代称作“井渠”。坎儿井利用山体的自然坡度，把春夏季节渗入地下的雨水、冰川和积雪融水，通过地下暗渠引到地表灌溉，解决了沙漠地区的生产生活用水问题。',
  '常识',
  '中国古代三大工程',
  'common',
  '常识|中国古代三大工程|坎儿井：地下的"生命运河"|坎儿井是在干旱地的劳动人民漫长的历史发展中创造的一种地下水利工程。坎儿井引出了地下水，让沙漠变成绿洲，古代称作“井渠”。坎儿井利用山体的自然坡度，把春夏季节渗入',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  7,
  '常识',
  '万里长城：世界上最长的军事围墙',
  '长城是中国古代的军事防御工事，一道高大、坚固、连绵不断的长垣，用来阻挡敌方骑兵。其修筑史可上溯到西周时期，发生在首都镐京的著名典故“烽火戏诸侯”就源于此。秦灭六国统一天下后，秦始皇连接和修缮战国长城，有万里长城之称。明朝是最后一个大修长城的朝代，今天人们所看到的长城多是此时修筑。
1.齐长城：始建于春秋时期，完成于战国时期，是目前中国现存有准确遗迹可考、保存状况较好、年代最早的古代长城，被誉为“长城之父”。西起黄河，东至黄海，东西蜿蜒千余里。
2.秦长城：西起临洮、东至鸭绿江，共筑万余里，有孟姜女哭长城的传说。
3.明长城：东起鸭绿江，西至嘉峪关，居庸关、紫荆关、倒马关为“内三关”，雁门关、宁武关、偏头关为“外三关”。',
  '常识',
  '中国古代三大工程',
  'common',
  '常识|中国古代三大工程|万里长城：世界上最长的军事围墙|长城是中国古代的军事防御工事，一道高大、坚固、连绵不断的长垣，用来阻挡敌方骑兵。其修筑史可上溯到西周时期，发生在首都镐京的著名典故“烽火戏诸侯”就源于此。秦灭六',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.31.docx'),
  8,
  '常识',
  '京杭大运河：南北交通的大动脉',
  '京杭大运河是世界上里程最长、工程最大的古代运河。始建于春秋时期，开凿于隋朝隋炀帝时期，是世界上里程最长、工程最大的古代运河，大运河南起余杭（今杭州），北到涿郡（今北京），途经今浙江、江苏、山东、河北四省及天津、北京两市，贯通海河、黄河、淮河、长江、钱塘江五大水系。
【总结】
简单说，这三大工程就是古代中国的“三大基建奇迹”，一个管喝水，一个管打仗，一个管运货，正好覆盖了古代国家最要命的三件事，所以被称为“三大工程”。',
  '常识',
  '中国古代三大工程',
  'common',
  '常识|中国古代三大工程|京杭大运河：南北交通的大动脉|京杭大运河是世界上里程最长、工程最大的古代运河。始建于春秋时期，开凿于隋朝隋炀帝时期，是世界上里程最长、工程最大的古代运河，大运河南起余杭（今杭州），北到涿郡（',
  'learning',
  ''
);

COMMIT;
