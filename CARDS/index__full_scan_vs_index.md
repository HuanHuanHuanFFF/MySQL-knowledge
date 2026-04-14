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

**Point**: 全表扫描逐行读整表；索引扫描先在索引定位匹配键，再覆盖或回表读取，能显著减少访问行数。  
**Why**: 用于估算语句成本并判断是否命中索引。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
