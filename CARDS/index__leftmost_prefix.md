---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# 联合索引最左前缀

**Point**: 复合索引按定义顺序排序，可利用从最左列开始的连续前缀；遇到首个范围条件后续列通常无法继续匹配排序。  
**Why**: 设计列顺序与写查询时需保证条件/排序涵盖左前缀，避免索引失效。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
