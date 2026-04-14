---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__repeatable_read.md]]"
  - "Next: [[CARDS/tx__why_mysql_default_rr.md]]"
evidence: ""
---

# MySQL / InnoDB 默认隔离级别

**Point**: MySQL 的 InnoDB 默认隔离级别是 Repeatable Read。

**Why**: 这只是默认起点，不等于所有业务都必须坚持 RR；真正值得追问的是，它为什么被放成默认，以及你什么时候要改。

Example: `SELECT @@transaction_isolation;` 在 MySQL 8.0+ 可查看当前会话隔离级别。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; transaction_isolation variable)
- sources/JavaGuide-mysql/transaction-isolation-level.md
