---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_select_clause_skeleton.md]]"
evidence: ""
---

# DISTINCT 作用范围

**Point**: `DISTINCT` 作用于选择列表的全部列，只有整行值完全相同才算重复；可用于聚合如 `AVG(DISTINCT col)`。

**Why**: 避免误以为仅对单列去重；多列表达式会一起参与比较，导致结果集行数预期不同。

SQL/Notes:
```sql
SELECT DISTINCT col1, col2 FROM t;   -- 对 (col1,col2) 组合去重
SELECT AVG(DISTINCT score) FROM t;   -- 先去重再聚合
```

Refs:
- sources/sql-question/sql-syntax-summary.md
