-- Auto-generated import SQL
-- kind: docx-backfill
-- filename: 每日时政7.23.docx
-- doc_date: 2026-07-23
-- generated_at: 2026-08-21T08:42:54.223Z

BEGIN;

INSERT INTO source_documents
  (filename, file_path, doc_date, file_hash, status, parse_summary, ai_validation, error_message, updated_at)
VALUES (
  '每日时政7.23.docx',
  '/Users/tank/Desktop/每日时政/每日时政7.23.docx',
  '2026-07-23',
  '40c47510952a45fa65330838347965176d2e838276871737fe087df876813031',
  'imported',
  '{"paragraphs":57,"articles":5,"questions":5,"knowledge":6,"warnings":[]}',
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

DELETE FROM affairs_articles WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx');
DELETE FROM practice_questions WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx');
DELETE FROM knowledge_items WHERE document_id = (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx');

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  1,
  '我国已成为全球160多个国家和地区的主要贸易伙伴',
  '2026年7月22日，国务院新闻办举行新闻发布会，介绍贯彻落实“十五五”规划，加快推进海关现代化，服务贸易强国建设有关情况。
目前，我国已成为全球160多个国家和地区的主要贸易伙伴，进口商品来源更广、品类更多、结构更优。
“十五五”时期，将在扩大进口方面，聚焦“三个优”发力，更好满足人民群众的消费需求：一是优准入；二是优监管；三是优服务。（时政来源：央视网）',
  '央视网',
  '2026-07-23',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  2,
  '引力一号火箭首次远海发射任务成功',
  '2026年7月22日，引力一号遥四运载火箭在上海东部海域点火升空，将搭载的9颗卫星送入预定轨道，飞行试验任务取得圆满成功。
据悉，此次任务是引力一号火箭首次执行远海发射，也是我国首次在长三角东海海域开展民营商业火箭海上发射任务。（时政来源：新华网）',
  '新华网',
  '2026-07-23',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  3,
  '国家级零碳工厂、零碳算力设施建设工作启动',
  '记者2026年7月22日获悉，工业和信息化部日前印发通知，组织开展国家级零碳工厂（含零碳算力设施）建设工作。
零碳工厂建设是指通过技术创新、结构调整和管理优化等减排措施，实现边界内二氧化碳排放的持续降低、逐步趋向于近零的过程。
通知明确建设过程，零碳工厂建设工作“重技术、重建设、重实效”，而非一次性评价认定。（时政来源：新华网）',
  '新华网',
  '2026-07-23',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  4,
  '我国杂交水稻育种科研取得重要进展',
  '中国水稻研究所研究员王克剑团队近日在杂交水稻育种领域取得重要进展——成功研发出克隆效率稳定超过99%、结实完全正常的一系法杂交水稻，团队将其命名为“一系1号”。这项原创研究成果于2026年7月21日刊发于国际学术期刊《Vita》。（时政来源：新华网）',
  '新华网',
  '2026-07-23',
  '时政热点'
);

INSERT INTO affairs_articles (document_id, article_order, title, body, source, doc_date, tags)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  5,
  '四部门印发规划推进“十五五”林草保护利用',
  '记者2026年7月22日获悉，国家林草局等四部门近日联合印发《林业草原保护利用“十五五”规划》。规划提出，到2030年，“三北”工程三大标志性战役取得决定性胜利，完成自然保护地整合优化，森林、草原、湿地、荒漠生态系统质量和服务功能不断增强，林草多元供给和消费场景更加丰富，林草产业总产值迈上新台阶。（时政来源：新华网）',
  '新华网',
  '2026-07-23',
  '时政热点'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  1,
  'document',
  '单选',
  '2026年7月22日，国务院新闻办举行新闻发布会，介绍贯彻落实“十五五”规划，加快推进海关现代化，服务贸易强国建设有关情况。目前，我国已成为全球（  ）多个国家和地区的主要贸易伙伴，进口商品来源更广、品类更多、结构更优。',
  '[{"key":"A","text":"210"},{"key":"B","text":"200"},{"key":"C","text":"180"},{"key":"D","text":"160"}]',
  'D',
  '',
  '原题',
  '2026-07-23'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  2,
  'document',
  '单选',
  '2026年7月22日，引力一号遥四运载火箭在（  ）东部海域点火升空，将搭载的9颗卫星送入预定轨道，飞行试验任务取得圆满成功。此次任务是引力一号火箭首次执行远海发射，也是我国首次在（  ）海域开展民营商业火箭海上发射任务。',
  '[{"key":"A","text":"山东；黄海"},{"key":"B","text":"上海；长三角东海"},{"key":"C","text":"广东；珠三角南海"},{"key":"D","text":"河北；渤海"}]',
  'B',
  '',
  '原题',
  '2026-07-23'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  3,
  'document',
  '单选',
  '记者2026年7月22日获悉，工业和信息化部日前印发通知，组织开展国家级零碳工厂（含零碳算力设施）建设工作。零碳工厂建设是指通过技术创新、结构调整和管理优化等减排措施，实现边界内（  ）的过程。',
  '[{"key":"A","text":"二氧化碳排放的持续降低、逐步趋向于近零"},{"key":"B","text":"温室气体排放量完全归零，不再产生任何排放"},{"key":"C","text":"二氧化碳排放强度较上一年度下降一定比例"},{"key":"D","text":"碳排放总量保持稳定，与经济增长脱钩"}]',
  'A',
  '',
  '原题',
  '2026-07-23'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  4,
  'document',
  '单选',
  '中国水稻研究所研究员王克剑团队近日在杂交水稻育种领域取得重要进展——成功研发出克隆效率稳定超过99%、结实完全正常的一系法杂交水稻，团队将其命名为（  ）。这项原创研究成果于2026年7月21日刊发于国际学术期刊《Vita》。',
  '[{"key":"A","text":"华胥稻"},{"key":"B","text":"春优84"},{"key":"C","text":"Fix8号"},{"key":"D","text":"“一系1号”"}]',
  'D',
  '',
  '原题',
  '2026-07-23'
);

