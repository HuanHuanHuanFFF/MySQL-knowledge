---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__what_is_mvcc.md]]"
  - "Next: [[CARDS/tx__what_is_undo_log.md]]"
  - "Next: [[CARDS/tx__version_chain_minimal.md]]"
evidence: ""
---

# 行上要记什么，这条读路径才走得下去？

**Point**: 要让一致性读走得下去，行上至少得留下两类信息：这版是谁写的；如果这版不能看，往哪退回上一版。InnoDB 里常对应 `DB_TRX_ID` 和 `DB_ROLL_PTR`。

**Why**: Read View 通过 `DB_TRX_ID` 拿到“这版是谁写的”，才能判断当前版本是否可见；版本链通过 `DB_ROLL_PTR` 拿到上一版线索，才能继续往旧版本回退。没有这两类信息，这条读路径就接不上。

Notes:
- `DB_TRX_ID`：给出这版记录的作者事务 ID，供 Read View 做可见性判断。
- `DB_ROLL_PTR`：给出回到更老版本的线索，供一致性读继续往旧版本找。
- `DB_ROW_ID`：按官方口径，它也属于 InnoDB 行记录的隐藏系统列之一；主要用于没有合适主键时的内部 row id / 聚簇索引补位。它不参与 Read View 的可见性判断，也不负责版本回退，所以对 MVCC 不是核心。


Refs:
- sources/refman-8.0-en.pdf (chapter: InnoDB Multi-Versioning)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
