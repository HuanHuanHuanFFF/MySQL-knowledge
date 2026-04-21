---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__what_is_mvcc.md]]"
  - "Next: [[CARDS/tx__what_is_read_view.md]]"
  - "Expand: [[CARDS/tx__rc_vs_rr_read_view_timing.md]]"
evidence: ""
---

# 什么时候读快照，什么时候必须读最新值？

**Point**: 普通 `SELECT` 在 RC / RR 下通常走快照读；要读最新值并顺手约束并发时，才进入当前读。

**Why**: 先分清“读历史版本”还是“读最新值并加锁”，后面再看 RC / RR / Serializable 的差别，才不会把 MVCC 和锁混成一团。

Example: 普通 `SELECT` 更像读快照；`SELECT ... FOR UPDATE` 会读最新版本，并和并发事务发生锁竞争。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads; 17.7.2.4 Locking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
