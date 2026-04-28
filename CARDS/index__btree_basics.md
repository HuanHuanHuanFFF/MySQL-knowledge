---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# B+Tree 基础直觉

**Point**: B+Tree 的核心直觉不是“层数低”，而是“键值有序”：内部节点帮你不断缩小查找范围，叶子节点按顺序排好，所以等值查、范围查和顺序扫描都很自然。  
**Why**: 数据库索引需要的不只是“找到一个值”，还要能高效做区间查询和连续读取。按键值有序组织的数据结构，正好能同时满足这些查询需求，所以 B+Tree 适合作为通用索引结构。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
