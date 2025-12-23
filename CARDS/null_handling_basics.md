---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/count_variants_semantics.md]]"
evidence: ""
---

# NULL 基础与比较坑

**Point**: `NULL` 代表未知，`=`/`<>` 比较返回 UNKNOWN，行会被 WHERE 过滤；聚合如 `COUNT(col)`、`AVG` 会忽略 NULL。

**Why**: 避免用 `= NULL` 判断空值，应使用 `IS [NOT] NULL`，并在聚合时确认是否需要包含空值。

SQL/Notes:
```sql
WHERE col IS NULL        -- 判空
WHERE col IS NOT NULL    -- 排除空
```

Refs:
- sources/sql-question/sql-syntax-summary.md
