---
type: mysql-card
stack: "[[STACKS/stack__join_core.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/join_on_vs_where_left.md]]"
  - "Compare: [[CARDS/join_inner_vs_left.md]]"
evidence: ""
---

# LEFT JOIN 变成 INNER 的常见原因

**Point**: 在 WHERE 中对右表列做非空过滤（如 `WHERE b.id IS NOT NULL`）会丢弃右表缺失的行，使 LEFT JOIN 实际等同 INNER。

**Why**: 排查缺失行时先检查 WHERE 是否过滤了 NULL，必要时改到 ON 中。

Refs:
- sources/sql-question/sql-syntax-summary.md
