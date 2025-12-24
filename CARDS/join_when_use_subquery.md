---
type: mysql-card
stack: "[[STACKS/stack__join_core.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/join_multitable_pattern.md]]"
evidence: ""
---

# 何时用子查询/CTE 简化

**Point**: 当多表 JOIN 难以读或需先聚合再关联时，可用子查询/CTE 先产出中间表再 JOIN。

**Why**: 降低复杂度、避免重复聚合；便于单独验证中间结果。

Refs:
- sources/sql-question/sql-syntax-summary.md
