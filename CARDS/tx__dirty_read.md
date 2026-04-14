---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__what_is_isolation_level.md]]"
  - "Next: [[CARDS/tx__non_repeatable_read.md]]"
evidence: ""
---

# 脏读

**Point**: 脏读是读到了别的事务“还没提交”的数据；这份数据之后可能回滚，等于白读。

**Why**: 风险不在“值变了”，而在你读到的内容可能从未真正成立过，业务判断会建立在假数据上。

Example: T1 `UPDATE balance=90` 未提交，T2 读到 90；随后 T1 回滚，真实值仍是 100。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: glossary, dirty read)
- sources/JavaGuide-mysql/mysql-questions-01.md