INSERT INTO practice_questions
  (document_id, question_order, source_type, question_type, prompt, options_json, answer, explanation, tags, doc_date)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  5,
  'document',
  '单选',
  '《林业草原保护利用“十五五”规划》提出，到2030年，“三北”工程三大标志性战役取得（  ）。',
  '[{"key":"A","text":"阶段性成效"},{"key":"B","text":"关键性进展"},{"key":"C","text":"根本性好转"},{"key":"D","text":"决定性胜利"}]',
  'D',
  '',
  '原题',
  '2026-07-23'
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  1,
  '历史上的今天',
  '1900年第一次泛非会议召开',
  '1900年第一次泛非会议召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1900年第一次泛非会议召开|1900年第一次泛非会议召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  2,
  '历史上的今天',
  '1920年俄波华沙战役打响',
  '1920年俄波华沙战役打响',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1920年俄波华沙战役打响|1920年俄波华沙战役打响',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  3,
  '历史上的今天',
  '1921年中国共产党第一次代表大会召开',
  '1921年中国共产党第一次代表大会召开',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1921年中国共产党第一次代表大会召开|1921年中国共产党第一次代表大会召开',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  4,
  '历史上的今天',
  '1930年共产国际就中国革命问题作决议',
  '1930年共产国际就中国革命问题作决议',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1930年共产国际就中国革命问题作决议|1930年共产国际就中国革命问题作决议',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  5,
  '历史上的今天',
  '1949年全国工会工作会议在北平举行',
  '1949年全国工会工作会议在北平举行',
  '历史',
  '历史上的今天',
  'history',
  '历史上的今天|历史上的今天|1949年全国工会工作会议在北平举行|1949年全国工会工作会议在北平举行',
  'learning',
  ''
);

INSERT INTO knowledge_items
  (document_id, item_order, category, title, body, tags, topic, kind, fingerprint, memory_status, last_reviewed_at)
VALUES (
  (SELECT id FROM source_documents WHERE filename = '每日时政7.23.docx'),
  6,
  '常识',
  '束脩',
  '束脩（shù xiū），最初是古代民间上下级、亲友之间相互馈赠的礼物，后专指学生拜师时敬献的见面礼，用以表达对师长的敬意，这一礼仪传统早在孔子时期就已形成。   《论语・述而》中记载孔子 “自行束脩以上，吾未尝无诲焉”，彼时的束脩并非昂贵的酬劳，而是一份象征性的拜师凭证。学子奉上薄礼以明尊师向学之心，师长接纳礼物便确立师生名分，这一礼节既体现了对师道的尊崇，也暗含着孔子有教无类的教育理念 —— 无论出身贵贱，只要诚心求学、行过拜师之礼，便可得到教诲。   “束脩” 本意指一束肉干，也叫肉脯，形制与腊肉相近。古人素来尊师重教，孩童入学拜师时，常会送上束脩作为见面礼，束脩也因此逐渐成为学费的代称。    随着礼教制度的发展，束脩之礼逐渐从民间私俗走向官方规制。汉代私学兴盛，弟子奉束脩事师已成学界常态；唐代更是将束脩礼纳入官学体系，明确规定了国子监各学学生的束脩标准，按学科等级分别奉上数量不等的绢帛、酒肉与干肉，让尊师之礼有了统一的制度范式。    随着时代发展，敬师礼的实物不再局限于肉干，比如唐代就有人以酒肉、丝绸等物品替代束脩。尽管礼品形式不断更迭，“束脩” 这一名称却始终沿用，词义也进一步引申，后世将付给教师的学费、酬金乃至薪俸，都可统称为 “束脩”。    发展到后世，“束脩” 的适用范围不再局限于教育行业，各类手工技艺、戏曲曲艺等行当的拜师酬金也常以此相称。时至当代，实物束脩早已退出日常教育场景，但它作为中国古代尊师文化的标志性符号，始终承载着国人对师道尊严的推崇，也见证着中华礼仪与教育精神的千年传承。',
  '常识',
  '束脩',
  'common',
  '常识|束脩|束脩|束脩（shù xiū），最初是古代民间上下级、亲友之间相互馈赠的礼物，后专指学生拜师时敬献的见面礼，用以表达对师长的敬意，这一礼仪传统早在孔子时期就已形成。',
  'learning',
  ''
);

COMMIT;
