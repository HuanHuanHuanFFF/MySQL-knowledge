---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.3.12 Index Condition Pushdown)"
---

# 覆盖索引 vs 回表/ICP

**Point**: 覆盖索引查询所需列都在同一索引叶子上，Extra 显示 Using index；列缺失需回表，Using where；ICP 允许在索引遍历时过滤，减少回表。  
**Why**: 判断是否能避免回表与评估 Extra 字段，有助写出更高效的查询。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.3.12 Index Condition Pushdown)
