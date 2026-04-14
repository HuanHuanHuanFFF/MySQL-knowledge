---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__what_is_isolation_level.md]]"
  - "Next: [[CARDS/tx__snapshot_read_vs_current_read.md]]"
  - "Next: [[CARDS/tx__what_is_read_view.md]]"
evidence: ""
---

# MVCC 是什么

**Point**: MVCC 是多版本并发控制；同一行可以保留多个历史版本，让事务按可见性规则读取自己该看到的版本。

**Why**: 它的核心取舍是“少让普通读去等锁”，用版本链换更高并发；所以 InnoDB 的 RC / RR 不只是靠锁，还靠 MVCC。

Example: 别的事务刚更新一行但还没轮到你可见时，你的普通 `SELECT` 仍可能读到旧版本。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: InnoDB Multi-Versioning; Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
