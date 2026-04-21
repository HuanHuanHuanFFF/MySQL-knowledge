# MySQL Vault Home

## 现在先看什么
- SQL 基础主线：[[STACKS/stack__sql_basics]] + [[REVIEW/review__stack_sql_basics]]
- Schema / Constraints：[[STACKS/stack__schema_basics]] + [[REVIEW/review__stack_schema_basics]]
- JOIN 与聚合：[[STACKS/stack__join_core]] + [[REVIEW/review__stack_join_core]]，[[STACKS/stack__group_agg]] + [[REVIEW/review__stack_group_agg]]
- SELECT 执行流程：[[STACKS/stack__select_execution_flow]] + [[REVIEW/review__stack_select_execution_flow]]
- 索引主线：[[STACKS/stack__index_core]] + [[REVIEW/review__stack_index_core]]
- 事务 / MVCC / Locks：[[STACKS/stack__tx_mvcc_lock]] + [[REVIEW/review__stack_tx_mvcc_lock]]
- 全局目录：[[00_INDEX]]

## Today / Next Actions
- [ ] 先刷一轮 SQL 基础与执行流程复习页
- [ ] 补一轮 Schema、JOIN、Group By 的 review，打通基础查询主线
- [ ] 进入索引主线，完成 [[REVIEW/review__stack_index_core]]
- [ ] 继续把事务主线从“MVCC 前置概念”扩到锁语义与实验
- [ ] 新资料先落到 [[sources/00_SOURCES_INDEX]]，再蒸馏进对应 STACK
- [ ] 如需实验或模板，从 [[EXP/00_EXP_INDEX]] / [[SNIPPETS/00_SNIPPETS_INDEX]] 继续展开

## 核心入口
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
