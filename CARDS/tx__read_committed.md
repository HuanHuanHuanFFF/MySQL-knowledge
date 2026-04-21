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

# 只看已提交版本，为什么还会两次读不一样？

**Point**: 因为 Read Committed 虽然只让已提交版本可见，但在 InnoDB 里，普通一致性读通常每次 `SELECT` 都会拿新的 Read View。

**Why**: 它把“提交才算数”当成底线，所以能防脏读；但视图会随着新的提交往前走，所以同一事务里两次查询仍可能不同。

Example: 第一次 `SELECT` 看到旧值；别的事务提交后，第二次 `SELECT` 看到新值。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
