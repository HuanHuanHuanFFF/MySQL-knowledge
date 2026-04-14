---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/window__over_partition_order_frame.md]]"
evidence: "sources/refman-8.0-en.pdf §12.21.1"
---

# 聚合函数作为窗口函数

**Point**: SUM/COUNT/AVG 等聚合可加 `OVER(...)` 作为窗口函数，按分区/排序/帧返回每行对应的聚合结果而不折叠行。  
**Why**: 便于做分区总计、累计值、窗口平均数，同时保留明细。  
**SQL**:
```sql
SELECT customer_id, order_id, amount,
       SUM(amount) OVER (PARTITION BY customer_id) AS cust_total,
       COUNT(*)   OVER () AS total_orders
FROM orders;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21.1 Window Function Concepts
