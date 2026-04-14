## REVIEW · Group & Aggregate

### Quick

<details>
<summary>Q：GROUP BY 的核心语义是什么？</summary>
A：
- 按分组列把行聚成组，每组输出一行；非聚合列必须在 GROUP BY 或聚合中。
</details>

See: [[CARDS/groupby_semantics]]

---

<details>
<summary>Q：WHERE 与 HAVING 在分组中的位置差异？</summary>
A：
- WHERE 组前按行过滤；HAVING 组后过滤，可用聚合和别名。
</details>

See: [[CARDS/groupby_where_vs_having]]

---

<details>
<summary>Q：COUNT(*)、COUNT(col)、COUNT(DISTINCT) 在分组中的区别？</summary>
A：
- COUNT(*) 计组内行；COUNT(col) 忽略 NULL；DISTINCT 先去重再计。
</details>

See: [[CARDS/groupby_count_variants]]

---

### Core

<details>
<summary>Q：ONLY_FULL_GROUP_BY 对 SELECT 列的要求是什么？</summary>
A：
- 所有非聚合列必须出现在 GROUP BY，否则视为非法。
</details>

See: [[CARDS/groupby_only_full_group_by_pitfall]]

---

<details>
<summary>Q：如何在分组中统计满足条件的行数？</summary>
A：
- 用 SUM(CASE WHEN 条件 THEN 1 ELSE 0 END) 做条件计数。
</details>

See: [[CARDS/groupby_conditional_count]]

---

<details>
<summary>Q：要统计多种状态的数量如何写得高效？</summary>
A：
- 一次 SELECT 里写多个 SUM(CASE WHEN ... THEN 1 END)，避免多次扫描。
</details>

See: [[CARDS/groupby_conditional_count]]

---

<details>
<summary>Q：为什么 COUNT(col) 可能比 COUNT(*) 小？</summary>
A：
- COUNT(col) 会忽略列为 NULL 的行，NULL 多时计数更小。
</details>

See: [[CARDS/groupby_count_variants]]

---

<details>
<summary>Q：HAVING 能否引用聚合别名？</summary>
A：
- 可以，HAVING 在聚合之后执行，别名已生成。
</details>

See: [[CARDS/groupby_where_vs_having]]

---

<details>
<summary>Q：HAVING 中使用非聚合列需要注意什么？</summary>
A：
- 非聚合列需要列在 GROUP BY，否则 ONLY_FULL_GROUP_BY 会拒绝。
</details>

See: [[CARDS/groupby_only_full_group_by_pitfall]]

---

<details>
<summary>Q：在分组后筛选聚合阈值的常见写法？</summary>
A：
- 聚合后用 HAVING COUNT()/SUM() 设阈值过滤组。
</details>

See: [[CARDS/groupby_where_vs_having]]

---

### Window Functions

<details>
<summary>Q：窗口函数与 GROUP BY 聚合的核心区别？</summary>
A：
- 窗口函数用 OVER 在每行附带分区内统计，保留明细；GROUP BY 折叠成每组一行。
</details>

See: [[CARDS/window__what_and_vs_groupby]]

---

<details>
<summary>Q：想同时保留明细又附带组内汇总该怎么选？</summary>
A：
- 选窗口函数（如 AVG(...) OVER(PARTITION BY ... )），无需再自连接。
</details>

See: [[CARDS/groupby_window_vs_aggregate]]

---

<details>
<summary>Q：OVER 里的 PARTITION、ORDER、FRAME 各做什么？</summary>
A：
- PARTITION BY 分区，ORDER BY 定序；未指定帧时带 ORDER 的窗口默认 RANGE UNBOUNDED PRECEDING 至 CURRENT ROW，ROWS/RANGE 帧控制累计范围。
</details>

See: [[CARDS/window__over_partition_order_frame]]

---

<details>
<summary>Q：SUM/COUNT/AVG OVER 常见用途是什么？</summary>
A：
- 作为窗口函数给每行附带分区总计、累计值或窗口平均，行数不折叠。
</details>

See: [[CARDS/window__count_sum_avg_over]]

---

<details>
<summary>Q：ROW_NUMBER、RANK、DENSE_RANK 有何区别？</summary>
A：
- 均需 ORDER BY；ROW_NUMBER 连续唯一；RANK 并列共享名次且跳号；DENSE_RANK 并列同名且不跳号，可按分区重置。
</details>

See: [[CARDS/window__row_number_rank_dense_rank]]

---

<details>
<summary>Q：LAG/LEAD 如何取相邻行的值？</summary>
A：
- 按窗口 ORDER BY 取前/后 offset 行，超出范围返回 NULL 或默认值。
</details>

See: [[CARDS/window__lag_lead]]

---

<details>
<summary>Q：窗口函数如何替代子查询/自连接？</summary>
A：
- 一条 SELECT 加 OVER 可直接给每行附带分区累计或排名，避免额外子查询或自连接。
</details>

See: [[CARDS/window__window_vs_subquery]]

---

<details>
<summary>Q：窗口函数有哪些默认帧或排序陷阱？</summary>
A：
- 没有 ORDER BY 结果不确定；带 ORDER 默认 RANGE 会把同排序值的同行都算进去，需 ROWS 控制；窗口函数不能放 WHERE/ON；排序和帧可能触发临时表/文件排序。
</details>

See: [[CARDS/window__pitfalls]]

---

### Pitfalls

<details>
<summary>Q：为什么 SELECT * 与 GROUP BY 一起使用会报错？</summary>
A：
- * 展开含未分组列，在 ONLY_FULL_GROUP_BY 下视为非法。
</details>

See: [[CARDS/groupby_only_full_group_by_pitfall]]

---

<details>
<summary>Q：条件放 WHERE 而非 HAVING 会导致什么问题？</summary>
A：
- 依赖聚合的条件若提前到 WHERE 会报错或过早过滤导致结果缺失。
</details>

See: [[CARDS/groupby_where_vs_having]]

---

<details>
<summary>Q：用 COUNT(DISTINCT) 可能遇到什么性能问题？</summary>
A：
- DISTINCT 需额外去重计算，数据量大时成本更高。
</details>

See: [[CARDS/groupby_count_variants]]

---

<details>
<summary>Q：缺少必要分组列会导致什么结果？</summary>
A：
- 未在 GROUP BY 中列出的非聚合列会返回不确定值或被 ONLY_FULL_GROUP_BY 拒绝。
</details>

See: [[CARDS/groupby_only_full_group_by_pitfall]]

---
