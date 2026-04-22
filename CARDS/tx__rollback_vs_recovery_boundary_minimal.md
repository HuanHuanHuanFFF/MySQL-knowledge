---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Next: [[CARDS/tx__what_is_undo_log.md]]"
  - "Compare: [[CARDS/tx__undo_log_role_for_mvcc.md]]"
  - "Expand: [[CARDS/tx__mvcc_two_questions_before_read_view.md]]"
evidence: ""
---

# 先切边界：回滚、崩溃恢复、事后恢复不是一回事

**Point**: 这条 stack 后面说的“回滚”，默认都指事务 `ROLLBACK`；崩溃恢复和事后恢复是另外两条线，不能和 MVCC 的“回退旧版本”混成一件事。

**Why**: 如果不先切边界，`undo log` 很容易被误读成“所有恢复都靠它”。但本地资料里已经明确分工：`redo log` 负责崩溃恢复，`binlog` 常用于备份/同步/恢复，而 `undo log` 首先服务事务回滚，并顺手支撑 MVCC。

Notes:
- 事务回滚：当前事务没 commit，撤销这次事务的改动。
- 崩溃恢复：实例宕机后恢复到一致状态，可能也会撤销未完成事务，但不是“已提交后再反悔”。
- 事后恢复：像备份后按日志恢复这类，通常不走这条普通 `undo` / MVCC 主线。
- 后面提“回退版本”，只指一致性读沿版本链找旧版本，不是事务 `ROLLBACK`。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md

