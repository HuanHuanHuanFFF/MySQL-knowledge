---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/substring_length_basics.md]]"
evidence: ""
---

# ROUND / CEIL / FLOOR

**Point**: `ROUND(x, d)` 四舍五入到 d 位；`CEIL(x)` 向上取整；`FLOOR(x)` 向下取整。

**Why**: 控制数值展示或阈值判断时选对取整方式，避免边界误差。

SQL/Notes:
```sql
SELECT ROUND(price,2), CEIL(weight), FLOOR(weight) FROM items;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
