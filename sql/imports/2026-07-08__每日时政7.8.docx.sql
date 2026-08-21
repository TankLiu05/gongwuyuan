-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.8.docx
-- doc_date: 2026-07-08
-- generated_at: 2026-08-21T08:42:54.219Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.8.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.8.docx',
  '2026-07-08',
  '96a2fdfccda83c3954962404c0485be11651a8fd08a8c84e6a81c40ba0a5d12c',
  'imported',
  '{"paragraphs":89,"articles":5,"questions":5,"knowledge":10,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  1,
  '《习近平关于基层工作方法论述摘编》出版发行',
  '中共中央党史和文献研究院编辑的《习近平关于基层工作方法论述摘编》一书，近日由中央文献出版社出版，在全国发行。
基层是党的执政之基、力量之源，是一切工作的落脚点。习近平同志围绕基层工作方法发表的一系列重要论述，立意高远，内涵丰富，思想深刻，科学回答了什么是基层、如何深入基层、如何服务基层等重大理论和实践问题，深化了对基层工作的规律性认识，对于树立大抓基层的鲜明导向，树立和践行正确政绩观，走好XIN时代党的群众路线，不断增强人民群众的获得感、幸福感、安全感，使中国式现代化拥有最可靠、最深厚、最持久的力量源泉，具有十分重要的意义。（时政来源：人民网）',
  '人民网',
  '2026-07-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  2,
  '形势政策系列报告会第三场报告会在北京举行',
  '“在高质量发展中保障和改善民生”形势政策系列报告会第三场报告会2026年7月6日在北京举行。司法部党组书记、部长贺荣作了“落实‘两个更加注重’　建设更高水平的社会主义法治国家”专题报告。
报告指出，要落实“更加注重法治与改革、发展、稳定相协同”要求，加强重点领域、新兴领域、涉外领域法律法规供给，持续优化法治化营商环境，抓实矛盾纠纷实质性化解，加快涉外法治体系和能力建设，更好服务高质量发展和高水平开放。要落实“更加注重保障和促进社会公平正义”要求，牢固树立和践行正确政绩观，持续健全社会公平正义法治保障制度，推进严格规范公正文明执法，完善普惠性公共法律服务，加强法治宣传教育，实实在在增强人民群众的法治获得感。（时政来源：新华网）',
  '新华网',
  '2026-07-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  3,
  '运-20正式列装10年',
  '2016年7月6日，我国自主研发的新一代军用大型运输机运-20正式列装空军航空兵某部，标志着人民空军战略转型建设站上新起点。十年来，这支部队加强政治锻造、加紧战力生成、加快转型跨越，圆满完成系列重大任务。（时政来源：新华网）',
  '新华网',
  '2026-07-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  4,
  '我国现有人民监督员2.5万人',
  '记者从最高人民检察院2026年7月6日举行的检察开放日活动了解到，目前全国共有人民监督员2.5万人。
人民监督员制度是人民群众对检察办案活动进行监督的重要制度安排，自2003年开始探索试行。（时政来源：央广网）',
  '央广网',
  '2026-07-08',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  5,
  '我国成功发射千帆极轨15组卫星',
  '2026年7月5日21时43分，在海南商业航天发射场，长征八号甲运载火箭将千帆极轨15组卫星准确送入预定轨道，发射任务获得圆满成功。（时政来源：新华网）',
  '新华网',
  '2026-07-08',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  1,
  'document',
  '单选',
  '中共中央党史和文献研究院编辑的《习近平关于基层工作方法论述摘编》一书，近日由中央文献出版社出版，在全国发行。习近平同志围绕基层工作方法发表的一系列重要论述，立意高远，内涵丰富，思想深刻，科学回答了（  ）等重大理论和实践问题，深化了对基层工作的规律性认识。
