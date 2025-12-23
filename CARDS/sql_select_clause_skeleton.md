---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/sql_logical_execution_order.md]]"
evidence: ""
---

# SELECT 子句骨架

**Point**: 标准 SELECT 写法及条款顺序：`SELECT [ALL|DISTINCT] <expr> FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY ... LIMIT ...`。

**Why**: 统一骨架能减少遗漏筛选/排序子句，也方便对应逻辑执行顺序的推导。

SQL/Notes:
```sql
-- 按顺序补全子句，缺啥补啥
SELECT [ALL|DISTINCT] select_expr
FROM <tables>
WHERE <row filter>
GROUP BY <cols>
HAVING <group filter>
ORDER BY <sort keys>
LIMIT <offset, size>;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
