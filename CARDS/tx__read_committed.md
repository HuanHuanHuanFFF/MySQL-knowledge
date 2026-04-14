---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__dirty_read.md]]"
  - "Next: [[CARDS/tx__repeatable_read.md]]"
  - "Expand: [[CARDS/tx__rc_vs_rr_read_view_timing.md]]"
evidence: ""
---

# Read Committed

**Point**: Read Committed 只让已提交版本可见；在 InnoDB 里，普通一致性读通常是“每次 `SELECT` 一张新 Read View”，所以能防脏读但不能保证事务内结果不变。

**Why**: 它把“提交才算数”当成底线，因此不会读到脏数据；但视图会随着新的提交向前推进，所以同一事务重复查询仍可能看到新值。

Example: 第一次 `SELECT` 看到旧值；别的事务提交后，第二次 `SELECT` 看到新值。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
