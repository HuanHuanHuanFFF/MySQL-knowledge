---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__dirty_read.md]]"
  - "Next: [[CARDS/tx__read_committed.md]]"
evidence: ""
---

# Read Uncommitted

**Point**: Read Uncommitted 保护最弱，允许读到未提交数据，因此脏读、不可重复读、幻读都可能出现。

**Why**: 它放宽了事务之间的保护，允许查询在原本可能等待的情况下继续执行，但结果可靠性最弱，因此实际很少使用。

Example: 事务 A 尚未提交的更新，事务 B 在这个级别下就可能直接读到。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
