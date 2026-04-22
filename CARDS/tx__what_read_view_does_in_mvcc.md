---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__mvcc_two_questions_before_read_view.md]]"
  - "Prereq: [[CARDS/tx__mvcc_hidden_columns_minimal.md]]"
  - "Next: [[CARDS/tx__read_view_fields_minimal.md]]"
evidence: ""
---

# Read View 到底是什么，它在这里负责什么？

**Point**: Read View 可以先理解成“当前这次一致性读拿来判断版本可见性的视图”。它保存这次读创建视图时的活跃事务和边界信息，用来判断当前版本对当前事务是否可见。

**Why**: `DB_TRX_ID` 只能告诉你“这版是谁写的”，但光知道作者还不够；还得有一套“当前这次读站在什么时点看世界”的规则，才能判断当前版本该不该返回给当前事务，这就是 Read View 的作用。

Notes:
- 行上记录的是版本作者信息，Read View 记录的是这次一致性读的判断上下文。
- 一次一致性读不是凭空判断，而是拿“当前这次读对应的 Read View”去判当前版本是否可见。
- RC 下通常每次一致性读都会新建 Read View；RR 下通常复用事务第一次一致性读生成的 Read View。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
