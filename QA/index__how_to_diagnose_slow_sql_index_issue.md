---
type: mysql-qa
stack: "[[STACKS/stack__index_core.md]]"
tags: [mysql, qa, index]
topic: slow_sql_index_diagnosis
---

# 怎么排查慢 SQL 是不是索引问题？

## Point
- 这题本质在问：不要靠猜建索引，而是先把访问路径和优化器选择看清楚。

## Why
- 慢 SQL 可能是没命中索引、走错索引、回表太多、排序/临时表成本高，或者统计信息让优化器误判。
- 先用慢日志定位语句，再用 `EXPLAIN` 看 `type/key/rows/Extra`，最后回到谓词、统计信息和索引设计验证。

## Read Through
![[CARDS/index__diagnose_path]]
![[CARDS/explain_select_basics]]
![[CARDS/execflow__optimizer_plan]]
![[CARDS/update_index_lock_reminder]]

## Takeaway
- 排查顺序是：定位慢语句 -> 看执行计划 -> 查索引可用性和统计信息 -> 改写或调索引后复测。

## Refs
- sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN; 5.3 Slow Query Log; The Optimizer)
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
