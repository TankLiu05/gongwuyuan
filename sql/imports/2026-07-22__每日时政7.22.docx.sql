-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.22.docx
-- doc_date: 2026-07-22
-- generated_at: 2026-08-21T08:42:54.222Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.22.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.22.docx',
  '2026-07-22',
  '12fb4532be139af34e346e95c131fb2d7cf2ea2f4ae59e4ad79acf686ece50bd',
  'imported',
  '{"paragraphs":73,"articles":5,"questions":5,"knowledge":11,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  1,
  '我国国家综合立体交通网里程超过600万公里',
  '2026年7月21日，国新办举行“开局起步‘十五五’”系列主题新闻发布会，介绍加快建设交通强国、完善现代化综合交通运输体系有关情况。
交通运输部副部长徐成光会上表示，“十四五”期间，我国国家综合立体交通网里程超过600万公里，“6轴7廊8通道”主骨架建成率达91%，高铁运营里程突破5万公里，高速公路通车里程达19.9万公里，港口万吨级及以上泊位数量达3061个，运输机场总数达270个，建成世界上规模最大、受益人数最多的寄递网络。（时政来源：央视网）',
  '央视网',
  '2026-07-22',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  2,
  '全球首艘41800吨双向航行自卸船交付',
  '2026年7月21日，我国自主研发建造的全球首艘41800吨双向航行自卸船在江苏交付，标志着我国在高端自卸转运船舶领域实现从“跟跑”到“领跑”的关键性跨越。（时政来源：央视网）',
  '央视网',
  '2026-07-22',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  3,
  '全国首趟跨境海铁公“一单制”班列今天开行',
  '2026年7月21日上午，一列满载商用车及汽车零配件集装箱班列X（行）80442次将从烟台港驶出，这标志着全国首趟跨境海铁公“一单制”班列成功开行。（时政来源：央广网）',
  '央广网',
  '2026-07-22',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  4,
  '水利部：到2035年基本形成完备的水利遥感卫星应用体系',
  '水利部日前印发《水利遥感卫星应用发展总体方案（2026—2035年）》，将通过统筹推进水利遥感卫星资源、数据资源、业务应用、技术创新和技术标准四大体系建设，有效扩充卫星资源。到2030年，初步形成覆盖主要业务领域的水利遥感卫星应用体系；到2035年，基本形成完备的水利遥感卫星应用体系，亚米级分辨率影像覆盖能力大幅提升，进一步提高重大水利应急事件快速监测能力。（时政来源：央广网）',
  '央广网',
  '2026-07-22',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  5,
  '中国一汽博物馆正式对外开放',
  '2026年7月21日，中国一汽博物馆正式开馆迎客。新中国第一辆汽车解放CA10、新中国第一辆国产轿车东风CA71、首款红旗高级轿车CA72悉数展出，让人们近距离感受民族汽车工业的成长故事。（时政来源：人民网）',
  '人民网',
  '2026-07-22',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  1,
  'document',
  '单选',
  '2026年7月21日，国新办举行“开局起步‘十五五’”系列主题新闻发布会，介绍加快建设交通强国、完善现代化综合交通运输体系有关情况。交通运输部副部长徐成光会上表示，“十四五”期间，我国国家综合立体交通网里程超过600万公里，（  ）主骨架建成率达91%。',
  '[{"key":"A","text":"“5轴6廊7通道”"},{"key":"B","text":"“7轴8廊9通道”"},{"key":"C","text":"“6轴7廊8通道”"},{"key":"D","text":"“3轴4廊5通道”"}]',
  'C',
  '',
  '原题',
  '2026-07-22'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  2,
  'document',
  '单选',
  '2026年7月21日，我国自主研发建造的全球首艘（  ）在江苏交付，标志着我国在高端自卸转运船舶领域实现从“跟跑”到“领跑”的关键性跨越。',
  '[{"key":"A","text":"52600吨单向航行自卸船"},{"key":"B","text":"41800吨双向航行自卸船"},{"key":"C","text":"30000吨双向航行自卸船"},{"key":"D","text":"74100吨单向航行自卸船"}]',
  'B',
  '',
  '原题',
  '2026-07-22'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  3,
  'document',
  '单选',
  '2026年7月21日上午，一列满载商用车及汽车零配件集装箱班列X（行）80442次将从（  ）驶出，这标志着全国首趟跨境海铁公“一单制”班列成功开行。',
  '[{"key":"A","text":"青岛港"},{"key":"B","text":"舟山港"},{"key":"C","text":"日照港"},{"key":"D","text":"烟台港"}]',
  'D',
  '',
  '原题',
  '2026-07-22'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  4,
  'document',
  '单选',
  '根据水利部日前印发的《水利遥感卫星应用发展总体方案（2026—2035年）》，到（  ）年，初步形成覆盖主要业务领域的水利遥感卫星应用体系；到（  ）年，基本形成完备的水利遥感卫星应用体系。',
  '[{"key":"A","text":"2029;2030"},{"key":"B","text":"2030;2035"},{"key":"C","text":"2027;2030"},{"key":"D","text":"2026;2030"}]',
  'B',
  '',
  '原题',
  '2026-07-22'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  5,
  'document',
  '单选',
  '2026年7月21日，中国一汽博物馆正式开馆迎客。新中国第一辆汽车（  ）、新中国第一辆国产轿车（  ）、首款红旗高级轿车CA72悉数展出，让人们近距离感受民族汽车工业的成长故事。',
  '[{"key":"A","text":"解放CA10；红旗CA770"},{"key":"B","text":"解放CA10；东风CA71"},{"key":"C","text":"跃进NJ130；东风CA71"},{"key":"D","text":"解放CA141；红旗CA72"}]',
  'B',
  '',
  '原题',
  '2026-07-22'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  1,
  '历史上的今天',
  '1927年彭德怀滕代远发动平江起义',
  '1927年彭德怀滕代远发动平江起义',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1927年彭德怀滕代远发动平江起义|1927年彭德怀滕代远发动平江起义',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  2,
  '历史上的今天',
  '1940年百团大战中八路军破击正太路',
  '1940年百团大战中八路军破击正太路',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1940年百团大战中八路军破击正太路|1940年百团大战中八路军破击正太路',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  3,
  '历史上的今天',
  '1952年埃及七月革命爆发',
  '1952年埃及七月革命爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1952年埃及七月革命爆发|1952年埃及七月革命爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  4,
  '历史上的今天',
  '1954年我国组建海军第一支驱逐舰大队',
  '1954年我国组建海军第一支驱逐舰大队',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1954年我国组建海军第一支驱逐舰大队|1954年我国组建海军第一支驱逐舰大队',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  5,
  '历史上的今天',
  '1970年成昆铁路建成通车',
  '1970年成昆铁路建成通车',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1970年成昆铁路建成通车|1970年成昆铁路建成通车',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  6,
  '常识',
  '国家概况',
  '西班牙王国是欧洲西南部的君主立宪制国家，为欧盟、欧元区、申根区核心成员国，地处欧洲、非洲与大西洋、地中海的交汇枢纽，战略位置重要。首都为马德里，是全国政治、经济与文化中心。',
  '常识',
  '世界杯冠军——西班牙',
  'common',
  '常识|世界杯冠军——西班牙|国家概况|西班牙王国是欧洲西南部的君主立宪制国家，为欧盟、欧元区、申根区核心成员国，地处欧洲、非洲与大西洋、地中海的交汇枢纽，战略位置重要。首都为马德里，是全国政治、经济',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  7,
  '常识',
  '历史与政治',
  '1.历史沿革：曾先后受罗马帝国、阿拉伯摩尔人统治，1492年“光复运动”完成国家统一，随后在大航海时代建立全球性殖民帝国；1978年通过新宪法，正式确立议会制君主立宪制。
