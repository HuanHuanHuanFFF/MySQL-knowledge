---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_logical_execution_order.md]]"
evidence: ""
---

# IN vs EXISTS 最小比较

**Point**: `IN (subquery)` 先生成子查询结果再匹配；`EXISTS (subquery)` 检查是否存在匹配行，常用于相关子查询。

**Why**: 数据量大时，相关子查询用 EXISTS 可避免大结果集传输；IN 适合小集合或已索引列。

SQL/Notes:
```sql
-- EXISTS 相关子查询
SELECT * FROM t1 WHERE EXISTS (
  SELECT 1 FROM t2 WHERE t2.id = t1.id
);
```

Refs:
- sources/sql-question/sql-syntax-summary.md
