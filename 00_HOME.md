# MySQL Vault Home

## Today / Next Actions
- [ ] 执行流程栈复盘：[[REVIEW/review__stack_select_execution_flow]]
- [ ] 扩充 SQL 基础卡片或补充 JOIN/聚合栈
- [ ] 维护 SOURCES 导航并标注要点：[[SOURCES/00_SOURCES_INDEX]]
- [ ] 有新资料先跑 distill_cards，再编排入对应 STACK
- [ ] 如需实验/模板，复制 [[EXP/_template]] / [[SNIPPETS/_template]]

## 核心入口
- PROMPTS 使用指南：[[PROMPTS/00_README]]
- 主要资料目录：[[SOURCES/00_SOURCES_INDEX]]
- 当前重点 STACKS：[[STACKS/stack__select_execution_flow]], [[STACKS/stack__sql_basics]], [[STACKS/stack__schema_basics]], [[STACKS/stack__join_core]], [[STACKS/stack__group_agg]]
- 最新 REVIEW：[[REVIEW/review__stack_select_execution_flow]]

## 最小工作流
1. 选资料：定位 SOURCES 中的文件或章节。
2. 产出 CARD：用 distill_from_local_sources prompt，按模板写到 CARDS/。
3. 入 STACK：把卡片挂到对应 STACK 的 Cards 与 Read；必要时新增 STACK。
4. （可选）实验/模板：如需验证或模板，复制 [[EXP/_template]] / [[SNIPPETS/_template]]。
5. 生成 REVIEW：用 make_review_page prompt 生成 REVIEW 页面，便于回顾。
