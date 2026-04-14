---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__dirty_read.md]]"
  - "Next: [[CARDS/tx__repeatable_read.md]]"
evidence: ""
---

# Read Committed

**Point**: Read Committed 只能读到已提交数据，所以能避免脏读；但同一事务里多次读仍可能看到后来提交的新结果。

**Why**: 它比 RU 更安全，但读视图不要求“整段事务固定”，因此不可重复读和幻读仍可能发生。

Example: 第一次 `SELECT` 看到旧值；别的事务提交后，第二次 `SELECT` 看到新值。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
