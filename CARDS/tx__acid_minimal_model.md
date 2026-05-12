---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__transaction_as_one_unit]]"
  - "Next: [[CARDS/tx__acid_atomicity_durability]]"
evidence: "sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md"
---

# ACID 四个字母到底在约束什么？

**Point**: ACID 是事务要守住的四类约束：撤回半成品、保持正确状态、隔开并发干扰、保住提交结果。

**Why**: 事务不是只把几条 SQL 包起来；它要回答失败、提交、并发、故障分别发生时，数据库应该保住什么。

Minimal model:
- Atomicity（原子性）：事务里的修改要么都生效，要么失败时撤回半成品。
- Consistency（一致性）：事务提交前后，数据库要从一个正确状态进入另一个正确状态。
- Isolation（隔离性）：并发事务之间不能随便互相干扰，读写影响要受隔离规则约束。
- Durability（持久性）：事务提交后，即使发生故障，已经确认的结果也要保住。

Refs:
- sources/JavaGuide-mysql/mysql-questions-01.md (section: ACID)
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md (section: 事务的特性)
