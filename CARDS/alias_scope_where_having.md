---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/where_vs_having_filters.md]]"
  - "Next: [[CARDS/order_by_alias_usage.md]]"
evidence: ""
---

# 别名作用域：WHERE 不可见，HAVING 可见

**Point**: 列别名在 WHERE 阶段不可见，在 HAVING 可以使用；原因是 WHERE 先执行，别名尚未计算。

**Why**: 避免在 WHERE 中引用刚取的别名（会报未知列），需要用 HAVING 或重复表达式。

SQL/Notes:
```sql
SELECT price * qty AS amt
FROM orders
-- WHERE amt > 100     -- 无效，别名尚未生成
HAVING amt > 100;       -- 合法，组级阶段可见别名
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
