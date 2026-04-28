---
type: mysql-qa
stack: "[[STACKS/stack__index_core.md]]"
tags: [mysql, qa, index]
topic: index_not_used
---

# 为什么明明建了索引却没走？

## Point
- 这题本质在问：索引存在，不等于这条 SQL 的访问路径一定适合用它。

## Why
- 优化器会按条件写法、联合索引前缀、类型/函数转换、统计信息和成本来选计划。
- 所以“没走索引”常见原因不是索引不存在，而是条件不满足索引可用规则，或优化器估算觉得用它不划算。

## Read Through
![[CARDS/index__when_index_used]]
![[CARDS/index__leftmost_prefix]]
![[CARDS/cast_conversion_index_risk]]
![[CARDS/index__cardinality_statistics]]

## Takeaway
- 先查 SQL 写法是否让索引可用，再看统计信息和优化器成本判断；不要只盯“有没有建索引”。

## Refs
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.8.1 Using EXPLAIN; 8.9.6 Index Statistics)
- sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion.md
