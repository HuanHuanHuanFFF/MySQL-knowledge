---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/null_handling_basics.md]]"
evidence: ""
---

# COUNT 变体语义

**Point**: `COUNT(*)` 计所有行；`COUNT(col)` 忽略 col 为 NULL 的行；`COUNT(DISTINCT col)` 先去重再计数；`COUNT('常量')` 等同 COUNT(*)。

**Why**: 避免误把 `COUNT(col)` 当总行数，字段含 NULL 时会变少；确认是否需要去重或包含空值。

SQL/Notes:
```sql
SELECT COUNT(*) all_rows,
       COUNT(price) non_null_price,
       COUNT(DISTINCT user_id) uniq_users
FROM orders;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
- sources/sql-question/sql-syntax-summary.md
