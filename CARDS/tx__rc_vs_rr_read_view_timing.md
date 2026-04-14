---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Compare: [[CARDS/tx__read_committed.md]]"
  - "Compare: [[CARDS/tx__repeatable_read.md]]"
  - "Next: [[CARDS/tx__why_mysql_default_rr.md]]"
evidence: ""
---

# RC vs RR 的 Read View 时机

**Point**: RC 和 RR 的关键实现差别，是一致性读的 Read View 生成时机不同：RC 每次 `SELECT` 前生成新视图，RR 在事务第一次一致性读时固定。

**Why**: 所以 RC 能保证“不读未提交”，但结果会随着后续提交前进；RR 把事务内视图钉住，才换来可重复读。

Example: 同一事务两次普通 `SELECT`，RC 可能读到两版已提交数据，RR 通常读到同一版。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
