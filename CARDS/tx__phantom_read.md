---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Compare: [[CARDS/tx__non_repeatable_read.md]]"
  - "Next: [[CARDS/tx__read_uncommitted.md]]"
evidence: ""
---

# 幻读

**Point**: 幻读是同一事务里重复执行同一个范围查询，返回的“行集合”变了，像凭空多出或少了记录。

**Why**: 它关注的不是某一行被改值，而是满足条件的记录集合变了，所以比不可重复读更偏“范围问题”。

Example: 第一次查 `salary=500` 有 1 行；别的事务插入并提交后，再查变成 2 行。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: glossary, phantom read)
- sources/JavaGuide-mysql/transaction-isolation-level.md
