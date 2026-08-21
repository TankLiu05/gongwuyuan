-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.5.docx
-- doc_date: 2026-07-05
-- generated_at: 2026-08-21T08:42:54.218Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.5.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.5.docx',
  '2026-07-05',
  '439e28509cc896f562893c5f660d1ff57cdcfee202fc222fb230f0c4638fd8dc',
  'imported',
  '{"paragraphs":67,"articles":5,"questions":5,"knowledge":8,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  1,
  '我国首艘数智化改造海事公务船艇投入试用',
  '2026年7月3日，我国首艘数智化改造的海事公务船艇“海巡14102”在深圳投入试用。（时政来源：央广网）',
  '央广网',
  '2026-07-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  2,
  '2026全球数字经济大会开幕',
  '7月2日，2026全球数字经济大会在北京国家会议中心开幕。本届大会以“建设数字友好城市——智惠无界，数联全球”为主题，聚焦人工智能、数字治理、数据要素等领域，搭建“1+1+N”活动框架，以一场开幕式、一场“数字友好城市建设全球对话会”主论坛、N场专题论坛和全年系列活动，推动数字创新成果共享、数字治理互信，向全球呈现一场崭新的数字盛宴。（时政来源：新华网）',
  '新华网',
  '2026-07-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  3,
  '中共全国政协党组理论学习中心组举行2026年第三次集体学习',
  '中共全国政协党组理论学习中心组7月3日举行2026年第三次集体学习，主题是“学习贯彻习近平总书记在庆祝中国共产党成立105周年大会上的重要讲话精神，学习贯彻习近平党建思想”。
会议指出，习近平总书记在庆祝中国共产党成立105周年大会上的重要讲话，深刻阐明中国共产党之所以能够不断铸就辉煌的优秀特质和关键密码，坚定发出在全面建设社会主义现代化国家新征程上大力弘扬伟大建党精神、始终牢记初心使命、坚定信心接续奋斗、奋力创造新的历史辉煌的伟大号召。（时政来源：新华网）',
  '新华网',
  '2026-07-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  4,
  '韩正出席第十四届世界和平论坛开幕式并致辞',
  '2026年7月3日，国家副主席韩正在清华大学出席第十四届世界和平论坛开幕式并致辞。
韩正提出四点建议。一是坚定维护联合国权威和地位。二是深化拓展多边机制合作。三是推动完善全球经济治理。中国提出平等、开放、合作、共享的全球经济治理观，主张构建和维护公平公正、开放包容、合作共赢的国际经济秩序。四是加强人工智能等新兴领域治理。（时政来源：新华网）',
  '新华网',
  '2026-07-05',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  5,
  '中国团队凭电池回收新技术获2026年欧洲发明家奖',
  '总部设在德国慕尼黑的欧洲专利局7月2日在柏林举行颁奖典礼，公布2026年欧洲发明家奖获奖名单。中国发明家余海军、谢英豪凭借智能电池回收相关发明，荣获2026年欧洲发明家奖（“非欧洲专利局成员国奖”类别），并同时获得本届欧洲发明家奖“人气奖”。（时政来源：新华网）',
  '新华网',
  '2026-07-05',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  1,
  'document',
  '单选',
  '2026年7月3日，我国首艘数智化改造的海事公务船艇（  ）在深圳投入试用。',
  '[{"key":"A","text":"“海巡31”"},{"key":"B","text":"“海巡160”"},{"key":"C","text":"“海巡09”"},{"key":"D","text":"“海巡14102”"}]',
  'D',
  '',
  '原题',
  '2026-07-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  2,
  'document',
  '单选',
  '7月2日，2026全球数字经济大会在北京国家会议中心开幕。本届大会以（  ）为主题。',
  '[{"key":"A","text":"“建设数字友好城市——智惠无界，数联全球”"},{"key":"B","text":"“数实深度融合，激活全球经济动能”"},{"key":"C","text":"“数字赋能产业，创新驱动发展”"},{"key":"D","text":"“共建数字治理新秩序，共享数字发展新机遇”"}]',
  'A',
  '',
  '原题',
  '2026-07-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  3,
  'document',
  '单选',
  '中共全国政协党组理论学习中心组7月3日举行2026年第三次集体学习。会议指出，习近平总书记在庆祝中国共产党成立105周年大会上的重要讲话，坚定发出在全面建设社会主义现代化国家新征程上（  ）的伟大号召。
