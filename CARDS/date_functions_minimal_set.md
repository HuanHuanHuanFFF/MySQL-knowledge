---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/between_datetime_boundaries.md]]"
evidence: ""
---

# 日期函数最小集合

**Point**: 常用日期差/截断函数：`DATEDIFF(d1,d2)` 返回天差；`TIMESTAMPDIFF(unit,d1,d2)` 按单位求差；`DATE(ts)` 截断到日期。

**Why**: 统一选择函数，避免混用 TIMEDIFF/DATE_FORMAT 导致单位或索引失效。

SQL/Notes:
```sql
SELECT DATEDIFF('2023-02-02','2023-02-01');          -- 1
SELECT TIMESTAMPDIFF(MINUTE, start_time, end_time);  -- 分钟差
SELECT DATE(created_at) AS day_key;                  -- 截断
```

Refs:
- sources/sql-question/sql-questions-02.md
- sources/sql-question/sql-questions-01.md
