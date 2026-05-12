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

# 数据库怎么判断这次该看哪个版本？（一致性读视图 / Read View）

**Point**: 数据库靠一致性读视图（Read View）决定当前一致性读该看哪个版本；你可以先把它理解成一张“可见性快照”。

**Why**: MVCC 不是随便翻旧账；必须先判定“这个版本对我算不算成立”，一致性读视图就是这套可见性规则的入口。

Example: 某行的最新版本如果来自你建视图时仍活跃的事务，这个版本对当前一致性读就通常不可见。


Refs:
- sources/refman-8.0-en.pdf (chapter: Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
