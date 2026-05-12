---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__serial_execution_tradeoff]]"
evidence: "sources/refman-8.0-en.pdf; sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/transaction-isolation-level.md"
---

# 并发控制主要往哪两个方向折中？

**Point**: 为了在正确性和并发性能之间折中，数据库引入锁处理必须互斥的冲突，引入 MVCC（Multi-Version Concurrency Control，多版本并发控制）让普通读尽量读合适版本，而不是总等写。

**Why**: 完全放开并发会出错，所有事务都排队又太慢。引入 MVCC 的核心作用，是让普通读不必总是等正在修改的数据，而是按可见性规则读到合适的版本。

Notes: 锁仍然负责必须互斥的冲突；MVCC 解决的是“能不能让读少等写”的问题。

Refs:
- sources/refman-8.0-en.pdf (chapters: InnoDB Multi-Versioning; 17.7.2.3 Consistent Nonlocking Reads; 17.7.2.4 Locking Reads)
- sources/JavaGuide-mysql/mysql-questions-01.md (section: 并发事务的控制方式有哪些)
- sources/JavaGuide-mysql/transaction-isolation-level.md
