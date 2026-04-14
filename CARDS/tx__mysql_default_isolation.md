---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__repeatable_read.md]]"
  - "Next: [[CARDS/tx__isolation_level_summary.md]]"
evidence: ""
---

# MySQL / InnoDB 默认隔离级别

**Point**: MySQL 的 InnoDB 默认隔离级别是 Repeatable Read。

**Why**: 这意味着你不手动改配置时，事务默认就在“比 RC 更强调读稳定性”的模式下运行。

Example: `SELECT @@transaction_isolation;` 在 MySQL 8.0+ 可查看当前会话隔离级别。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; transaction_isolation variable)
- sources/JavaGuide-mysql/transaction-isolation-level.md
