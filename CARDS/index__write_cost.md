---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.5 Column Indexes; 8.3.1 B-Tree Index Characteristics)"
---

# 索引的写入维护成本

**Point**: 索引不是白送的；每次 `insert/update/delete`，相关 B+Tree 都要一起维护，索引越多，写入越重、占用空间也越大。  
**Why**: 索引是为了给读查询换时间，但代价是写入时要同步更新这些有序结构。所以索引设计本质上是读收益和写成本的取舍，不是越多越好。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.5 Column Indexes; 8.3.1 B-Tree Index Characteristics)
