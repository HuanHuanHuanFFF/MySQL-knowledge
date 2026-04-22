---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__rollback_vs_recovery_boundary_minimal.md]]"
  - "Next: [[CARDS/tx__undo_log_role_for_mvcc.md]]"
  - "Next: [[CARDS/tx__insert_undo_vs_update_undo_split.md]]"
evidence: ""
---

# undo log 到底是什么？

**Point**: `undo log` 首先是 InnoDB 用来支撑事务回滚的一类日志：它记录的是“如果当前事务最终没 commit，怎么把这次改动撤掉”所需要的信息。

**Why**: 数据库需要 `undo log`，是因为事务要满足原子性：一组操作要么全部生效，要么全部不生效。没有它，事务执行到一半失败或主动 `ROLLBACK` 时，就没法把已经改过的数据恢复回去。

Notes:
- 这里的“回滚”默认指事务 `ROLLBACK`。
- 一旦事务已经 `COMMIT`，就不能再靠普通 `ROLLBACK` 撤销这个事务。
- 后面它还能给 MVCC 提供旧版本，这是第二层用途。

Example: 一次 `update` 改了某行后，如果事务回滚，数据库就要借 `undo log` 回到改之前的状态。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
