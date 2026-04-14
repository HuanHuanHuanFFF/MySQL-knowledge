---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__phantom_read.md]]"
  - "Next: [[CARDS/tx__mysql_default_isolation.md]]"
evidence: ""
---

# Serializable

**Point**: Serializable 最严格，按串行化语义执行事务，可避免脏读、不可重复读和幻读。

**Why**: 它把结果稳定性放在并发前面，因此比前几个级别更保守。

Example: 同一事务里反复跑同一查询，结果集应保持一致。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
