---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related: []
evidence: ""
---

# undo log 后续是怎么被清理的？

**Point**: `undo log` 不是事务一结束就一刀切删掉；InnoDB 会按“它是不是还会被回滚或一致性读需要”来决定能不能清。`insert undo` 通常在事务提交后就可丢弃，而 `update undo` 往往要等到没有事务的快照还可能用它构造旧版本时，才能由 `purge` 系统清掉。

**Why**: 如果 `undo` 太早清掉，事务回滚或 MVCC 读旧版本就会失去依据；如果一直不清，又会让相关 `undo` 记录持续堆积。对这条实现线来说，重点不是背后台线程细节，而是先知道“谁能早清、谁要晚清”。

Notes:
- `insert undo`：主要在事务回滚时需要，所以提交后通常可以更早清理。
- `update undo`：既用于回滚，也用于 consistent read；提交后不会立刻删除，而是进入 `history list`，等待 `purge` 后续清理。
- `delete` 不会立刻物理消失；相关旧版本和删除标记，往往也要等对应 `undo` 不再需要后，才会进一步被清理。
- 如果长事务一直不结束，老的快照会拖住 `update undo` 的清理。

Example: 事务 T1 把某行从 `v1` 改到 `v2` 并提交后，如果还有老事务的快照读可能要看到 `v1`，那条 `update undo` 还不能清；等这些老事务都结束后，`purge` 才能把它处理掉。


Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
