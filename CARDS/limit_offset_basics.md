---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_select_clause_skeleton.md]]"
evidence: ""
---

# LIMIT / OFFSET 分页

**Point**: `LIMIT n` 取前 n 行；`LIMIT offset, size` 从 offset（0 起）开始取 size 行。

**Why**: 统一分页写法，防止 off-by-one；大偏移可能慢，需结合索引或改用游标/键条件翻页。

SQL/Notes:
```sql
SELECT * FROM orders
ORDER BY created_at DESC
LIMIT 0, 20;   -- 第 1 页
```

Refs:
- sources/sql-question/sql-syntax-summary.md