①大力弘扬伟大建党精神
②始终牢记初心使命
③坚定信心接续奋斗
④奋力创造新的历史辉煌',
  '[{"key":"A","text":"①②③④"},{"key":"B","text":"①②④"},{"key":"C","text":"①③④"},{"key":"D","text":"①②③"}]',
  'A',
  '',
  '原题',
  '2026-07-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  4,
  'document',
  '单选',
  '2026年7月3日，国家副主席韩正在清华大学出席第十四届世界和平论坛开幕式并致辞。韩正指出，中国提出（  ）的全球经济治理观，主张构建和维护（  ）的国际经济秩序。',
  '[{"key":"A","text":"和平、发展、公平、正义；相互尊重、平等协商、持久繁荣"},{"key":"B","text":"互利互通、开放自由；资本优先、单边高效、利益至上"},{"key":"C","text":"平等、开放、合作、共享；公平公正、开放包容、合作共赢"},{"key":"D","text":"共商共建共享；普惠包容、均衡发展、互利互惠"}]',
  'C',
  '',
  '原题',
  '2026-07-05'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  5,
  'document',
  '单选',
  '总部设在德国慕尼黑的欧洲专利局7月2日在柏林举行颁奖典礼，公布2026年欧洲发明家奖获奖名单。中国发明家（  ）凭借智能电池回收相关发明，荣获2026年欧洲发明家奖（“非欧洲专利局成员国奖”类别）。',
  '[{"key":"A","text":"陈立泉、黄学杰"},{"key":"B","text":"万立骏、孙世刚"},{"key":"C","text":"欧阳明高、马衍伟"},{"key":"D","text":"余海军、谢英豪"}]',
  'D',
  '',
  '原题',
  '2026-07-05'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  1,
  '历史上的今天',
  '1854年《上海英法美租地章程》公布',
  '1854年《上海英法美租地章程》公布',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1854年《上海英法美租地章程》公布|1854年《上海英法美租地章程》公布',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  2,
  '历史上的今天',
  '1918年中华民国军政府组成',
  '1918年中华民国军政府组成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1918年中华民国军政府组成|1918年中华民国军政府组成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  3,
  '历史上的今天',
  '1930年周恩来在联共会议上作报告',
  '1930年周恩来在联共会议上作报告',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1930年周恩来在联共会议上作报告|1930年周恩来在联共会议上作报告',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  4,
  '历史上的今天',
  '1943年王稼祥首次提出“毛泽东思想”',
  '1943年王稼祥首次提出“毛泽东思想”',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1943年王稼祥首次提出“毛泽东思想”|1943年王稼祥首次提出“毛泽东思想”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  5,
  '历史上的今天',
  '1948年北平发生“七·五”惨案',
  '1948年北平发生“七·五”惨案',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1948年北平发生“七·五”惨案|1948年北平发生“七·五”惨案',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  6,
  '常识',
  '什么是曼德拉效应',
  '曼德拉效应是一种群体性记忆偏差现象，指大量人群对同一个事件、事物细节，产生了高度一致但与事实完全不符的错误记忆，且多数人会坚定认为自己的记忆是正确的。
该概念最早在2010年由美国博主菲奥娜・布鲁姆提出：她清晰记得南非前总统纳尔逊・曼德拉在1980年代就死于监狱中，甚至能回忆起相关新闻和葬礼画面，但现实中曼德拉1990年才出狱，2013年才去世。她随后发现有大量人和她拥有完全相同的错误记忆，便用曼德拉的名字命名了这一现象。',
  '常识',
  '曼德拉效应',
  'common',
  '常识|曼德拉效应|什么是曼德拉效应|曼德拉效应是一种群体性记忆偏差现象，指大量人群对同一个事件、事物细节，产生了高度一致但与事实完全不符的错误记忆，且多数人会坚定认为自己的记忆是正确的。
该概念最',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  7,
  '常识',
  '经典案例',
  '1.皮卡丘的尾巴：绝大多数人印象里皮卡丘尾巴末端是黑色的，但官方设定中皮卡丘尾巴全程为黄色，仅根部有少量棕色，没有黑色尖端。
2.《爱我中华》歌词：大众普遍记忆首句是“五十六个民族，五十六枝花”，但原版歌词实际是“五十六个星座，五十六枝花”。
3.《思想者》雕像：很多人记忆里罗丹的《思想者》是手握拳抵着额头，实际雕像的手是抵在下巴处。
4.汉字笔画偏差：大量人认为“真、直、具”这类字内部是两横，实际规范写法是三横。',
  '常识',
  '曼德拉效应',
  'common',
  '常识|曼德拉效应|经典案例|1.皮卡丘的尾巴：绝大多数人印象里皮卡丘尾巴末端是黑色的，但官方设定中皮卡丘尾巴全程为黄色，仅根部有少量棕色，没有黑色尖端。
2.《爱我中华》歌词：大众普遍记忆',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.5.docx'),
  8,
  '常识',
  '总结',
  '曼德拉效应就是一大群人齐刷刷记错了同一件事，还都觉得自己没记错。它不是什么超自然现象，本质就是我们的大脑记东西没那么靠谱——细节记不清时会自己“脑补”，再加上网上错信息传得多了，大家互相带偏，最后就形成了集体性的记忆错觉。',
  '常识',
  '曼德拉效应',
  'common',
  '常识|曼德拉效应|总结|曼德拉效应就是一大群人齐刷刷记错了同一件事，还都觉得自己没记错。它不是什么超自然现象，本质就是我们的大脑记东西没那么靠谱——细节记不清时会自己“脑补”，再加上网',
  'learning',
  ''
);

COMMIT;
