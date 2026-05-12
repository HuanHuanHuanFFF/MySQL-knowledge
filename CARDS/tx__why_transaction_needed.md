---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Next: [[CARDS/tx__transaction_as_one_unit]]"
evidence: "sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md"
---

# 为什么业务动作需要事务？

**Point**: 业务动作经常不是单条 SQL；事务解决的是中间失败时不能留下半截业务结果的问题。

**Why**: 转账、扣库存、下单这类业务动作通常包含多步修改；钱扣了但没到账、库存扣了但订单没生成，比整件事失败更危险。事务要把相关修改绑定成要么一起确认、要么一起撤回。

Refs:
- sources/JavaGuide-mysql/mysql-questions-01.md (section: MySQL 事务)
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md (section: 事务)
