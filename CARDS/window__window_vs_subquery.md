---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/window__count_sum_avg_over.md]]"
evidence: "sources/refman-8.0-en.pdf §12.21"
---

# 窗口函数 vs 子查询/自连接

**Point**: 许多“对每行附带分区统计/累计值/排名”的需求可用窗口函数一条 SELECT 完成，避免子查询或自连接。  
**Why**: 可读性高、避免重复扫描，优化器可用窗口算子而非额外连接。  
**SQL**:
```sql
SELECT o.*,
       SUM(o.amount) OVER (PARTITION BY o.customer_id
                           ORDER BY o.created_at) AS running_amount
FROM orders o;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21 Window Functions
