---
type: mysql-qa
stack: "[[STACKS/stack__index_core.md]]"
tags: [mysql, qa, index]
topic: slow_sql_index_diagnosis
---

# 怎么排查慢 SQL 是不是索引问题？

## Point
- 不要靠猜建索引，而是先把这条 SQL 实际怎么读数据看清楚。

## Why
- 慢 SQL 常见的索引问题不是“完全没索引”，而是没有命中合适索引，或者读了太多不该读的数据。
- 先定位语句，再看 `EXPLAIN`，然后回到条件写法和索引设计验证，路径最稳。

## Read Through
![[CARDS/index__diagnose_path]]
![[CARDS/explain_select_basics]]
![[CARDS/index__full_scan_vs_index_scan]]

## Takeaway
- 排查顺序是：定位慢语句 -> 看执行计划 -> 看这次到底读了多少数据 -> 再决定改 SQL 还是改索引。

## Refs
- sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN; 5.3 Slow Query Log)
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
