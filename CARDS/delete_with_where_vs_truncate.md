---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/update_with_where_basics.md]]"
evidence: ""
---

# DELETE 必带条件；TRUNCATE 对比

**Point**: `DELETE FROM tbl WHERE 条件` 逐行删除并可回滚；`TRUNCATE TABLE tbl` 快速清空不可逐行过滤。

**Why**: 避免缺 WHERE 误删；需要按条件删除用 DELETE，整表清空用 TRUNCATE。

SQL/Notes:
```sql
DELETE FROM logs WHERE created_at < '2023-01-01';
-- TRUNCATE logs;  -- 整表清空
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