①怎样夯实基层治理体系
②如何深入基层
③如何服务基层
④什么是基层',
  '[{"key":"A","text":"②③④"},{"key":"B","text":"①③④"},{"key":"C","text":"①②④"},{"key":"D","text":"①②③"}]',
  'A',
  '',
  '原题',
  '2026-07-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  2,
  'document',
  '单选',
  '“在高质量发展中保障和改善民生”形势政策系列报告会第三场报告会2026年7月6日在北京举行。司法部党组书记、部长贺荣作了“落实‘两个更加注重’　建设更高水平的社会主义法治国家”专题报告。报告指出，要落实（  ）要求，加强重点领域、新兴领域、涉外领域法律法规供给，持续优化法治化营商环境，抓实矛盾纠纷实质性化解，加快涉外法治体系和能力建设，更好服务高质量发展和高水平开放。',
  '[{"key":"A","text":"“更加注重科学立法、严格执法、公正司法、全民守法”"},{"key":"B","text":"“更加注重统筹国内法治与涉外法治”"},{"key":"C","text":"“更加注重法治与改革、发展、稳定相协同”"},{"key":"D","text":"“更加注重保障和促进社会公平正义”"}]',
  'C',
  '',
  '原题',
  '2026-07-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  3,
  'document',
  '单选',
  '2016年7月6日，我国自主研发的新一代军用大型运输机（  ）正式列装空军航空兵某部，标志着人民空军战略转型建设站上新起点。十年来，这支部队加强政治锻造、加紧战力生成、加快转型跨越，圆满完成系列重大任务。',
  '[{"key":"A","text":"运-20"},{"key":"B","text":"运-9"},{"key":"C","text":"运-10"},{"key":"D","text":"伊尔-76"}]',
  'A',
  '',
  '原题',
  '2026-07-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  4,
  'document',
  '单选',
  '记者从最高人民检察院2026年7月6日举行的检察开放日活动了解到，目前全国共有人民监督员2.5万人。人民监督员制度是人民群众对检察办案活动进行监督的重要制度安排，自（  ）开始探索试行。',
  '[{"key":"A","text":"2018年"},{"key":"B","text":"2010年"},{"key":"C","text":"2003年"},{"key":"D","text":"2000年"}]',
  'C',
  '',
  '原题',
  '2026-07-08'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  5,
  'document',
  '单选',
  '2026年7月5日21时43分，在（  ），长征八号甲运载火箭将千帆极轨15组卫星准确送入预定轨道，发射任务获得圆满成功。',
  '[{"key":"A","text":"酒泉卫星发射中心"},{"key":"B","text":"太原卫星发射中心"},{"key":"C","text":"西昌卫星发射中心"},{"key":"D","text":"海南商业航天发射场"}]',
  'D',
  '',
  '原题',
  '2026-07-08'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  1,
  '历史上的今天',
  '1914年孙中山在日本召开中华革命党成立大会',
  '1914年孙中山在日本召开中华革命党成立大会',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1914年孙中山在日本召开中华革命党成立大会|1914年孙中山在日本召开中华革命党成立大会',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  2,
  '历史上的今天',
  '1937年中共中央为日军进攻卢沟桥通电',
  '1937年中共中央为日军进攻卢沟桥通电',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1937年中共中央为日军进攻卢沟桥通电|1937年中共中央为日军进攻卢沟桥通电',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  3,
  '历史上的今天',
  '1986年我国国内卫星通信网建成',
  '1986年我国国内卫星通信网建成',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1986年我国国内卫星通信网建成|1986年我国国内卫星通信网建成',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  4,
  '历史上的今天',
  '1997年科学家发现火星生命新证据',
  '1997年科学家发现火星生命新证据',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1997年科学家发现火星生命新证据|1997年科学家发现火星生命新证据',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  5,
  '历史上的今天',
  '2007年中亚经贸合作高层论坛开幕',
  '2007年中亚经贸合作高层论坛开幕',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2007年中亚经贸合作高层论坛开幕|2007年中亚经贸合作高层论坛开幕',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  6,
  '常识',
  '核废水的产生',
  '1.放射性废气中的水蒸气凝结水。
2.核电站无法收集和回收利用的废水。
3.设备故障或人为操作不当导致废水产生。
4.核电站设备冷却后冲洗、厂房冲洗、树脂再生冲洗等产生的废水。',
  '常识',
  '核废水',
  'common',
  '常识|核废水|核废水的产生|1.放射性废气中的水蒸气凝结水。
2.核电站无法收集和回收利用的废水。
3.设备故障或人为操作不当导致废水产生。
4.核电站设备冷却后冲洗、厂房冲洗、树脂再生冲',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  7,
  '常识',
  '核废水处理方式',
  '核废水中有氪-85（半衰期为10.76年）、氙-133（半衰期为5.25天）、锶-90（半衰期29年）、碘-131（半衰期为8.02天）、铯-134（半衰期为2.06年）、铯-137（半衰期为30.17年）等放射性元素，处理核废水的根本是保证含有的放射性元素衰变，降低辐射危害，而后才能在国际组织监督下进行处理。
