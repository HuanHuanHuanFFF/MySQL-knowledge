---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__insert_undo_vs_update_undo_split.md]]"
  - "Prereq: [[CARDS/tx__version_chain_minimal.md]]"
  - "Expand: [[CARDS/tx__read_view_visibility_rules.md]]"
evidence: ""
---

# delete 为什么也能进版本链，而不是直接“消失”？

**Point**: 因为在 InnoDB 里，`delete` 在内部更像一次特殊的更新：当前版本会被标成删除，而更老版本仍可通过 `undo log` 继续回退。

**Why**: 如果删除是“立刻物理消失”，那并发事务就没法解释自己为什么还能看到删除前的版本。把删除放进版本链，MVCC 才能保持读视图稳定。

Notes:
- JavaGuide 明确提到：`delete` 在内部被视为更新，并会打上 `deleted_flag`。
- `delete` 相关旧版本仍可能需要 `update undo` 来支撑一致性读。

Example: 一行刚被别的事务删掉，对你当前一致性读不可见时，数据库仍可能沿链回到“删除前”的旧版本。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/refman-8.0-en.pdf (chapter: InnoDB Multi-Versioning)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
