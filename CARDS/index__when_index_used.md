---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/index__full_scan_vs_index_scan.md]]"
  - "Next: [[CARDS/explain_select_basics.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.2.1 Optimizing Queries with EXPLAIN)"
---

# 何时会用到索引

**Point**: 等值/范围条件、前缀 LIKE、与索引前缀兼容的 ORDER BY/GROUP BY 可利用索引；在索引列上做函数/类型不匹配或前导通配符常导致放弃索引。  
**Why**: 写条件时预判是否走索引，避免退化为全表扫描。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; 8.2.1 Optimizing Queries with EXPLAIN)
