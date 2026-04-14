---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/like_wildcard_basics.md]]"
  - "Compare: [[CARDS/cast_conversion_index_risk.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# LIKE 前缀 vs 包含

**Point**: 前缀模式如 `col LIKE 'abc%'` 可用 B-Tree 索引；包含 `%abc%` 因前导通配符通常无法利用索引，易全表扫描。  
**Why**: 设计查询时优先前缀匹配或改用倒排/全文索引，避免无谓扫描。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
