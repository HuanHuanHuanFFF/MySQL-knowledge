# QA Index

用途：放“问题驱动”的引导页，用复合问题把多张 CARD 串起来，帮助进入一条主线，而不是直接背知识点。

当前入口：
- 模板：[[QA/_template]]
- 首页：[[00_HOME]]
- 总目录：[[00_INDEX]]

当前已建：
- [[QA/tx__why_plain_select_should_not_lock]] — 为什么普通 SELECT 不想总加锁
- [[QA/tx__how_to_tell_snapshot_vs_current_read]] — 怎么区分快照读和当前读
- [[QA/tx__why_rc_and_rr_feel_different]] — 为什么 RC 两次 SELECT 会变而 RR 更稳定
- [[QA/tx__why_not_default_rc_or_serializable]] — 为什么默认不是 RC，也不是 Serializable
- [[QA/index__why_index_exists_but_not_used]] — 为什么明明建了索引却没走
- [[QA/index__when_secondary_index_needs_back_to_table]] — 二级索引什么时候需要回表
- [[QA/index__how_to_diagnose_slow_sql_index_issue]] — 怎么排查慢 SQL 是不是索引问题
