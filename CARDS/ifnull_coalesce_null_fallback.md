---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/case_when_conditional_mapping.md]]"
evidence: ""
---

# IFNULL / COALESCE 兜底

**Point**: `IFNULL(expr, alt)` 返回 alt 代替 NULL；`COALESCE(a,b,...)` 取首个非 NULL，支持多级兜底。

**Why**: 统一输出非空值，避免聚合/展示时出现 NULL。

SQL/Notes:
```sql
SELECT COALESCE(nick, name, 'N/A') AS display_name FROM users;
```

Refs:
- sources/refman-8.0-en.pdf (chapter: expressions)
