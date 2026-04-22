---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__undo_log_role_for_mvcc.md]]"
  - "Prereq: [[CARDS/tx__mvcc_hidden_columns_minimal.md]]"
  - "Next: [[CARDS/tx__read_view_visibility_rules.md]]"
evidence: ""
---

# 多个版本是怎么沿着 undo 串成一条链的？

**Point**: 同一行被多次 `update/delete` 后，当前记录会通过 `DB_ROLL_PTR` 指向更老版本相关的 `undo log`，于是就形成了从新到旧的一条版本链。

**Why**: 当前版本一旦不可见，数据库必须有办法继续往前找。版本链的意义，就是让“一路回退直到找到可见版本”这件事真的可执行。

Notes:
- 可以先把它理解成：链头离当前最近，越往后版本越旧。
- 这里讲的是“怎么沿链回退到旧版本”，不是在讲事务 `ROLLBACK` 本身。

Example: 一行先后变成 `v3 -> v2 -> v1`，一致性读若看不到 `v3`，就能继续退到 `v2`，再不行再退到 `v1`。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/refman-8.0-en.pdf (chapter: InnoDB Multi-Versioning)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
- sources/JavaGuide-mysql/mysql-questions-01.md
