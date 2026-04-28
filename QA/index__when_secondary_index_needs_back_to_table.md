---
type: mysql-qa
stack: "[[STACKS/stack__index_core.md]]"
tags: [mysql, qa, index]
topic: secondary_index_back_to_table
---

# 二级索引什么时候需要回表？覆盖索引为什么能避免回表？

## Point
- 这题本质在问：二级索引叶子节点里到底有什么，为什么有时还要再回主键索引取整行。

## Why
- InnoDB 二级索引叶子通常存索引列和主键值，不直接存整行。
- 查询所需列不全在二级索引里时，就要拿主键回聚簇索引取完整行；如果所需列都在索引里，就是覆盖索引，可以少一次回表。

## Read Through
![[CARDS/index__clustered_vs_secondary]]
![[CARDS/index__covering_index_vs_back_to_table]]
![[CARDS/explain_select_basics]]

## Takeaway
- 判断是否回表，关键看“这条查询要的列，二级索引自己够不够回答”。

## Refs
- sources/refman-8.0-en.pdf (chapter: 15.6.2.1 Clustered and Secondary Indexes; 8.3.1 B-Tree Index Characteristics; 8.8.1 Using EXPLAIN)
