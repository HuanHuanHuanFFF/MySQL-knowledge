---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__why_mysql_default_rr.md]]"
evidence: ""
---

# 隔离级别总结对比

**Point**: 最后回到一张最小对照表：四种隔离级别先按“脏读 / 不可重复读 / 幻读”来记，再把机制和权衡挂回去。

**Why**: 这张表适合快速回忆边界；但面试里别停在这里，后面通常会继续追问 RC / RR 的视图差异，以及默认选 RR 的原因。

| Level | 脏读 | 不可重复读 | 幻读 |
| --- | --- | --- | --- |
| RU | 有 | 有 | 有 |
| RC | 无 | 有 | 有 |
| RR | 无 | 无 | 标准定义下仍可能有；InnoDB 会额外处理一部分 |
| Serializable | 无 | 无 | 无 |

Notes:
- RC：每次一致性读会向新的已提交版本前进。
- RR：一致性读更稳定；当前读再配合更保守的锁语义。
- Serializable：结果最稳，但等待和并发代价最大。

Up: [[STACKS/stack__tx_mvcc_lock]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/transaction-isolation-level.md
