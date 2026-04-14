---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/window__over_partition_order_frame.md]]"
evidence: "sources/refman-8.0-en.pdf §12.21.2"
---

# ROW_NUMBER / RANK / DENSE_RANK

**Point**: 排名类窗口函数要求 `ORDER BY`；ROW_NUMBER 连续唯一编号；RANK 对并列给同值且跳号；DENSE_RANK 同值同名且不跳号。PARTITION BY 可分组重置排名。  
**Why**: 选择合适的排名语义（是否允许并列、是否跳号）来表达业务排序。  
**SQL**:
```sql
SELECT dept, emp, salary,
       ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS rn,
       RANK()       OVER (PARTITION BY dept ORDER BY salary DESC) AS rk,
       DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS dr
FROM employees;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21.2 Window Function Descriptions
