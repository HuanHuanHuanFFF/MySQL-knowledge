---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/ifnull_coalesce_null_fallback.md]]"
evidence: ""
---

# CONCAT / CONCAT_WS

**Point**: `CONCAT(a,b,...)` 直接拼接；`CONCAT_WS(sep,a,b,...)` 用分隔符跳过 NULL。

**Why**: 快速组装展示字段，`CONCAT_WS` 防止 NULL 变成整串 NULL。

SQL/Notes:
```sql
SELECT CONCAT('a', NULL, 'b');          -- NULL
SELECT CONCAT_WS('-', 'a', NULL, 'b');  -- a-b
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
