---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__rollback_vs_recovery_boundary_minimal.md]]"
  - "Next: [[CARDS/tx__undo_log_role_for_mvcc.md]]"
  - "Next: [[CARDS/tx__insert_undo_vs_update_undo_split.md]]"
  - "Expand: [[CARDS/tx__purge_and_undo_cleanup_minimal.md]]"
evidence: ""
---

# undo log 到底是什么？

**Point**: `undo log` 是 InnoDB 为读写事务记录的一组撤销信息：如果当前事务最终没有 `COMMIT`，可以用它把已经做过的修改撤回去；如果别的事务做一致性读需要旧版本，也可以从 `undo` 里把旧版本重建出来。

**Why**: 事务要满足原子性：一组修改要么全部生效，要么全部不生效。没有 `undo log`，事务执行到一半失败或主动 `ROLLBACK` 时，就没法把已改数据恢复回去。与此同时，MVCC 也需要旧版本来源，`undo log` 正好提供了这条线索。

Notes:
- 这里的“回滚”默认指事务 `ROLLBACK`。
- 一旦事务已经 `COMMIT`，就不能再靠普通 `ROLLBACK` 撤销这个事务。
- `undo log` 属于运行期的事务 / MVCC 支撑信息，不是像 `binlog` 那样面向长期归档或时间点恢复的日志。
- `undo log` 后续什么时候能被清理，要看它是不是还被回滚或一致性读需要；这部分另见 [[tx__purge_and_undo_cleanup_minimal]]。
- 后面它还能给 MVCC 提供旧版本，这是第二层用途。

Example: 一次 `update` 改了某行后，如果事务回滚，数据库就要借 `undo log` 回到改之前的状态；如果别的事务做快照读还需要旧值，也可能从 `undo log` 里把旧版本重建出来。


Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
