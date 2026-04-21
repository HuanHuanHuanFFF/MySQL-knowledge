---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__phantom_read.md]]"
  - "Next: [[CARDS/tx__snapshot_read_vs_current_read.md]]"
evidence: ""
---

# 既然 Serializable 最稳，为什么通常不默认用它？

**Point**: 因为 Serializable 靠更保守的锁定与等待把并发事务隔开，三类读现象都能压住，但并发也会明显下降。

**Why**: 它不是在现有快照机制上再补一点，而是尽量少放行会互相干扰的并发；所以结果最稳，也最容易带来等待和吞吐损失。

Example: 同样的范围查询与插入/更新并发时，更容易出现等待，而不是各自继续推进。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
