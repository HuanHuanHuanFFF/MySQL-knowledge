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

**Point**: Read View 可以先理解成“一次一致性读的可见性视图”。它保存这次读创建视图时的活跃事务和边界信息，用来判断某个版本的 `DB_TRX_ID` 现在算不算可见。

**Why**: `DB_TRX_ID` 只能告诉你“这版是谁写的”，但光知道作者还不够；还得有一套“当前这次读站在什么时点看世界”的规则，才能判断这个版本该不该看，这就是 Read View 的作用。

Notes:
- 行上记录的是版本作者信息，Read View 记录的是这次一致性读的判断上下文。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
