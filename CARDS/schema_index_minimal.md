---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/schema_primary_key_choice.md]]"
  - "Compare: [[CARDS/schema_unique_constraint.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.5 Column Indexes)"
---

# 索引最小集

**Point**: 常用索引类型有普通 INDEX、UNIQUE；联合索引按左前缀生效，列顺序决定可用查询。  
**Why**: 只保留必要索引减轻写开销；设计联合索引需结合查询条件顺序。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.5 Column Indexes)
