---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__what_is_read_view.md]]"
  - "Next: [[CARDS/tx__read_view_visibility_rules.md]]"
  - "Expand: [[CARDS/tx__self_written_version_visibility.md]]"
evidence: ""
---

# Read View 里那几个关键字段，各自管什么？

**Point**: Read View 至少要承担 4 类判断职责：记住哪些事务当时还活着、可见性上下边界在哪、以及这是谁创建的视图；在实现里，这些职责常落到 `m_ids`、`m_up_limit_id`、`m_low_limit_id`、`m_creator_trx_id`。

**Why**: Read View 不是抽象地“判断可见性”，而是要靠这些字段拿到 3 类信息：活跃事务集合、可见性边界、以及视图创建者。拿到这些信息后，才能去判断一个版本的 `DB_TRX_ID` 该不该看。

Notes:
- `m_ids`：给出创建视图时仍活跃的事务集合，用来判断中间区间的版本是否可见。
- `m_up_limit_id`：给出一侧边界，帮助快速判定哪些更老事务写出的版本通常可见。
- `m_low_limit_id`：给出另一侧边界，帮助快速判定哪些更新事务写出的版本通常不可见。
- `m_creator_trx_id`：标出这个 Read View 是谁创建的，用来处理“自己写的版本自己可见”这类判断。

Example: 一个版本先看它落在边界哪一侧；若落在中间，再结合 `m_ids` 判断。


Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
