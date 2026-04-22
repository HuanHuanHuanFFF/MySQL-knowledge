# MySQL Vault Leader

## A. 当前进度判断
- 已成型主线：
  - [[STACKS/stack__tx_mvcc_lock]]：已经有 `STACK + REVIEW + 4 篇 QA`，继续承担“概念 / 现象 / 隔离级别 / 设计取舍”主线。
  - [[STACKS/stack__tx_mvcc_impl]]：已经有 `STACK + REVIEW`，并把事务回滚、undo、版本链、Read View、可见性判断、RC / RR 分叉拆成了独立实现链。
- 基本可读但仍偏薄：
  - [[STACKS/stack__index_core]]：`STACK + REVIEW` 已经可读，但还缺“为什么这样设计 / 怎么排查”的 QA 入口。
  - [[STACKS/stack__select_execution_flow]]：主线能读，但仍偏“阶段目录”，[[REVIEW/review__stack_select_execution_flow]] 也还是旧结构，复习与追问承载偏弱。
  - [[STACKS/stack__sql_basics]]：覆盖面够大，但把 CRUD、DDL、索引入门放在同一条线里，边界开始发散。
  - [[STACKS/stack__schema_basics]]、[[STACKS/stack__join_core]]、[[STACKS/stack__group_agg]]：这些基础主线当前保持 `CARD + STACK + REVIEW` 即可，不把“问题驱动入口”当优先目标。
- 仓库级状态：
  - `sources` 入口已补齐：[[sources/00_SOURCES_INDEX]]、[[sources/mysql_manual_links]]、[[sources/javaguide_map]]、[[sources/reading_queue]] 现在可以直接承担选源导航。
  - 事务线现在已经分成两层：[[STACKS/stack__tx_mvcc_lock]] 管概念与取舍，[[STACKS/stack__tx_mvcc_impl]] 管实现链；当前更明显的仓库缺口已经转到 `index` 和 `execution flow`。
- 已适合继续深入的主题：
  - 事务线如果继续下钻，最自然的下一层是“当前读 / Next-Key Lock 与 MVCC 实现链的边界”，或者 `purge / 历史版本回收`。
  - 但从仓库整体平衡看，眼下更该优先补的是 `index` 的 QA 入口和 `execution flow` 的 QA / review。

## B. 下一阶段优先级
1. 目标：给 [[STACKS/stack__index_core]] 增加 2~3 个高价值 QA 入口。
   为什么现在做：索引主线已经有完整卡片和高质量 review，最缺的是“为什么索引明明建了却没走 / 为什么二级索引会回表 / 怎么稳妥排查慢 SQL”这类问题驱动入口。
   预期产物：新增 2~3 个 `QA/index__*.md`，并更新 [[STACKS/stack__index_core]] 与 [[QA/00_QA_INDEX]]。

2. 目标：重修 [[STACKS/stack__select_execution_flow]] 的问题驱动入口，并修复 [[REVIEW/review__stack_select_execution_flow]]。
   为什么现在做：执行流程主题天然适合按“EXPLAIN 为什么不等于执行 / 优化器和执行器怎么分工 / 一条 SELECT 怎么排查”来读；当前 stack 与 review 还没把这层价值做出来。
   预期产物：新增 1~2 个 `QA/execflow__*.md`，更新 stack 的 `Q&A / Start Here`，并把 review 修到当前仓库的标准格式。

3. 目标：沿事务实现线继续下钻“当前读 / Next-Key Lock 与 MVCC 的边界”。
   为什么现在做：`tx_mvcc_lock + tx_mvcc_impl` 的最小闭环已经成立，下一层最自然的追问就是“为什么当前读不走这条链，而进入锁语义”。
   预期产物：一条更窄的事务深线，优先候选是新 stack，或 `STACK + CARD` 组合。

4. 目标：收紧 [[STACKS/stack__sql_basics]] 的边界。
   为什么现在做：当前它已经开始同时承载语法、DDL、索引入门，继续往里堆会变成“大杂烩主线”。
   预期产物：一次轻量重排或拆分建议，明确哪些内容应回到 `schema` / `index` 主线。

## C. 下游任务提示词

### Task 1 · 给 index 主线补 QA 入口
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
- 不联网。
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

### Task 2 · 修 execution flow 的 QA 与 review
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

### Task 3 · 继续下钻事务实现线边界
```md
Use skill
- `$mysql-distill`

Read first
- `prompts/mysql_distill_doctrine.prompt.md`
- `prompts/rebuild_problem_driven_stack.prompt.md`
- `STACKS/stack__tx_mvcc_lock.md`
- `STACKS/stack__tx_mvcc_impl.md`

Use templates
- `CARDS/_template.md`
- `STACKS/_template.md`

Sources
- 只允许本地：
  - `sources/refman-*`
  - `sources/JavaGuide-mysql/`
  - 其他仓库内 MySQL sources

目标
- 沿事务实现线继续下钻“当前读 / Next-Key Lock 与 MVCC 的边界”，不要回头重复事务总览。

范围
- 优先做一个更窄的新 stack，或 `STACK + CARD` 组合。
- 问题中心应围绕：
  - 为什么当前读不走 `tx_mvcc_impl` 这条一致性读实现链
  - 为什么一进入当前读就开始进入锁语义
  - `Next-Key Lock` 在这里解决什么边界问题
- 不要扩成 redo / binlog / 两阶段提交总论。

限制
- 不联网。
- 不要大规模重写 `stack__tx_mvcc_lock` 或 `stack__tx_mvcc_impl`
- 不要把事务现象、隔离级别总览重新讲一遍

输出要求
- 直接修改仓库文件。
- 最后只输出简短变更摘要：
  1. 修改了哪些文件
  2. 新增了哪些 stack / CARD
  3. 当前读与 MVCC 的边界是否已经讲清
```
