---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/groupby_where_vs_having.md]]"
evidence: ""
---

# GROUP BY 语义

**Point**: GROUP BY 将输入行按指定列分组，每组输出一行；非聚合列必须在 GROUP BY 中或在聚合函数内。

**Why**: 明确分组粒度，避免因缺少分组列导致结果不确定。

Refs:
- sources/sql-question/sql-syntax-summary.md
