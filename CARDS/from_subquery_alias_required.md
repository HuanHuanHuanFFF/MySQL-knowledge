---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Expand: [[CARDS/sql_select_clause_skeleton.md]]"
evidence: ""
---

# FROM 子查询必须命名

**Point**: FROM 子句的子查询结果必须取表别名，否则语法错误。

**Why**: MySQL 要求 FROM 后跟表标识；给子查询命名也便于在外层引用列。

SQL/Notes:
```sql
SELECT sub.avg_amt
FROM (
  SELECT customer_id, AVG(amount) AS avg_amt
  FROM payments
  GROUP BY customer_id
) AS sub;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
