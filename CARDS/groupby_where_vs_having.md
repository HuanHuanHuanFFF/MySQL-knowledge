---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/groupby_semantics.md]]"
  - "Next: [[CARDS/groupby_count_variants.md]]"
evidence: ""
---

# WHERE vs HAVING（分组场景）

**Point**: WHERE 在分组前过滤行，不能用聚合；HAVING 在分组后过滤组，可用聚合和别名。

**Why**: 合理放置条件避免误过滤，常见模式：先 WHERE 缩小行，再 HAVING 过滤聚合结果。

SQL/Notes:
```sql
SELECT cust, COUNT(*) AS cnt
FROM orders
WHERE status = 'paid'
GROUP BY cust
HAVING COUNT(*) >= 2;
```

Refs:
- sources/sql-question/sql-syntax-summary.md
