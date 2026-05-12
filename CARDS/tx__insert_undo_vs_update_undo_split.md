---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__what_is_undo_log.md]]"
  - "Next: [[CARDS/tx__version_chain_minimal.md]]"
  - "Expand: [[CARDS/tx__delete_on_version_chain.md]]"
evidence: ""
---

# insert undo 和 update undo，在 MVCC 主线里差在哪？

**Point**: 两者最核心的差异有两点：`insert undo` 主要服务“撤销这次插入”，而 `update undo` 主要服务“保留修改前旧版本”；因此前者通常能更早清理，后者往往要留得更久。

**Why**: 对一致性读来说，新插入但当前视图不可见的记录，通常直接判成“这行不存在”；但 `update/delete` 改的是原来就存在的行，后续读很可能还要回到修改前的旧值，所以 `update undo` 更常挂在 MVCC 主线上。

Notes:
- `insert undo` 在插入提交后通常可以更早清理，因为正式版本就是当前这行本身，后续一致性读一般不需要回到“插入前不存在”。
- `update undo` 往往要保留更久，因为一致性读可能还要顺着它回到旧版本。
- `delete` 在内部更接近一次特殊的 `update`，所以也更靠近 `update undo` 这条线。

Example: 新插入一行时，别的事务通常只是“看不见这行”；把一行从 `v1` 改成 `v2` 时，别的事务却可能还要看到旧的 `v1`。


Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