目前核废水的处理方法有多种，如通过火箭装载发射太空、注入地层、排放入海，但实际上这些手段只是饮鸩止渴，转移核辐射危害，故大多选择将核废水存储在特殊材料制成的贮存罐中，等待未来科学攻破此难题再予以解决。
注：放射性元素铯-137可在骨骼中沉积，且其可存在29年之久，最终诱发骨骼及周围组织癌症、白血病及循环系统疾病的发生。',
  '常识',
  '核废水',
  'common',
  '常识|核废水|核废水处理方式|核废水中有氪-85（半衰期为10.76年）、氙-133（半衰期为5.25天）、锶-90（半衰期29年）、碘-131（半衰期为8.02天）、铯-134（半衰期为2',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  8,
  '常识',
  '核废水处理工艺',
  '核废水的处理工艺有：
（1）化学沉淀法；
（2）离子交换法；
（3）吸附法；
（4）蒸发浓缩；
（5）膜分离技术；
（6）生物处理法；
（7）磁-分子法；
（8）惰性固化法；
（9）零价铁渗滤反应墙技术。',
  '常识',
  '核废水',
  'common',
  '常识|核废水|核废水处理工艺|核废水的处理工艺有：
（1）化学沉淀法；
（2）离子交换法；
（3）吸附法；
（4）蒸发浓缩；
（5）膜分离技术；
（6）生物处理法；
（7）磁-分子法；
（8',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  9,
  '常识',
  '核废水危害',
  '1.放射性元素会在海洋生物中不断积蓄，人类打捞食用海洋生物，也同样会在人体内不断积蓄，对人体产生危害，这就是生物富集效应。',
  '常识',
  '核废水',
  'common',
  '常识|核废水|核废水危害|1.放射性元素会在海洋生物中不断积蓄，人类打捞食用海洋生物，也同样会在人体内不断积蓄，对人体产生危害，这就是生物富集效应。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.8.docx'),
  10,
  '拓展',
  '生物富集效应：生物体从周围环境中吸收某种物质,在体内积累,使生物体内物质的浓度超过环境中浓度的作用。最直接的表现就是生物体内物质浓度比环境高，越往食物链后端，浓度越高。',
  '2.核废水污染饮用水，进而污染土壤及陆地动植物。一旦处理不当，很有可能对环境和生物带来巨大危害。受海洋洋流影响，若将核废水排入太平洋，预计140天后，核污染将影响我国东海及南海领域，1年，核污染将覆盖整个北太平洋，2年内会对我国大部分沿海区域产生影响。目前来讲并没有大批量处理核废水到安全级别的成熟技术，因此处理后的核废水，也无法可达到饮用级别。
3.核废水可能会引起下列疾病：
（1）急性放射病（ARS）；
（2）肿瘤；
（3）甲状腺癌；
（4）致畸变；
（5）骨癌、白血病及循环系统疾病。
4.放射性还会损害遗传物质，能够引起基因突变和染色体畸变，使一代人甚至几代人都受到影响。',
  '拓展',
  '生物富集效应：生物体从周围环境中吸收某种物质,在体内积累,使生物体内物质的浓度超过环境中浓度的作用。最直接的表现就是生物体内物质浓度比环境高，越往食物链后端，浓度越高。',
  'extension',
  '拓展|生物富集效应：生物体从周围环境中吸收某种物质,在体内积累,使生物体内物质的浓度超过环境中浓度的作用。最直接的表现就是生物体内物质浓度比环境高，越往食物链后端，浓度越高。|生物富集效应：生物体从周围环境中吸收某种物质,在体内积累,使生物体内物质的浓度超过环境中浓度的作用。最直接的表现就是生物体内物质浓度比环境高，越往食物链后端，浓度越高。|2.核废水污染饮用水，进而污染土壤及陆地动植物。一旦处理不当，很有可能对环境和生物带来巨大危害。受海洋洋流影响，若将核废水排入太平洋，预计140天后，核污染将影',
  'learning',
  ''
);

COMMIT;
