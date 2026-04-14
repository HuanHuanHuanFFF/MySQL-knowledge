---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# B+Tree 基础直觉

**Point**: InnoDB 普通索引基于有序 B+Tree，扇出高、层数低，按键排序支持等值和范围查找。  
**Why**: 了解有序结构与低高度，才能理解为何索引可快速定位并顺序扫描范围。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
