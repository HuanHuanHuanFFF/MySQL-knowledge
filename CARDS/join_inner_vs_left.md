---
type: mysql-card
stack: "[[STACKS/stack__join_core.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/join_on_vs_where_left.md]]"
evidence: ""
---

# INNER JOIN vs LEFT JOIN

**Point**: INNER JOIN 只返回两边匹配的行；LEFT JOIN 返回左表全部行，右表不匹配则为 NULL。

**Why**: 选择 JOIN 类型决定结果行覆盖范围，是设计查询的第一步。

Refs:
- sources/sql-question/sql-syntax-summary.md
