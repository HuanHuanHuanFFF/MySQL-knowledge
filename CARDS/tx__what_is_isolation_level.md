---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Next: [[CARDS/tx__what_is_mvcc.md]]"
evidence: ""
---

# 事务为什么需要隔离级别

**Point**: 隔离级别定义并发事务彼此“看见什么”，用来平衡一致性、可重复性和并发性能。

**Why**: 多个事务同时读写同一批数据时，如果没有统一规则，就会出现结果忽前忽后、读到未确认数据等问题。

Example: 同一事务里前后两次查询，是否必须看到同一结果，取决于隔离级别。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
