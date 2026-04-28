---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Next: [[CARDS/index__full_scan_vs_index.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3 Overview of the InnoDB Storage Engine)"
---

# 什么是索引

**Point**: 索引是把某些列的值按特定结构组织起来的一份辅助查找结构，目的是先按值快速定位，再去拿到对应记录，而不是每次都从头扫完整张表。  
**Why**: 业务查询经常要按 `id`、状态、时间、名称这类字段做等值查找、范围查找或排序。如果每次都逐行检查，数据一大成本就会迅速上升。索引就是为了把“按字段值找数据”这件事做快。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3 Overview of the InnoDB Storage Engine)
