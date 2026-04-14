---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__non_repeatable_read.md]]"
  - "Next: [[CARDS/tx__serializable.md]]"
evidence: ""
---

# Repeatable Read

**Point**: Repeatable Read 让同一事务里重复读取同一行时结果保持一致，能防脏读和不可重复读。

**Why**: 它比 RC 更强调“事务内读结果稳定”；标准定义里幻读仍是概念上的风险，细节实现后面再拆。

Example: 同一事务里反复读取同一行，除非是自己改的，否则结果应保持一致。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: glossary, REPEATABLE READ; 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
