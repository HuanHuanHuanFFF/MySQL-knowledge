---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/sql_select_clause_skeleton.md]]"
  - "Next: [[CARDS/where_vs_having_filters.md]]"
evidence: ""
---

# SELECT 逻辑执行顺序

**Point**: 实际处理顺序遵循 `FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT`（子句箭头串联给出的顺序）。

**Why**: 理解执行序能解释常见行为（如 WHERE 先于 SELECT，无法引用列别名；HAVING 可见聚合结果）。

SQL/Notes:
```sql
-- 按执行顺序思考，每步的可见列不同
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
SELECT ...
ORDER BY ...
LIMIT ...
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
