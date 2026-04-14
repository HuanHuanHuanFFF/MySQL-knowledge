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

# 为什么 InnoDB 默认是 Repeatable Read

**Point**: 可把 InnoDB 默认选 RR 理解为一种工程折中：比 RC 给更稳定的事务内视图，又不像 Serializable 那样把普通读大面积推向强锁。

**Why**: 这是基于官方默认值与 InnoDB 一致性读设计的工程解读。RC 一致性更弱；Serializable 更保守；RR 则试图把“读稳定性”和“普通读并发”放在一个更均衡的位置。

Example: 读多写少场景里，普通 `SELECT` 仍可走快照读；但写冲突高时，RR 又会比 RC 承担更保守的锁代价。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/mysql-questions-01.md
