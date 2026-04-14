---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/window__over_partition_order_frame.md]]"
evidence: "sources/refman-8.0-en.pdf §12.21.2"
---

# LAG / LEAD 取前后行

**Point**: `LAG(expr, offset, default)` 与 `LEAD` 在分区的排序内取前/后第 offset 行的表达式，超出范围返回 NULL 或默认值；必须指定 ORDER BY 才有确定顺序。  
**Why**: 便捷获取相邻行/间隔行进行差值、同比等分析，无需自连接。  
**SQL**:
```sql
SELECT dept, hire_date, salary,
       LAG(salary, 1, 0)  OVER (PARTITION BY dept ORDER BY hire_date) AS prev_salary,
       LEAD(salary, 1)    OVER (PARTITION BY dept ORDER BY hire_date) AS next_salary
FROM employees;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21.2 Window Function Descriptions
