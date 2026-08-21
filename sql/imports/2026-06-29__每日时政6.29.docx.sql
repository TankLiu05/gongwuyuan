-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政6.29.docx
-- doc_date: 2026-06-29
-- generated_at: 2026-08-21T08:42:54.217Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政6.29.docx',
  '/Users/tank/Desktop/每日时政/每日时政6.29.docx',
  '2026-06-29',
  'c3467feb335e33051a060833380696eb74db4e4a15d7fe6e3496cacc38dd985b',
  'imported',
  '{"paragraphs":76,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  1,
  '新华社国家高端智库发布“购在中国”报告',
  '2026年6月26日，新华社国家高端智库发布《购在中国：共享开放发展新机遇》智库报告。
报告认为，“购在中国”的蓬勃发展具有重要世界意义，不仅激活了自身消费市场，更为全球服务贸易繁荣提供了宝贵的“中国机遇”。中国不断扩大制度型开放，坚定维护经济全球化，构建起“在中国、购全球”的双向开放新格局，彰显了中国主动对标国际高标准经贸规则、加大开放力度，与世界携手共进、合作共赢的坚定决心。（时政来源：新华网）',
  '新华网',
  '2026-06-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  2,
  '权威AI时政资讯智能体“新华语典”正式上线',
  '新华通讯社2026年6月26日在北京正式发布权威AI时政资讯智能体——“新华语典”。顺应时代发展趋势，“新华语典”基于新华社数据、依托先进大模型技术，通过“高可靠内容人工智能”满足广大受众学习、研究、写作等需要，是一款新型垂类智能体。（时政来源：新华网）',
  '新华网',
  '2026-06-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  3,
  '我国首条民营控股高铁客流破亿',
  '铁路部门统计数据显示，截至2026年6月27日，我国首条民营控股高铁——杭台高铁累计客流突破1亿人次。（时政来源：新华网）',
  '新华网',
  '2026-06-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  4,
  '仰韶先民基因在黄河中游连续遗传6200年',
  '记者2026年6月27日从河南省文物考古研究院获悉，一项最新研究表明：黄河中游地区人群基因具有高度的遗5传连续性，且均可溯源至6200年前的仰韶文化先民。这为探索该地区人群扩散模式与遗传格局演变提供了新视角。（时政来源：新华网）',
  '新华网',
  '2026-06-29',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  5,
  '李书磊出席中国音协、中国舞协、中国杂协全代会开幕式并讲话',
  '中国音乐家协会第十次全国代表大会、中国舞蹈家协会第十二次全国代表大会、中国杂技家协会第九次全国代表大会2026年6月27日在北京召开。中共中央政治局委员、中宣部部长李书磊出席开幕式并讲话。
代表们认为，近年来广大音乐、舞蹈、杂技工作者深入学习实践习近平文化思想，围绕中心、服务大局，以声传情、以形塑魂、以技赋美，推出许多反映时代、讴歌人民的艺术佳作，在提高大众审美、凝聚奋进力量、深化对外交流等方面发挥了重要作用，为繁荣发展社会主义文艺作出了积极贡献。（时政来源：新华网）',
  '新华网',
  '2026-06-29',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  1,
  'document',
  '单选',
  '2026年6月26日，新华社国家高端智库发布《购在中国：共享开放发展新机遇》智库报告。报告认为，中国不断扩大制度型开放，坚定维护经济全球化，构建起（  ）的双向开放新格局，彰显了中国主动对标国际高标准经贸规则、加大开放力度，与世界携手共进、合作共赢的坚定决心。',
  '[{"key":"A","text":"“在中国、购全球”"},{"key":"B","text":"“走出去、引进来”"},{"key":"C","text":"“买全球、卖全球”"},{"key":"D","text":"“促流通、扩内需”"}]',
  'A',
  '',
  '原题',
  '2026-06-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  2,
  'document',
  '单选',
  '新华通讯社2026年6月26日在北京正式发布权威AI时政资讯智能体——（  ）。',
  '[{"key":"A","text":"“新华语库”"},{"key":"B","text":"“新华语典”"},{"key":"C","text":"“新华辞典”"},{"key":"D","text":"“新华网库”"}]',
  'B',
  '',
  '原题',
  '2026-06-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  3,
  'document',
  '单选',
  '铁路部门统计数据显示，截至2026年6月27日，我国首条民营控股高铁——（  ）累计客流突破1亿人次。',
  '[{"key":"A","text":"十堰高铁"},{"key":"B","text":"成渝高铁"},{"key":"C","text":"杭台高铁"},{"key":"D","text":"宁兰高铁"}]',
  'C',
  '',
  '原题',
  '2026-06-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  4,
  'document',
  '单选',
  '记者2026年6月27日从河南省文物考古研究院获悉，一项最新研究表明：黄河中游地区人群基因具有高度的遗传连续性，且均可溯源至6200年前的（  ）先民。',
  '[{"key":"A","text":"河姆渡文化"},{"key":"B","text":"三星堆文化"},{"key":"C","text":"良渚文化"},{"key":"D","text":"仰韶文化"}]',
  'D',
  '',
  '原题',
  '2026-06-29'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  5,
  'document',
  '单选',
  '中国音乐家协会第十次全国代表大会、中国舞蹈家协会第十二次全国代表大会、中国杂技家协会第九次全国代表大会2026年6月27日在北京召开。代表们认为，近年来广大音乐、舞蹈、杂技工作者深入学习实践习近平文化思想，（  ），推出许多反映时代、讴歌人民的艺术佳作，在提高大众审美、凝聚奋进力量、深化对外交流等方面发挥了重要作用，为繁荣发展社会主义文艺作出了积极贡献。
