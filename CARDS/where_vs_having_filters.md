---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_logical_execution_order.md]]"
  - "Next: [[CARDS/alias_scope_where_having.md]]"
evidence: ""
---

# WHERE vs HAVING 过滤职责

**Point**: `WHERE` 过滤行，不能直接用聚合；`HAVING` 过滤分组，通常与 `GROUP BY` 连用且可引用聚合。

**Why**: 区分位置和作用可避免把聚合条件放在 WHERE，也能组合两者实现先行过滤再分组过滤。

SQL/Notes:
```sql
SELECT cust_name, COUNT(*) AS num_orders
FROM Customers
WHERE cust_email IS NOT NULL   -- 行级过滤
GROUP BY cust_name
HAVING COUNT(*) > 1;           -- 组级过滤
```

Refs:
- sources/sql-question/sql-syntax-summary.md
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
