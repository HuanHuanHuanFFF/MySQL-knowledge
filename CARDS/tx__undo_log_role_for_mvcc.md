---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__what_is_undo_log.md]]"
  - "Next: [[CARDS/tx__version_chain_minimal.md]]"
  - "Next: [[CARDS/tx__read_view_visibility_rules.md]]"
evidence: ""
---

# undo log 在 MVCC 里，不只是“回滚日志”还负责什么？

**Point**: 在 MVCC 里，`undo log` 的核心作用是提供旧版本，让一致性读在最新版本不该给当前事务看时，还能继续往前找。

**Why**: 如果没有 `undo log`，数据库只能看到当前这版。一旦最新版本不属于你这次读该看到的版本，一致性读就断了，因为它找不到更老的版本继续判断。

Notes:
- 如果这行的最新版本不该给当前事务看，一致性读不会立刻停下。
- InnoDB 会借 `DB_ROLL_PTR` 找到对应 `undo log`，继续往更老版本看。

Example: 某行的最新版本对当前视图不成立时，一致性读就可能退回到 `undo log` 里的旧版本继续判断。


Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
- sources/JavaGuide-mysql/mysql-questions-01.md
