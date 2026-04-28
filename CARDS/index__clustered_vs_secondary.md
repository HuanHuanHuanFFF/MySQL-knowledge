---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization; 15.6.2.1 Clustered and Secondary Indexes)"
---

# 聚簇索引和二级索引，各自存什么？

**Point**: InnoDB 的聚簇索引叶子节点存整行记录；二级索引叶子节点通常只存索引列值和对应主键值，不直接存整行。

**Why**: 数据本体总得有一个地方集中存放，而其他索引更适合只保存“怎么按这个字段快速找到那行”的信息。这样主键查询能直接拿整行，其他字段查询也能用更轻的辅助结构。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization; 15.6.2.1 Clustered and Secondary Indexes)
