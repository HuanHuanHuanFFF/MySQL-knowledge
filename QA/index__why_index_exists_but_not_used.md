---
type: mysql-qa
stack: "[[STACKS/stack__index_core.md]]"
tags: [mysql, qa, index]
topic: index_not_used
---

# 为什么明明建了索引却没走？

## Point
- 索引存在，不等于这条 SQL 的写法就一定能利用它。

## Why
- 这一页先抓最常见原因：查询条件没有用上索引的有序性。
- 比如联合索引没有从左往右连续使用，或者 `LIKE` 前面就用了通配符，数据库就很难靠这份索引直接定位。

## Read Through
![[CARDS/index__leftmost_prefix]]
![[CARDS/like_prefix_vs_contains]]
![[CARDS/explain_select_basics]]

## Takeaway
- 先查 SQL 写法有没有真的利用索引的有序性，不要只盯“有没有建索引”。

## Refs
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.8.1 Using EXPLAIN)
