# MySQL Vault Leader

## A. 当前蒸馏进度
- 基础线已成型：[[STACKS/stack__sql_basics]], [[STACKS/stack__schema_basics]], [[STACKS/stack__join_core]], [[STACKS/stack__group_agg]] 都已有对应 review。
- 执行流程线已成型：[[STACKS/stack__select_execution_flow]] 已有 [[REVIEW/review__stack_select_execution_flow]]。
- 索引线已进入第二层：[[STACKS/stack__index_core]] 已有 [[REVIEW/review__stack_index_core]] 和 3 个 QA；[[STACKS/stack__btree_deep_dive]] 是最新完成的 B+Tree 深入主线，图片资源在 `assets/mysql/btree/`。
- 事务基础已成型：[[STACKS/stack__transaction_basics]] 已有 [[REVIEW/review__stack_transaction_basics]]；后续事务线已分层，[[STACKS/stack__tx_mvcc_lock]] 管概念 / 取舍，[[STACKS/stack__tx_mvcc_impl]] 管实现链，两者都有 review。
- 当前入口页职责：[[00_HOME]] 做第一眼导航，[[00_INDEX]] 做全量目录，本页只追踪蒸馏进度和下一步顺序。

## B. 下一步推进顺序
1. 优先补 [[STACKS/stack__btree_deep_dive]] 的 review，让最新 B+Tree 深入主线闭环。
2. 再判断是否开 `index advanced`：只承接 [[STACKS/stack__index_core]] 之后的进阶问题，不回灌基础线。
3. 如推进事务线，优先收紧“当前读 / 锁边界”，保持和 [[STACKS/stack__tx_mvcc_impl]] 的实现链分工清楚。
4. 暂时不要开散：执行流程、日志、优化器、事务实现细节都先服从当前三条主线的闭环。
