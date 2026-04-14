---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__dirty_read.md]]"
  - "Next: [[CARDS/tx__read_committed.md]]"
evidence: ""
---

# Read Uncommitted

**Point**: Read Uncommitted 允许读到未提交版本，等于几乎不设“提交后才可见”的边界，因此三类读现象都可能出现。

**Why**: 它的核心不是“更聪明地读”，而是几乎不拦截读操作；代价就是业务可能拿到之后会回滚掉的数据。

Example: 事务 A 尚未提交的更新，事务 B 在这个级别下就可能直接读到。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
