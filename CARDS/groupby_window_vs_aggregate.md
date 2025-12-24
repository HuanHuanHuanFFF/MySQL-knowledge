---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/groupby_count_variants.md]]"
evidence: ""
---

# 窗口函数 vs 聚合

**Point**: 聚合 `GROUP BY` 折叠为每组一行；窗口函数 `COUNT(*) OVER(PARTITION BY ...)` 保留明细行并附带组内计算。

**Why**: 需要明细+组统计时选窗口，纯聚合选 GROUP BY。

Refs:
- sources/sql-question/sql-syntax-summary.md
