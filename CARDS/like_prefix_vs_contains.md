---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/like_wildcard_basics.md]]"
  - "Compare: [[CARDS/cast_conversion_index_risk.md]]"
evidence: ""
---

# LIKE 前缀 vs 包含

**Point**: 前缀模式如 `col LIKE 'abc%'` 可利用索引；包含 `%abc%` 通常无法走索引，易全表扫描。

**Why**: 设计查询时优先前缀匹配或改用倒排/全文索引，避免无谓扫描。

Refs:
- sources/sql-question/sql-syntax-summary.md
