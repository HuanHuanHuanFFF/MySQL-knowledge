---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/between_datetime_boundaries.md]]"
evidence: ""
---

# NOW / CURDATE / DATE_FORMAT

**Point**: `NOW()` 当前日期时间；`CURDATE()` 当前日期；`DATE_FORMAT(ts,'%Y-%m-%d')` 按格式输出。

**Why**: 取当前时间或格式化展示时的常用三件套，避免手写字符串拼接。

SQL/Notes:
```sql
SELECT NOW(), CURDATE(), DATE_FORMAT(NOW(), '%Y-%m-%d') AS day;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
