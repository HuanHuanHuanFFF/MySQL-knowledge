---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/update_with_where_basics.md]]"
evidence: ""
---

# 事务控制最小示例

**Point**: 基本语义：`BEGIN`/`START TRANSACTION` 开启；`COMMIT` 持久化；`ROLLBACK` 撤销未提交变更。

**Why**: 保证多条写操作的原子性，避免半成功。

SQL/Notes:
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id=1;
UPDATE accounts SET balance = balance + 100 WHERE id=2;
COMMIT; -- 或出错时 ROLLBACK
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
