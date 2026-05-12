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

# 为什么 RC 两次 SELECT 会变，而 RR 更稳定？

**Point**: 因为 RC 和 RR 的关键实现差别，就是一致性读视图（Read View）的生成时机不同：RC 每次 `SELECT` 前刷新，RR 在第一次一致性读时固定。

**Why**: RC 只保证“不读未提交”，不保证“整段事务都看同一版”；RR 把事务内视图钉住，所以才换来更稳定的重复读。

Example: 同一事务两次普通 `SELECT`，RC 可能读到两版已提交数据，RR 通常读到同一版。


Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
