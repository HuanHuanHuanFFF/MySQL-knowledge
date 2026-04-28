---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.3.12 Index Condition Pushdown)"
---

# 二级索引查询是怎么走的？什么时候会回表？

**Point**: 二级索引查询通常先在索引叶子里按条件定位；如果叶子里已经有这次查询要的全部列，就可以直接返回，这叫覆盖索引；如果还缺列，就要拿叶子里的主键值再去聚簇索引取整行，这个过程就叫回表。  
**Why**: 二级索引本来就不直接存整行，所以数据库必须先判断“索引里够不够回答这条查询”。够就直接返回，不够就再去主键索引取整行，这也是覆盖索引通常比回表更省的原因。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 15.6.2.1 Clustered and Secondary Indexes)
