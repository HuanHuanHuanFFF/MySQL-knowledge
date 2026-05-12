---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__acid_consistency_boundary]]"
  - "Next: [[CARDS/tx__serial_execution_tradeoff]]"
evidence: "sources/refman-8.0-en.pdf; sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/transaction-isolation-level.md"
---

# 隔离性为什么是事务里最容易变复杂的一项？

**Point**: A/C/D 多偏单个事务的正确性；I 难在多个事务同时执行时，彼此能不能看见、覆盖、等待。

**Why**: 单个事务内部失败可以靠提交和回滚边界处理；一旦多个事务并发运行，问题变成“你的修改会不会影响我”“我前后两次读是否该稳定”“冲突读写要不要等待”。

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/mysql-questions-01.md (section: 并发事务带来了哪些问题)
- sources/JavaGuide-mysql/transaction-isolation-level.md
