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

# 快照读 vs 当前读

**Point**: InnoDB 里普通 `SELECT` 在 RC / RR 下通常走快照读；`SELECT ... FOR UPDATE`、`UPDATE`、`DELETE` 这类走当前读并参与加锁。

**Why**: 先分清“读旧版本快照”还是“读最新版本并约束并发”，后面看 RC / RR / Serializable 的实现差异才不容易混。

Example: 普通 `SELECT` 更像读快照；`SELECT ... FOR UPDATE` 会读最新版本，并和并发事务发生锁竞争。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads; 17.7.2.4 Locking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
