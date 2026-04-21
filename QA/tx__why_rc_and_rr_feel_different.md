---
type: mysql-qa
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, qa, tx]
topic: tx_rc_rr_stability
---

# 为什么同样两次 SELECT，RC 会变而 RR 更稳定？

## Point
- 这题本质在问：RC 和 RR 都用一致性读，为什么事务里的读感还是不一样。

## Why
- 差别不在“有没有 MVCC”，而在一致性读视图（Read View）何时生成。
- RC 会随着新的提交继续向前看；RR 会更早把事务内视图固定下来，所以两次读通常更稳定。

## Read Through
![[CARDS/tx__read_committed]]
![[CARDS/tx__repeatable_read]]
![[CARDS/tx__rc_vs_rr_read_view_timing]]

## Takeaway
- RC 和 RR 最值得记住的差异，不只是名字，而是事务内一致性读到底会不会复用同一视图。

## Refs
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
