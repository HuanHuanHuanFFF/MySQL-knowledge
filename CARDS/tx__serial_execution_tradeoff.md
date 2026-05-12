---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__acid_isolation_concurrency]]"
  - "Next: [[CARDS/tx__concurrency_control_two_directions]]"
evidence: "sources/refman-8.0-en.pdf; sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/transaction-isolation-level.md"
---

# 最稳的办法是不是让所有事务排队执行？

**Point**: 是。事务一个个执行最容易正确，因为事务之间没有交叉；代价是并发差，吞吐和响应时间都会受影响。

**Why**: 数据库必须服务大量同时发生的读写。真正要解决的问题，不是简单把所有事务都排队，而是在不完全串行的情况下，尽量兼顾正确性和并发性能。

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/mysql-questions-01.md (sections: SQL 标准定义了哪些事务隔离级别; 并发事务的控制方式有哪些)
- sources/JavaGuide-mysql/transaction-isolation-level.md
