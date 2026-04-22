# MySQL Vault Home

## 现在先看什么
- 当前接管页：[[00_LEADER]]
- SQL 基础主线：[[STACKS/stack__sql_basics]] + [[REVIEW/review__stack_sql_basics]]
- Schema / Constraints：[[STACKS/stack__schema_basics]] + [[REVIEW/review__stack_schema_basics]]
- JOIN 与聚合：[[STACKS/stack__join_core]] + [[REVIEW/review__stack_join_core]]，[[STACKS/stack__group_agg]] + [[REVIEW/review__stack_group_agg]]
- SELECT 执行流程：[[STACKS/stack__select_execution_flow]] + [[REVIEW/review__stack_select_execution_flow]]
- 索引主线：[[STACKS/stack__index_core]] + [[REVIEW/review__stack_index_core]]
- 事务 / MVCC / Locks：[[STACKS/stack__tx_mvcc_lock]] + [[REVIEW/review__stack_tx_mvcc_lock]]
- 全局目录：[[00_INDEX]]

## Today / Next Actions
- [x] 已补 [[sources/00_SOURCES_INDEX]]，并补出 [[sources/mysql_manual_links]]、[[sources/javaguide_map]]、[[sources/reading_queue]]
- [ ] 给 [[STACKS/stack__index_core]] 增加 2~3 个 QA 入口，补齐“为什么这样设计 / 怎么排查”
- [ ] 重修 [[STACKS/stack__select_execution_flow]] 的问题驱动入口，并修复 [[REVIEW/review__stack_select_execution_flow]]
- [ ] 在现有主线补齐后，再决定事务线往 Read View / 当前读 / 锁实验哪一层继续深入
- [ ] 需要具体任务 prompt 时，先看 [[00_LEADER]]
- [ ] 如需实验或模板，从 [[EXP/00_EXP_INDEX]] / [[SNIPPETS/00_SNIPPETS_INDEX]] 继续展开

## 核心入口
- Leader：[[00_LEADER]]
- Prompts：[[prompts/00_README]]
- Sources：[[sources/00_SOURCES_INDEX]]
- Q&A：[[QA/00_QA_INDEX]]
- Reviews：[[REVIEW/review__stack_sql_basics]], [[REVIEW/review__stack_schema_basics]], [[REVIEW/review__stack_join_core]], [[REVIEW/review__stack_group_agg]], [[REVIEW/review__stack_select_execution_flow]], [[REVIEW/review__stack_index_core]], [[REVIEW/review__stack_tx_mvcc_lock]]
- Core Stacks：[[STACKS/stack__sql_basics]], [[STACKS/stack__schema_basics]], [[STACKS/stack__join_core]], [[STACKS/stack__group_agg]], [[STACKS/stack__select_execution_flow]], [[STACKS/stack__index_core]], [[STACKS/stack__tx_mvcc_lock]]

## 最小工作流
1. 选资料：从 [[sources/00_SOURCES_INDEX]] 找到要读的本地来源。
2. 产出 CARD：参照 [[CARDS/_template]]，用 [[prompts/00_README]] 里的工作流蒸馏短卡。
3. 入 STACK：把卡片挂到对应的 `Cards` 和 `Read`，保持一页可读。
4. 可选补充：需要实验或 SQL 模板时，用 [[EXP/00_EXP_INDEX]] / [[SNIPPETS/00_SNIPPETS_INDEX]]。
5. 生成 REVIEW：为成型主线补对应复习页，例如 [[REVIEW/review__stack_index_core]]，先复习再扩展。
