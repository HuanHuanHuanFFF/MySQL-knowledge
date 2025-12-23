---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_select_clause_skeleton.md]]"
  - "Expand: [[CARDS/order_by_alias_usage.md]]"
evidence: ""
---

# ORDER BY 多列排序

**Point**: 可指定多列排序，按顺序依次比较；各列可独立 ASC/DESC。

**Why**: 保持结果稳定排序，避免仅按单列导致同值行顺序不确定。

SQL/Notes:
```sql
SELECT * FROM products
ORDER BY prod_price DESC, prod_name ASC;
```

Refs:
- sources/sql-question/sql-syntax-summary.md