2.政治体制：实行议会制君主立宪制，国王为象征性国家元首，首相为政府首脑；政局长期稳定，是欧洲一体化进程的重要参与者与推动者。',
  '常识',
  '世界杯冠军——西班牙',
  'common',
  '常识|世界杯冠军——西班牙|历史与政治|1.历史沿革：曾先后受罗马帝国、阿拉伯摩尔人统治，1492年“光复运动”完成国家统一，随后在大航海时代建立全球性殖民帝国；1978年通过新宪法，正式确立议会制君',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  8,
  '常识',
  '人口与社会',
  '1.人口：总人口约4900万，为欧盟人口第四大国。
2.民族构成：主体民族为卡斯蒂利亚人，同时有加泰罗尼亚人、加利西亚人、巴斯克人等少数民族。
3.语言宗教：官方语言为西班牙语（卡斯蒂利亚语），是全球使用人数第二多的母语；全国多数居民信奉天主教。',
  '常识',
  '世界杯冠军——西班牙',
  'common',
  '常识|世界杯冠军——西班牙|人口与社会|1.人口：总人口约4900万，为欧盟人口第四大国。
2.民族构成：主体民族为卡斯蒂利亚人，同时有加泰罗尼亚人、加利西亚人、巴斯克人等少数民族。
3.语言宗教：官',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  9,
  '常识',
  '自然地理',
  '1.地理区位：国土主体位于伊比利亚半岛，西邻葡萄牙，东北与法国、安道尔接壤，南隔直布罗陀海峡与非洲摩洛哥相望；下辖加那利群岛、巴利阿里群岛等海外领地，海岸线总长约7800公里。
