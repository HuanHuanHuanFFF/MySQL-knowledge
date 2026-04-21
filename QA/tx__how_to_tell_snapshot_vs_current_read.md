---
type: mysql-qa
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, qa, tx]
topic: tx_snapshot_vs_current_read
---

# 怎么区分快照读和当前读？

## Point
- 这题本质在问：一次读到底是在做一致性读，还是在读最新值并参与加锁。

## Why
- 普通 `SELECT` 在 RC / RR 下通常走快照读，重点是读到当前事务可见的版本。
- `SELECT ... FOR UPDATE`、`UPDATE`、`DELETE` 这类走当前读，重点是读最新值并进入锁语义。

## Read Through
![[CARDS/tx__snapshot_read_vs_current_read]]
![[CARDS/tx__what_is_read_view]]

## Takeaway
- 快照读重“可见版本”，当前读重“最新值 + 锁”。

## Refs
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads; 17.7.2.4 Locking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
