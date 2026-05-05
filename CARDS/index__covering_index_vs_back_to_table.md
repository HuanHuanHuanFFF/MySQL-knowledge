---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.3.12 Index Condition Pushdown)"
---

# 二级索引什么时候要回表？覆盖索引省了哪一步？

**Point**: 二级索引先按索引列定位到叶子节点；叶子里通常能拿到索引列和主键值。如果查询还需要其他列，就要用主键再走一次聚簇索引取整行，这一步叫回表；如果二级索引本身已经包含查询需要的列，就是覆盖索引。

**Why**: 二级索引为了保持轻量，不会复制整行数据。它先帮查询快速找到候选记录和主键；是否回表，取决于这次 `SELECT` 要的列，二级索引叶子里能不能直接凑齐。

Notes:
- 能凑齐：少走一次聚簇索引，直接从二级索引返回。
- 凑不齐：拿主键回到聚簇索引叶子节点取整行。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 15.6.2.1 Clustered and Secondary Indexes)
