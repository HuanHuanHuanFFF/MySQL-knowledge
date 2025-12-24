---
type: mysql-card
stack: "[[STACKS/stack__join_core.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/join_inner_vs_left.md]]"
evidence: ""
---

# JOIN 导致重复行的坑

**Point**: 一对多/多对多 JOIN 会扩张行数，直接 COUNT/SUM 会被放大。

**Why**: 统计时需 DISTINCT、GROUP BY 或拆分子查询，避免重复累加。

Refs:
- sources/sql-question/sql-syntax-summary.md
