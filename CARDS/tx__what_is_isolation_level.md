---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Next: [[CARDS/tx__what_is_mvcc.md]]"
evidence: ""
---

# 为什么事务要先约定彼此“能看见什么”？

**Point**: 因为并发事务如果不先约定“彼此能看见什么”，读写结果就会忽前忽后；隔离级别就是这套规则。

**Why**: 数据库不是单线程账本；它要在一致性、事务内读稳定性和并发性能之间做取舍，隔离级别就是第一层总开关。

Example: 同一事务里前后两次查询，是否必须看到同一结果，取决于隔离级别。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
