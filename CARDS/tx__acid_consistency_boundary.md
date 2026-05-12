---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__acid_atomicity_durability]]"
  - "Next: [[CARDS/tx__acid_isolation_concurrency]]"
evidence: "sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md"
---

# 一致性是不是数据库自动保证所有业务正确？

**Point**: 不是。一致性要求提交前后仍是正确状态，但数据库不能自动懂所有业务正确性。

**Why**: 数据库约束能守住唯一键、外键等结构规则；“这笔钱该不该转”“库存能不能扣”要靠应用把业务规则放进事务边界里。

Notes: 不要把 ACID 里的 C 背成“开了事务就业务一致”。

Refs:
- sources/JavaGuide-mysql/mysql-questions-01.md (section: ACID)
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md (section: 事务的特性)
