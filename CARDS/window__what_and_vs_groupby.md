---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/groupby_window_vs_aggregate.md]]"
evidence: "sources/refman-8.0-en.pdf §12.21"
---

# 窗口函数定义与对比 GROUP BY

**Point**: 窗口函数使用 `... OVER(...)` 在每行上附带分区内统计或排名，不折叠原行；GROUP BY 聚合则把每组压成一行。  
**Why**: 需要同时看到明细和组内指标时用窗口函数，避免为了聚合再自连接或子查询。  
**SQL**:
```sql
SELECT dept, emp_id, salary,
       AVG(salary) OVER (PARTITION BY dept) AS dept_avg
FROM employees;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21 Window Functions
