---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__undo_log_role_for_mvcc.md]]"
  - "Next: [[CARDS/tx__mvcc_hidden_columns_minimal.md]]"
  - "Next: [[CARDS/tx__read_view_fields_minimal.md]]"
evidence: ""
---

# 一次一致性读，先要解决哪两个问题？

**Point**: 一次一致性读先只解决两件事：当前这版能不能看；如果不能看，上一版去哪里找。

**Why**: 因为一致性读的实现骨架就是这两步：先判断当前版本是否可见；如果不可见，再回退到更老版本继续判断。后面的 `DB_TRX_ID`、`DB_ROLL_PTR`、版本链、Read View，都是在回答这两件事。

Notes:
- 判断当前版本能不能看，要拿版本作者信息去和 Read View 对照。
- 当前版本不能看时，要沿着 `undo log` 形成的版本链继续往旧版本找。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
