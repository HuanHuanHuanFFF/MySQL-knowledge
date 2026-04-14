---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.2.1.14 ORDER BY Optimization)"
---

# ORDER BY 与索引/Filesort

**Point**: ORDER BY 可用索引排序需与索引前缀和方向一致，且 WHERE 不破坏顺序；否则 Extra 会显示 Using filesort。  
**Why**: 写排序时判断能否复用索引，避免额外排序代价。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.2.1.14 ORDER BY Optimization)
