---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__mysql_default_isolation.md]]"
evidence: ""
---

# 隔离级别总结对比

**Point**: 四种隔离级别可以直接按“是否允许脏读、不可重复读、幻读”来做最小对比。

**Why**: 把三类现象放在同一张表里，更容易看出四个级别的边界差异。

| Level | 脏读 | 不可重复读 | 幻读 |
| --- | --- | --- | --- |
| RU | 有 | 有 | 有 |
| RC | 无 | 有 | 有 |
| RR | 无 | 无 | 标准定义下仍可能有 |
| Serializable | 无 | 无 | 无 |

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; glossary entries)
- sources/JavaGuide-mysql/transaction-isolation-level.md
