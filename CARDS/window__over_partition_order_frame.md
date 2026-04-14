---
type: mysql-card
stack: "[[STACKS/stack__group_agg.md]]"
tags: [mysql]
related:
  - "[[CARDS/window__count_sum_avg_over.md]]"
evidence: "sources/refman-8.0-en.pdf §§12.21.1-12.21.2"
---

# OVER 语法：PARTITION / ORDER / FRAME

**Point**: `OVER(PARTITION BY ... ORDER BY ... frame_clause)` 定义窗口；无 ORDER BY 时一整个分区是窗口；有 ORDER BY 时默认帧为 `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`，可改 `ROWS`/`RANGE ...` 控制累计范围。  
**Why**: PARTITION 控制分组，ORDER 决定顺序，FRAME 决定每行参与计算的行集（RANGE 以排序值同值为同一帧，ROWS 以行数计）。  
**SQL**:
```sql
SELECT account_id, ts, amount,
       SUM(amount) OVER (
         PARTITION BY account_id
         ORDER BY ts
         ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) AS rolling_sum
FROM payments;
```
**Refs**:
- sources/refman-8.0-en.pdf §12.21 Window Functions
