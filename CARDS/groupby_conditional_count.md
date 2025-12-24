---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/groupby_count_variants.md]]"
evidence: ""
---

# 条件计数（CASE + SUM）

**Point**: 用 `SUM(CASE WHEN cond THEN 1 ELSE 0 END)` 在分组中统计满足条件的行，可同时统计多口径。

**Why**: 一次扫描获取条件计数，避免多次子查询。

SQL/Notes:
```sql
SELECT cust,
  SUM(CASE WHEN status='paid' THEN 1 ELSE 0 END) AS paid_cnt,
  SUM(CASE WHEN status='refunded' THEN 1 ELSE 0 END) AS refund_cnt
FROM orders GROUP BY cust;
```

Refs:
- sources/sql-question/sql-syntax-summary.md
