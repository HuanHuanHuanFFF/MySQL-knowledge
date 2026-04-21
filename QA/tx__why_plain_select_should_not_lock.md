---
type: mysql-qa
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, qa, tx]
topic: tx_plain_select_and_mvcc
---

# 为什么普通 SELECT 不想总加锁？

## Point
- 这题本质在问：普通读想要结果稳定，为什么不直接把它全部变成锁竞争。

## Why
- 如果普通 `SELECT` 也大量靠锁来保稳定，读写并发会明显变差。
- InnoDB 用 MVCC 让普通一致性读更多走快照，而把锁主要留给当前读和写操作。

## Read Through
![[CARDS/tx__what_is_mvcc]]
![[CARDS/tx__snapshot_read_vs_current_read]]

## Takeaway
- 先记设计目标：别让普通读默认陷入锁竞争；具体怎么区分快照读和当前读，再看下一张 QA。

## Refs
- sources/refman-8.0-en.pdf (chapter: InnoDB Multi-Versioning; 17.7.2.3 Consistent Nonlocking Reads; 17.7.2.4 Locking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
