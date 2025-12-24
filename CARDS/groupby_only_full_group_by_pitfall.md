---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/groupby_semantics.md]]"
evidence: ""
---

# ONLY_FULL_GROUP_BY 常见坑

**Point**: 开启 ONLY_FULL_GROUP_BY 时，SELECT 非聚合列必须出现在 GROUP BY 中；否则视为非法并报错。

**Why**: 防止未分组列返回不确定值；写查询时确保所有非聚合列都在分组键内，或改用聚合。

Refs:
- sources/sql-question/sql-questions-03.md
