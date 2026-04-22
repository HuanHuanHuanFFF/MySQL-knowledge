# MySQL Vault Leader

## A. 当前进度判断
- 已成型主线：
  - [[STACKS/stack__tx_mvcc_lock]]：已经有 `STACK + REVIEW + 4 篇 QA`，是当前仓库里最完整的问题驱动主线。
  - [[STACKS/stack__index_core]]：`STACK + REVIEW` 已经可读，卡片覆盖也够，但还缺把“为什么这样设计 / 怎么排查”串起来的 QA 入口。
- 基本可读但仍偏薄：
  - [[STACKS/stack__select_execution_flow]]：主线能读，但仍偏“阶段目录”，[[REVIEW/review__stack_select_execution_flow]] 也还是旧结构，复习与追问承载偏弱。
  - [[STACKS/stack__sql_basics]]：覆盖面够大，但把 CRUD、DDL、索引入门放在同一条线里，边界已经开始发散。
  - [[STACKS/stack__schema_basics]]、[[STACKS/stack__join_core]]、[[STACKS/stack__group_agg]]：这些基础主线当前保持 `CARD + STACK + REVIEW` 即可，不把“问题驱动入口”当优先目标。
- 仓库级断层：
  - `sources` 入口已补齐：[[sources/00_SOURCES_INDEX]]、[[sources/mysql_manual_links]]、[[sources/javaguide_map]]、[[sources/reading_queue]] 现在可以直接承担选源导航。
  - 目前只有事务主线在 `STACK` 中直接展开了 `QA/`；后续如果继续做问题驱动，优先放在事务、索引、执行流程这类机制主题，而不是基础语法线。
- 已适合继续深入的主题：
  - [[STACKS/stack__tx_mvcc_lock]] 已经可以继续往 `Read View`、一致性读与当前读、`undo log`、`locking reads` 的衔接深入。
  - 在继续开新深线前，优先沿新的 `sources` 导航挑 1 条机制主线推进，不再重复补基础线的“问题驱动化”。

## B. 下一阶段优先级
1. 目标：沿 [[sources/reading_queue]] 选择 1 条机制主线继续推进。
   为什么现在做：sources 入口已经补齐，下一步不该再回到“先补导航”，而是利用新入口减少选源成本。
   预期产物：一条明确的后续主题选择，优先候选是事务、索引或执行流程。

2. 目标：给 [[STACKS/stack__index_core]] 增加 2~3 个高价值 QA 入口。
   为什么现在做：索引主线已经有完整卡片和高质量 review，最缺的是“为什么索引明明建了却没走 / 为什么二级索引会回表 / 怎么稳妥排查慢 SQL”这类问题驱动入口。
   预期产物：新增 2~3 个 `QA/index__*.md`，并更新 [[STACKS/stack__index_core]] 与 [[QA/00_QA_INDEX]]。

3. 目标：重修 [[STACKS/stack__select_execution_flow]] 的问题驱动入口，并修复 [[REVIEW/review__stack_select_execution_flow]]。
   为什么现在做：执行流程主题天然适合按“EXPLAIN 为什么不等于执行 / 优化器和执行器怎么分工 / 一条 SELECT 怎么排查”来读；当前 stack 与 review 还没把这层价值做出来。
   预期产物：新增 1~2 个 `QA/execflow__*.md`，更新 stack 的 `Q&A / Start Here`，并把 review 修到当前仓库的标准格式。

4. 目标：在现有入口补齐后，再决定事务线下一层是补 `QA + EXP` 还是新开更深 stack。
   为什么现在做：事务主线已经成熟到可以下钻，但不该在现有入口层仍有断点时继续扩散主题。
   预期产物：一个更窄的推进包，优先候选是 `Read View 可见性判断`、`快照读 / 当前读的执行差异`、`locking reads` 实验。

5. 目标：收紧 [[STACKS/stack__sql_basics]] 的边界。
   为什么现在做：当前它已经开始同时承载语法、DDL、索引入门，继续往里堆会变成“大杂烩主线”。
   预期产物：一次轻量重排或拆分建议，明确哪些内容应回到 `schema` / `index` 主线。

## C. 下游任务提示词

