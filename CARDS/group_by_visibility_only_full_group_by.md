---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_logical_execution_order.md]]"
evidence: ""
---

# GROUP BY 可见性与 ONLY_FULL_GROUP_BY

**Point**: 启用 ONLY_FULL_GROUP_BY 时，SELECT 中非聚合列必须出现在 GROUP BY；否则视为不合法。

**Why**: 避免从未分组的列返回不确定值，保证聚合结果一致性。

SQL/Notes:
```sql
-- 合法：非聚合列全部分组
SELECT cust_id, COUNT(*) AS cnt
FROM orders
GROUP BY cust_id;

-- 非法：item_name 未在 GROUP BY 且非聚合
SELECT cust_id, item_name, COUNT(*) FROM orders GROUP BY cust_id;
```

Refs:
- sources/sql-question/sql-questions-03.md