2.地形气候：境内以高原山地为主，中部为梅塞塔高原；气候以地中海气候为主，夏季炎热干燥、冬季温和多雨，是欧洲光照资源最丰富的国家之一。',
  '常识',
  '世界杯冠军——西班牙',
  'common',
  '常识|世界杯冠军——西班牙|自然地理|1.地理区位：国土主体位于伊比利亚半岛，西邻葡萄牙，东北与法国、安道尔接壤，南隔直布罗陀海峡与非洲摩洛哥相望；下辖加那利群岛、巴利阿里群岛等海外领地，海岸线总长',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  10,
  '常识',
  '经济与文化',
  '1.产业结构：发达资本主义国家，欧元区第四大经济体；经济以服务业为核心，旅游业、海运物流、金融商务占比突出；工业端汽车制造、新能源、高端装备实力强劲；农业特色鲜明，橄榄油、葡萄酒出口量长期居世界前列。
2.文化特色：世界遗产数量位居全球前列，弗拉门戈舞、斗牛是标志性文化符号；诞生了《堂吉诃德》作者塞万提斯等文学巨匠，西班牙语文化圈覆盖全球二十余个国家。',
  '常识',
  '世界杯冠军——西班牙',
  'common',
  '常识|世界杯冠军——西班牙|经济与文化|1.产业结构：发达资本主义国家，欧元区第四大经济体；经济以服务业为核心，旅游业、海运物流、金融商务占比突出；工业端汽车制造、新能源、高端装备实力强劲；农业特色鲜',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.22.docx'),
  11,
  '常识',
  '体育成就',
  '足球为西班牙国民级运动，西班牙足球甲级联赛是世界顶级职业联赛，皇家马德里、巴塞罗那为全球顶尖豪门俱乐部。
1.世界杯：分别于2010年南非世界杯、2026年美加墨世界杯两次夺冠；
2.欧洲杯：共4次夺得冠军（1964年、2008年、2012年、2024年），是欧洲杯历史上夺冠次数最多的国家；
3.曾实现2008欧洲杯、2010世界杯、2012欧洲杯“大赛三连冠”，2024年欧洲杯夺冠后再夺2026年世界杯冠军，第二次达成大赛连冠成就。',
  '常识',
  '世界杯冠军——西班牙',
  'common',
  '常识|世界杯冠军——西班牙|体育成就|足球为西班牙国民级运动，西班牙足球甲级联赛是世界顶级职业联赛，皇家马德里、巴塞罗那为全球顶尖豪门俱乐部。
1.世界杯：分别于2010年南非世界杯、2026年美加',
  'learning',
  ''
);

COMMIT;