### Task 1 · 补 sources 导航
```md
Use skill
- `$mysql-distill`

Read first
- `prompts/mysql_distill_doctrine.prompt.md`
- `prompts/build_sources_nav.prompt.md`

Use templates
- 无

Sources
- 只允许本地：
  - `sources/refman-*`
  - `sources/JavaGuide-mysql/`
  - `sources/sql-question/`
  - 其他仓库内 MySQL sources

目标
- 把 `sources/00_SOURCES_INDEX.md` 从 TODO 改成可用入口，并按 `build_sources_nav` 的思路补出最小 sources 导航集合。

范围
- 盘点当前 `sources/` 里真实存在的资料。
- 生成或更新：
  - `sources/00_SOURCES_INDEX.md`
  - `sources/mysql_manual_links.md`
  - `sources/javaguide_map.md`
  - `sources/reading_queue.md`
- 每个条目只写“这份资料解决什么问题 / 什么时候看”，不要搬运原文。

限制
- 不联网。
- 不新增仓库外来源。
- 不编造章节内容；如果本地资料不足，就写 `TODO`。
- 只做导航与阅读顺序，不蒸馏成 CARD。

输出要求
- 使用多文件输出格式：
  - `FILE: <path>`
- 不输出解释文字。
```

### Task 2 · 给 index 主线补 QA 入口
```md
Use skill
- `$mysql-distill`

Read first
- `prompts/mysql_distill_doctrine.prompt.md`
- `prompts/rebuild_problem_driven_stack.prompt.md`

Use templates
- `QA/_template.md`
- `STACKS/_template.md`

Sources
- 只允许本地：
  - `sources/refman-*`
  - `sources/JavaGuide-mysql/`
  - 其他仓库内 MySQL sources

目标
- 给 `STACKS/stack__index_core.md` 补上“问题驱动入口”，优先回答索引设计、回表与慢 SQL 排查这三类高频追问。

范围
- 新增 2~3 个 QA 页，优先候选：
  - `QA/index__why_index_exists_but_not_used.md`
  - `QA/index__when_secondary_index_needs_back_to_table.md`
  - `QA/index__how_to_diagnose_slow_sql_index_issue.md`
- 更新 `STACKS/stack__index_core.md`：
  - 增加 `Q&A / Start Here`
  - 在 `Read (embed)` 前直接展开新 QA
- 更新 `QA/00_QA_INDEX.md`，把新入口挂上去。

限制
- 不新开更深的索引 stack。
- 不大规模重写现有 CARD；最多做最小必要的标题或 `Point / Why` 调整。
- QA 要直接串已有 CARD，不要写成散文。
- 不要把 review 当主线入口。

输出要求
- 直接修改仓库文件。
- 最后只输出简短变更摘要：
  1. 修改了哪些文件
  2. 新增了哪些 QA 页
  3. `stack__index_core` 是否已经具备问题驱动入口
```

### Task 3 · 修 execution flow 的 QA 与 review
```md
Use skill
- `$mysql-distill`

Read first
- `prompts/mysql_distill_doctrine.prompt.md`
- `prompts/rebuild_problem_driven_stack.prompt.md`
- `prompts/make_review_page.prompt.md.md`

Use templates
- `QA/_template.md`
- `STACKS/_template.md`

Sources
- 只允许本地：
  - `sources/refman-*`
  - `sources/JavaGuide-mysql/`
  - `sources/xiaolincoding__mysql__select_execution_flow.html`
  - 其他仓库内 MySQL sources

目标
- 把 `STACKS/stack__select_execution_flow.md` 从“阶段串联”提升到“问题驱动入口 + 连续阅读”，并把 `REVIEW/review__stack_select_execution_flow.md` 修到当前仓库标准格式。

范围
- 新增 1~2 个 QA 页，优先候选：
  - `QA/execflow__why_explain_not_equal_execution.md`
  - `QA/execflow__how_to_trace_one_select_through_mysql.md`
- 更新 `STACKS/stack__select_execution_flow.md`：
  - 增加 `Q&A / Start Here`
  - 保持正文 CARD 仍在 `Read (embed)` 中连续阅读
- 重写或修复 `REVIEW/review__stack_select_execution_flow.md`：
  - 使用标准 `<details>` 结构
  - 每题只绑定 1 张 CARD
  - `See: [[CARDS/...]]` 放在 `</details>` 之外
- 更新 `QA/00_QA_INDEX.md` 挂上新的 execution flow 入口。

限制
- 不新开日志、锁、优化器等独立深线。
- 不联网。
- 不把 REVIEW 写成长文解释页。
- 不重复嵌入同一张 CARD 多次。

输出要求
- 直接修改仓库文件。
- 最后只输出简短变更摘要：
  1. 修改了哪些文件
  2. 新增了哪些 QA 页
  3. review 是否已经符合仓库格式
```
