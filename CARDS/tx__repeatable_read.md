---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__non_repeatable_read.md]]"
  - "Next: [[CARDS/tx__serializable.md]]"
  - "Expand: [[CARDS/tx__rc_vs_rr_read_view_timing.md]]"
evidence: ""
---

# Repeatable Read

**Point**: 在 InnoDB 里，Repeatable Read 会让事务内一致性读复用同一 Read View，所以重复读取同一行时结果更稳定，能防脏读和不可重复读。

**Why**: 它比 RC 多拿到一层“事务内快照稳定性”；普通读主要靠 MVCC，不必把所有 `SELECT` 都做成重锁，当前读再配合更保守的锁语义。

Example: 同一事务里反复读取同一行，除非是自己改的，否则结果应保持一致。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
