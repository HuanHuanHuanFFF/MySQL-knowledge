---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/cast_conversion_index_risk.md]]"
  - "Next: [[CARDS/like_prefix_vs_contains.md]]"
evidence: ""
---

# LIKE 与通配符

**Point**: `LIKE` 匹配文本模式；`%` 任意长度通配，`_` 单字符；仅文本列使用。

**Why**: 选择合适模式避免误匹配，明确通配符含义。

SQL/Notes:
```sql
WHERE prod_name LIKE 'usb%';  -- 前缀匹配
```

Refs:
- sources/sql-question/sql-syntax-summary.md
