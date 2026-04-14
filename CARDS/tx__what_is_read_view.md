---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__what_is_mvcc.md]]"
  - "Prereq: [[CARDS/tx__snapshot_read_vs_current_read.md]]"
  - "Next: [[CARDS/tx__rc_vs_rr_read_view_timing.md]]"
evidence: ""
---

# Read View 是什么

**Point**: Read View 可以把它理解成“一次一致性读当下的事务可见性快照”，里面记录哪些事务还活跃，从而决定哪些版本当前可见。

**Why**: MVCC 不是随便读旧数据；必须先有一套“这个版本对我算不算可见”的规则，而 Read View 就是这套规则的入口。

Example: 某行的最新版本如果来自你建视图时仍活跃的事务，这个版本对当前一致性读就通常不可见。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
