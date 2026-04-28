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

**Point**: 前缀模式如 `col LIKE 'abc%'` 通常能用 B-Tree 索引；包含 `%abc%` 因前导通配符通常无法利用索引，容易退化成全表扫描。  
**Why**: B+Tree 利用的是“按开头有序排列”的能力。只有模式前缀确定时，数据库才能把条件转成一个可定位的区间；前导通配符会让起点不确定，树就没法直接定位。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
