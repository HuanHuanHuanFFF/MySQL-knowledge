---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization; 15.6.2.1 Clustered and Secondary Indexes)"
---

# 聚簇索引 vs 二级索引

**Point**: InnoDB 聚簇索引叶子存整行数据；二级索引叶子存主键，需要回表通过主键取行。  
**Why**: 主键长度影响所有二级索引，选择短稳主键可减回表开销和存储。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization; 15.6.2.1 Clustered and Secondary Indexes)
