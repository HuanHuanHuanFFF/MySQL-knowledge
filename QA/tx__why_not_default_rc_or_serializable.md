---
type: mysql-qa
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, qa, tx]
topic: tx_default_isolation_tradeoff
---

# 为什么默认不是 RC，也不是 Serializable？

## Point
- 这题本质在问：默认隔离级别为什么不能只追求“更轻”或“更稳”。

## Why
- RC 更轻，但事务内读稳定性更弱；Serializable 更稳，但等待和吞吐代价更高。
- InnoDB 默认选 RR，是在事务内读稳定性、普通读并发和锁代价之间取折中。

## Read Through
![[CARDS/tx__mysql_default_isolation]]
![[CARDS/tx__why_mysql_default_rr]]
![[CARDS/tx__serializable]]

## Takeaway
- 默认值不是“最稳就是最好”，而是工程上对一致性、等待和吞吐的一次折中。

## Refs
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels)
- sources/JavaGuide-mysql/transaction-isolation-level.md
