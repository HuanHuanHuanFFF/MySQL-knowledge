---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/in_vs_exists_minimal.md]]"
evidence: ""
---

# BETWEEN 边界与日期坑

**Point**: `BETWEEN a AND b` 为闭区间；用于 DATETIME 时包含 b 当秒，易漏掉秒级尾巴。

**Why**: 避免用 `BETWEEN '2023-01-01' AND '2023-01-31'` 丢失 1 月 31 日 23:59 之后的数据，推荐半开区间写法。

SQL/Notes:
```sql
-- 半开区间写法
WHERE ts >= '2023-01-01' AND ts < '2023-02-01'
```

Refs:
- sources/sql-question/sql-syntax-summary.md
