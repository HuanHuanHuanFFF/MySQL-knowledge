---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/groupby_count_variants.md]]"
evidence: "sources/refman-8.0-en.pdf §12.21"
---

# 窗口函数 vs 聚合

**Point**: GROUP BY 聚合把每组折叠成一行；窗口函数（如 `COUNT(*) OVER(PARTITION BY ...)`）保留明细行并附带组内计算。  
**Why**: 需要同时呈现明细与组内汇总时选窗口函数，避免为聚合再自连接。  
**SQL**:
```sql
SELECT dept, emp_id, salary,
       AVG(salary) OVER (PARTITION BY dept) AS dept_avg
FROM employees;
```
Refs:
- sources/refman-8.0-en.pdf §12.21 Window Functions
