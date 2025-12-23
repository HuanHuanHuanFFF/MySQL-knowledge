---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/alias_scope_where_having.md]]"
evidence: ""
---

# ORDER BY 可用列别名

**Point**: `ORDER BY` 支持使用选择列表中的别名或原始字段进行排序。

**Why**: 利用别名排序能避免重复复杂表达式，保持排序表达式与展示字段一致。

SQL/Notes:
```sql
SELECT price * qty AS amt
FROM orders
ORDER BY amt DESC, order_id ASC;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
