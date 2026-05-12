---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__rc_vs_rr_read_view_timing.md]]"
  - "Prereq: [[CARDS/tx__mysql_default_isolation.md]]"
  - "Next: [[CARDS/tx__isolation_level_summary.md]]"
evidence: ""
---

# 为什么默认不是 RC，也不是 Serializable？

**Point**: 可把默认选 RR 理解为一种工程折中：比 RC 给更稳定的事务内视图，又不像 Serializable 那样把普通读大面积推向强锁。

**Why**: RC 更强调并发，但事务内读稳定性更弱；Serializable 更稳，但更保守；RR 试图把“读稳定性”和“普通读并发”放在一个更均衡的位置。

Example: 读多写少场景里，普通 `SELECT` 仍可走快照读；但写冲突高时，RR 又会比 RC 承担更保守的锁代价。


Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/mysql-questions-01.md
