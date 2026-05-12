---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__what_is_isolation_level.md]]"
  - "Next: [[CARDS/tx__snapshot_read_vs_current_read.md]]"
  - "Next: [[CARDS/tx__what_is_read_view.md]]"
evidence: ""
---

# 为什么普通 SELECT 不想总等锁？MVCC 怎么帮忙？

**Point**: MVCC 的回答是：别让普通读总去等锁；同一行保留多个历史版本后，事务就可以按可见性规则读到自己该看的版本。

**Why**: 如果每次普通 `SELECT` 都主要靠重锁来保结果稳定，读写并发会很差；MVCC 用版本链换读并发，所以 RC / RR 不只是靠锁。

Example: 别的事务刚更新一行但还没轮到你可见时，你的普通 `SELECT` 仍可能读到旧版本。


Refs:
- sources/refman-8.0-en.pdf (chapter: InnoDB Multi-Versioning; Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
