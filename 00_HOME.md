# MySQL Vault Home

## 现在先看什么
- 总目录：[[00_INDEX]]
- 当前进度：[[00_LEADER]]
- Prompt 入口：[[prompts/00_README]]
- Sources 入口：[[sources/00_SOURCES_INDEX]]
- Q&A 入口：[[QA/00_QA_INDEX]]

## Next
- 先补 [[STACKS/stack__btree_deep_dive]] 的 review。
- 再考虑是否开 [[STACKS/stack__index_core]] 之后的 index advanced。
- 事务基础已闭环；如继续事务线，优先收紧“当前读 / 锁边界”，不要散开到日志总论。
- 做任何新增蒸馏前，先从 [[00_INDEX]] 确认已有入口和真实文件。

## 当前核心 Stacks
- 基础线：[[STACKS/stack__sql_basics]], [[STACKS/stack__schema_basics]], [[STACKS/stack__join_core]], [[STACKS/stack__group_agg]]
- 执行流程线：[[STACKS/stack__select_execution_flow]]
- 索引线：[[STACKS/stack__index_core]], [[STACKS/stack__btree_deep_dive]]
- 事务线：[[STACKS/stack__transaction_basics]], [[STACKS/stack__tx_mvcc_lock]], [[STACKS/stack__tx_mvcc_impl]]

## 快速入口
- Reviews：[[REVIEW/review__stack_index_core]], [[REVIEW/review__stack_transaction_basics]], [[REVIEW/review__stack_tx_mvcc_lock]], [[REVIEW/review__stack_tx_mvcc_impl]]
- Index Q&A：[[QA/index__why_index_exists_but_not_used]], [[QA/index__when_secondary_index_needs_back_to_table]], [[QA/index__how_to_diagnose_slow_sql_index_issue]]
- Tx Q&A：[[QA/tx__why_rc_and_rr_feel_different]], [[QA/tx__how_to_tell_snapshot_vs_current_read]]
- B+Tree assets：[[assets/mysql/btree/b_tree.png]], [[assets/mysql/btree/bplus_tree.png]]
- Experiments / snippets：[[EXP/00_EXP_INDEX]], [[SNIPPETS/00_SNIPPETS_INDEX]]

## 最小工作流
1. 从 [[sources/00_SOURCES_INDEX]] 或 [[00_INDEX]] 选本地材料。
2. 用 [[prompts/mysql_distill_doctrine.prompt]] 确认写作边界。
3. 先补 CARD / STACK，再按需要补 QA 或 REVIEW。
4. 完成主线后更新 [[00_HOME]], [[00_INDEX]], [[00_LEADER]]。
