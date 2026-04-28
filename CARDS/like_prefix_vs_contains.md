---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/like_wildcard_basics.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# LIKE 前缀 vs 包含

**Point**: `col LIKE 'abc%'` 这种前缀匹配通常能用 B+Tree 索引；`col LIKE '%abc%'` 这种包含匹配通常不行，容易退化成全表扫描。

**Why**: B+Tree 的查找本质上依赖字典序，也就是从前往后逐位比较。只有前缀先确定下来，数据库才能把条件转成一个可定位的区间；前导通配符会让开头不确定，树就没法直接定位。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
