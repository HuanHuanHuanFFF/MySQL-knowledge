---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/window__over_partition_order_frame.md]]"
evidence: "sources/refman-8.0-en.pdf §§12.21.1-12.21.2"
---

# 窗口函数常见坑

**Point**: 需 ORDER BY 才有确定顺序；带 ORDER BY 的窗口默认帧为 `RANGE ... CURRENT ROW` 会把同排序值的同伴都纳入，想按行数滚动应用 `ROWS`；窗口函数不能用于 WHERE/ON，需在 SELECT/HAVING/ORDER BY 中使用；大量排序/帧计算可能用到临时表/文件排序。  
**Why**: 避免结果不稳定、累计值过大或语法位置错误导致的性能/正确性问题。  
**SQL**:
```sql
SELECT ts, val,
       SUM(val) OVER (ORDER BY ts) AS range_sum,              -- 默认 RANGE，同行值共享帧
       SUM(val) OVER (ORDER BY ts ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS rows_sum
FROM metrics;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21 Window Functions