①以声传情；②以形塑魂；③以技赋美；④以文铸魂',
  '[{"key":"A","text":"②③④"},{"key":"B","text":"①③④"},{"key":"C","text":"①②④"},{"key":"D","text":"①②③"}]',
  'D',
  '',
  '原题',
  '2026-06-29'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  1,
  '历史上的今天',
  '1900年诺贝尔基金会成立',
  '1900年诺贝尔基金会成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年诺贝尔基金会成立|1900年诺贝尔基金会成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  2,
  '历史上的今天',
  '1913年第二次巴尔干战争爆发',
  '1913年第二次巴尔干战争爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1913年第二次巴尔干战争爆发|1913年第二次巴尔干战争爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  3,
  '历史上的今天',
  '1946年苏加诺号召为独立而战',
  '1946年苏加诺号召为独立而战',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1946年苏加诺号召为独立而战|1946年苏加诺号召为独立而战',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  4,
  '历史上的今天',
  '1959年毛泽东庐山谈“大跃进”的教训',
  '1959年毛泽东庐山谈“大跃进”的教训',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1959年毛泽东庐山谈“大跃进”的教训|1959年毛泽东庐山谈“大跃进”的教训',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  5,
  '历史上的今天',
  '2003年全国科普行动日',
  '2003年全国科普行动日',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2003年全国科普行动日|2003年全国科普行动日',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  6,
  '常识',
  '用人单位试用期',
  '试用期是用人单位考察劳动者履职能力、劳动者了解岗位情况的双向考核阶段，也是劳动用工中高频涉及的法律要点。
一、期限
1.禁止约定试用期
以完成一定工作任务为期限的劳动合同或者劳动合同期限不满三个月的，不得约定试用期。
2.按合同期限划定上限
劳动合同期限三个月以上不满一年的，试用期不得超过一个月；劳动合同期限一年以上不满三年的，试用期不得超过二个月；三年以上固定期限和无固定期限的劳动合同，试用期不得超过六个月。',
  '常识',
  '用人单位试用期',
  'common',
  '常识|用人单位试用期|用人单位试用期|试用期是用人单位考察劳动者履职能力、劳动者了解岗位情况的双向考核阶段，也是劳动用工中高频涉及的法律要点。
一、期限
1.禁止约定试用期
以完成一定工作任务为期限',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  7,
  '拓展',
  '注意与事业单位的试用期有所区别：初次就业的工作人员与事业单位订立的聘用合同期限3年以上的，试用期为12个月。',
  '二、试用期约定规则
1.约定次数限制
同一用人单位与同一劳动者只能约定一次试用期。
2.合同效力界定
试用期属于劳动合同约定条款，并非必备条款，双方可协商选择是否约定，不约定试用期不影响劳动合同生效。
3.特殊合同认定
试用期包含在劳动合同期限内。劳动合同仅约定试用期的，试用期不成立，该期限为劳动合同期限。
三、试用期工资标准
试用期薪资有双重法定底线，二者必须同时满足：
1.劳动者在试用期的工资不得低于本单位相同岗位最低档工资或者劳动合同约定工资的百分之八十；
2.不得低于用人单位所在地的最低工资标准。
四、试用期劳动合同解除
1.在试用期间被证明不符合录用条件的，用人单位可以解除劳动合同。
2.用人单位在试用期解除劳动合同的，应当向劳动者说明理由。',
  '拓展',
  '注意与事业单位的试用期有所区别：初次就业的工作人员与事业单位订立的聘用合同期限3年以上的，试用期为12个月。',
  'extension',
  '拓展|注意与事业单位的试用期有所区别：初次就业的工作人员与事业单位订立的聘用合同期限3年以上的，试用期为12个月。|注意与事业单位的试用期有所区别：初次就业的工作人员与事业单位订立的聘用合同期限3年以上的，试用期为12个月。|二、试用期约定规则
1.约定次数限制
同一用人单位与同一劳动者只能约定一次试用期。
2.合同效力界定
试用期属于劳动合同约定条款，并非必备条款，双方可协商选择是',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政6.29.docx'),
  8,
  '拓展',
  '试用期隶属于劳动合同存续期间，用人单位需正常为劳动者缴纳社会保险，不得以此为由拒缴。',
  '试用期隶属于劳动合同存续期间，用人单位需正常为劳动者缴纳社会保险，不得以此为由拒缴。',
  '拓展',
  '试用期隶属于劳动合同存续期间，用人单位需正常为劳动者缴纳社会保险，不得以此为由拒缴。',
  'extension',
  '拓展|试用期隶属于劳动合同存续期间，用人单位需正常为劳动者缴纳社会保险，不得以此为由拒缴。|试用期隶属于劳动合同存续期间，用人单位需正常为劳动者缴纳社会保险，不得以此为由拒缴。|试用期隶属于劳动合同存续期间，用人单位需正常为劳动者缴纳社会保险，不得以此为由拒缴。',
  'learning',
  ''
);

COMMIT;
