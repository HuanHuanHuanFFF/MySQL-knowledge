---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__why_transaction_needed]]"
  - "Next: [[CARDS/tx__acid_atomicity_durability]]"
evidence: "sources/refman-8.0-en.pdf; sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md"
---

# 事务里的 SQL 是怎么一起提交或回滚的？

**Point**: 从 `START TRANSACTION` 到 `COMMIT` 或 `ROLLBACK` 之间的相关 SQL，被放进同一个提交或回滚单位。

**Why**: 数据库需要一个明确边界来判断哪些 SQL 属于同一件业务事；边界内的 SQL 等到 `COMMIT` 一起确认，或在 `ROLLBACK` 时一起撤回。

Example:
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE user_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE user_id = 2;

COMMIT;
-- 如果中间发现条件不成立或执行失败，改用 ROLLBACK;
```

Refs:
- sources/refman-8.0-en.pdf (chapters: START TRANSACTION, COMMIT, and ROLLBACK statements)
- sources/JavaGuide-mysql/mysql-questions-01.md (section: 什么是数据库事务)
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md (section: 事务)
