---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Next: [[CARDS/index__full_scan_vs_index.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3 Overview of the InnoDB Storage Engine)"
---

# 什么是索引

**Point**: 索引是按排序结构（如 B+Tree）保存键值并指向行的数据组织，用来加速定位而非直接存储数据。  
**Why**: 明确索引角色，后续理解范围扫描、回表与优化器选择才有基础。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3 Overview of the InnoDB Storage Engine)
