---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization; 15.6.2.1 Clustered and Secondary Indexes)"
---

# 聚簇索引和二级索引，各自存什么？

**Point**: InnoDB 的聚簇索引叶子节点存整行记录；二级索引叶子节点通常存索引列值和对应主键值，不直接存整行。  
**Why**: 这样设计能让按主键访问时直接拿到整行，同时又能为其他查询列建立更轻的辅助查找结构，而不用在每个索引里都重复存一份完整行数据。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization; 15.6.2.1 Clustered and Secondary Indexes)
