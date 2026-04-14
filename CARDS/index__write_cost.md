---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.5 Column Indexes; 8.3.1 B-Tree Index Characteristics)"
---

# 索引的写入维护成本

**Point**: 每个索引插入/更新都需维护 B+Tree，增加随机 I/O 和空间；索引越多写成本越高，优化器评估也更复杂。  
**Why**: 设计索引需权衡读写，避免无用或冗余索引拖慢写入。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.5 Column Indexes; 8.3.1 B-Tree Index Characteristics)
