---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/index__what_is_index.md]]"
  - "Next: [[CARDS/index__when_index_used.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# 全表扫描 vs 索引扫描

**Point**: 全表扫描是把整表里的行一条条看过去；索引扫描是先在索引里缩小范围，再只访问更少的记录。  
**Why**: 索引真正带来的收益不是“神奇变快”，而是减少不必要的数据访问。条件越集中、过滤越强，索引扫描相比全表扫描就越能少读很多无关行。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
