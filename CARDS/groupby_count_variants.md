---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/groupby_where_vs_having.md]]"
  - "Next: [[CARDS/groupby_conditional_count.md]]"
evidence: ""
---

# COUNT 变体（分组场景）

**Point**: `COUNT(*)` 计组内行数；`COUNT(col)` 忽略 NULL；`COUNT(DISTINCT col)` 先去重。与 GROUP BY 配合决定每组结果。

**Why**: 明确计数口径，避免因 NULL 或重复导致统计偏差。

SQL/Notes:
```sql
SELECT cust,
       COUNT(*) AS rows_in_group,
       COUNT(pay_time) AS paid_rows,
       COUNT(DISTINCT sku_id) AS skus
FROM orders GROUP BY cust;
```

Refs:
- sources/sql-question/sql-syntax-summary.md
