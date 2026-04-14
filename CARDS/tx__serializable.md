---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__phantom_read.md]]"
  - "Next: [[CARDS/tx__snapshot_read_vs_current_read.md]]"
evidence: ""
---

# Serializable

**Point**: Serializable 追求串行化语义，可把它理解成用更保守的锁定与等待把并发事务隔开，因此三类读现象都不应出现。

**Why**: 它的设计重点不是“再给一个更稳定的快照”，而是尽量少放行会互相干扰的并发；代价就是等待更多、吞吐更低。

Example: 同样的范围查询与插入/更新并发时，更容易出现等待，而不是各自继续推进。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
