---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__read_view_fields_minimal.md]]"
  - "Expand: [[CARDS/tx__read_view_visibility_rules.md]]"
  - "Next: [[CARDS/tx__rc_rr_same_chain_different_result.md]]"
evidence: ""
---

# 为什么事务自己刚写的版本，自己通常能看到？

**Point**: 因为 Read View 要排除的是“别的活跃事务”带来的干扰，不是把当前事务自己的修改也一起屏蔽；所以同一事务自己写出的版本，通常自己可见。

**Why**: 如果把自己刚写的版本也判成不可见，事务内读写就会自相矛盾。`m_creator_trx_id` 和 “`m_ids` 不含当前事务” 这两个点，正是为了把这个特例讲清楚。

Notes:
- JavaGuide 明确写到：事务能看到该事务本身做的修改。
- `m_ids` 记录的是创建视图时其他未提交的活跃事务，不包括当前事务自己。
- 这张卡只讲“自己为什么可见”，不展开 RC / RR 分叉。

Example: 你在事务里先 `update` 一行，再 `select` 同一行，读到自己刚写的值并不违背一致性读规则。


Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
- sources/JavaGuide-mysql/transaction-isolation-level.md
