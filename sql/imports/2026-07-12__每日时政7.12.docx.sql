-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.12.docx
-- doc_date: 2026-07-12
-- generated_at: 2026-08-21T08:42:54.220Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.12.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.12.docx',
  '2026-07-12',
  'aea779664399e39ae37d3533881778e960c1154c24054a4335e26522060c4fdd',
  'imported',
  '{"paragraphs":55,"articles":5,"questions":5,"knowledge":11,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  1,
  '我国全国产十万卡AI超集群落成',
  '记者2026年7月10日从中科曙光获悉，由公司研发的我国全国产十万卡AI超集群"曙光8000(登峰)"正式发布并投入使用。(时政来源:新华网)',
  '',
  '2026-07-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  2,
  '报告预计3年内我国数据库市场总规模将超970亿元    2026年7月9日，《数据库发展研究报告(2026年)》在2026可信数据库发展大会上对外发布。报告预计，到2028年中国数据库市场总规模将达到979.74亿元,市场年复合增长率为13.06%。(时政来源:新华网)',
  '',
  '',
  '2026-07-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  3,
  '第三十二届中国兰州投资贸易洽谈会开幕',
  '2026年7月9日，第三十二届中国兰州投资贸易洽谈会在甘肃省兰州市开幕。本届兰洽会以"务实合作新机遇开放发展新格局"为主题，吸引海内外千余家企业齐聚黄河之滨。(时政来源:新华网)',
  '',
  '2026-07-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  4,
  '中国汽车出海迎来从"规模扩张"向"价值出海"的关键跨越    2026年上半年，中国汽车出口表现尤为亮眼。其中，新能源汽车出口235.5万辆，同比增长1.2倍，成为拉动汽车出口增长的核心引擎。    针对上半年中国新能源汽车出海呈现出的爆发式增长与结构性升级，国际机构里斯咨询的专家在接受采访时指出，中国汽车出海正迎来从"规模扩张"向"价值出海"的关键跨越。(时政来源:央视网)',
  '',
  '',
  '2026-07-12',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  5,
  '“习近平新时代中国特色社会主义思想与世界”国际研讨会举行    2026年7月9日，“习近平新时代中国特色社会主义思想与世界”国际研讨会在宁夏银川举行，研讨会的主题为“迈向现代化之路:中国减贫理论和实践的启示”。(时政来源:人民网)',
  '',
  '',
  '2026-07-12',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  1,
  'document',
  '单选',
  '记者2026年7月10日从中科曙光获悉，由公司研发的我国全国产十万卡AI超集群(   )正式发布并投入使用。A.“星云Nebula”B. “scaleX”C.“曙光8000(登峰)”',
  '[{"key":"D","text":"\"天河\""}]',
  'C',
  '',
  '原题',
  '2026-07-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  2,
  'document',
  '单选',
  '2026年7月9日，《数据库发展研究报告(2026年)》在2026可信数据库发展大会上对外发布。报告预计,到(   )年中国数据库市场总规模将达到979.74亿元市场年复合增长率为13.06% 。',
  '[{"key":"A","text":"2035"},{"key":"B","text":"2030"},{"key":"C","text":"2029"},{"key":"D","text":"2028"}]',
  'D',
  '',
  '原题',
  '2026-07-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  3,
  'document',
  '单选',
  '2026年7月9日,第三十二届中国兰州投资贸易洽谈会在甘肃省兰州市开幕。本届兰洽会以(   )为主题吸引海内外千余家企业齐聚黄河之滨 。',
  '[{"key":"A","text":"\"深化东西协作、赋能产业振兴\""},{"key":"B","text":"\"共建丝路新通道、共创陇原新未来\""},{"key":"C","text":"\"务实合作新机遇、开放发展新格局\""},{"key":"D","text":"\"绿色开放融通,携手共赢发展\""}]',
  'C',
  '',
  '原题',
  '2026-07-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  4,
  'document',
  '单选',
  '2026年上半年，中国汽车出口表现尤为亮眼。其中,(   )出口235.5万辆,同比增长1.2倍,成为拉动汽车出口增长的核心引。',
  '[{"key":"A","text":"商用货车"},{"key":"B","text":"传统燃油汽车"},{"key":"C","text":"新能源汽车"},{"key":"D","text":"插电混动客车"}]',
  'C',
  '',
  '原题',
  '2026-07-12'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  5,
  'document',
  '单选',
  '2026年7月9日，"习近平新时代中国特色社会主义思想与世界"国际研讨会在宁夏银川举行,研讨会的主题为(   )。        A."中国式现代化与全球可持续发展"B."新时代中国特色社会主义思想的国际价值"',
  '[{"key":"C","text":"\"迈向现代化之路:中国减贫理论和实践的启示\""},{"key":"D","text":"\"携手共建人类命运共同体:全球治理新路径\""}]',
  'C',
  '',
  '原题',
  '2026-07-12'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  1,
  '历史上的今天',
  '1913 年 二次革命爆发',
  '1913 年 二次革命爆发',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1913 年 二次革命爆发|1913 年 二次革命爆发',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  2,
  '历史上的今天',
  '1927 年 中共中央改组',
  '1927 年 中共中央改组',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1927 年 中共中央改组|1927 年 中共中央改组',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  3,
  '历史上的今天',
  '1949 年 中财委成立',
  '1949 年 中财委成立',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949 年 中财委成立|1949 年 中财委成立',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  4,
  '历史上的今天',
  '1986 年 劳动制度重大改革',
  '1986 年 劳动制度重大改革',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1986 年 劳动制度重大改革|1986 年 劳动制度重大改革',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  5,
  '历史上的今天',
  '2016 年 南海仲裁案',
  '2016 年 南海仲裁案',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|2016 年 南海仲裁案|2016 年 南海仲裁案',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  6,
  '常识',
  '饺子',
  '相传发明者为东汉医圣张仲景。饺子最初为药用，张仲景将羊肉、胡椒等祛寒药材包入面皮，制成“祛寒娇耳汤”为百姓治疗耳朵冻疮，后逐渐演变为日常主食与节令食品。',
  '常识',
  '饺子、馒头、馄饨、油条发明者',
  'common',
  '常识|饺子、馒头、馄饨、油条发明者|饺子|相传发明者为东汉医圣张仲景。饺子最初为药用，张仲景将羊肉、胡椒等祛寒药材包入面皮，制成“祛寒娇耳汤”为百姓治疗耳朵冻疮，后逐渐演变为日常主食与节令食品。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  7,
  '常识',
  '年糕',
  '相传起源于春秋时期吴国大夫伍子胥。伍子胥主持修建阖闾城时，命人以糯米压制成砖状作为应急储备粮。他遭陷害自尽后，越国伐吴围困都城，百姓挖开城墙取出糯米砖食用度过饥荒，这种食材后逐步发展为年糕。',
  '常识',
  '饺子、馒头、馄饨、油条发明者',
  'common',
  '常识|饺子、馒头、馄饨、油条发明者|年糕|相传起源于春秋时期吴国大夫伍子胥。伍子胥主持修建阖闾城时，命人以糯米压制成砖状作为应急储备粮。他遭陷害自尽后，越国伐吴围困都城，百姓挖开城墙取出糯米砖食用度过饥',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  8,
  '常识',
  '馒头与包子',
  '相传发明者为三国时期蜀汉丞相诸葛亮。诸葛亮南征班师渡泸水时，摒弃以人头祭江的陋俗，命厨子以面粉裹牛羊肉，捏成人头形状祭祀，称“蛮头”，后讹传为“馒头”。早期馒头均带馅，清代之后，无馅称“馒头”、有馅称“包子”的称谓才逐渐分化。',
  '常识',
  '饺子、馒头、馄饨、油条发明者',
  'common',
  '常识|饺子、馒头、馄饨、油条发明者|馒头与包子|相传发明者为三国时期蜀汉丞相诸葛亮。诸葛亮南征班师渡泸水时，摒弃以人头祭江的陋俗，命厨子以面粉裹牛羊肉，捏成人头形状祭祀，称“蛮头”，后讹传为“馒头”。早期馒头',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  9,
  '常识',
  '馄饨',
  '相传由春秋时期西施创制。吴王夫差吃腻山珍海味、食欲不振，西施以面皮包馅制成畚箕状点心进献。吴王询问名称时，西施暗讽君王昏聩混沌，随口答“混沌”，后演变为“馄饨”。它在不同地区有云吞、抄手、扁食等别称，苏州等地将其作为冬至节令美食。',
  '常识',
  '饺子、馒头、馄饨、油条发明者',
  'common',
  '常识|饺子、馒头、馄饨、油条发明者|馄饨|相传由春秋时期西施创制。吴王夫差吃腻山珍海味、食欲不振，西施以面皮包馅制成畚箕状点心进献。吴王询问名称时，西施暗讽君王昏聩混沌，随口答“混沌”，后演变为“馄饨”',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  10,
  '常识',
  '锅贴',
  '相传得名于宋太祖赵匡胤。北宋皇太后丧期，宋太祖茶饭不思，偶遇御厨将剩余饺子用铁锅煎制，品尝后觉得焦脆鲜香，随口赐名“锅贴”，这种煎制面食此后逐渐在民间流传。',
  '常识',
  '饺子、馒头、馄饨、油条发明者',
  'common',
  '常识|饺子、馒头、馄饨、油条发明者|锅贴|相传得名于宋太祖赵匡胤。北宋皇太后丧期，宋太祖茶饭不思，偶遇御厨将剩余饺子用铁锅煎制，品尝后觉得焦脆鲜香，随口赐名“锅贴”，这种煎制面食此后逐渐在民间流传。',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.12.docx'),
  11,
  '常识',
  '油条',
  '油条的起源与南宋秦桧夫妇的传说紧密相关。岳飞被秦桧等人构陷遇害后，临安百姓愤恨难平，用面团捏成秦桧夫妇的形象下入油锅炸制，称为“油炸桧”。后世制作逐步简化为两根面条相拧油炸，演变为如今的油条。',
  '常识',
  '饺子、馒头、馄饨、油条发明者',
  'common',
  '常识|饺子、馒头、馄饨、油条发明者|油条|油条的起源与南宋秦桧夫妇的传说紧密相关。岳飞被秦桧等人构陷遇害后，临安百姓愤恨难平，用面团捏成秦桧夫妇的形象下入油锅炸制，称为“油炸桧”。后世制作逐步简化为两根',
  'learning',
  ''
);

COMMIT;
