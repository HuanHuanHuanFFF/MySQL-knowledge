---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# B+Tree 基础直觉

**Point**: 可以先把 B+Tree 理解成一棵按键值有序组织的查找树：内部节点负责缩小范围，叶子节点按顺序排好，所以很适合查某个值，也很适合查一段范围。

**Why**: 数据库索引需要同时支持等值查找、范围查找和顺序扫描。B+Tree 的有序结构正好能把这三件事放在同一套索引里完成，所以数据库经常选它做通用索引。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
