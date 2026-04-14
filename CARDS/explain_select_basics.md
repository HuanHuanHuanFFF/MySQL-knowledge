---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/show_metadata_basics.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN)"
---

# EXPLAIN 基础字段

**Point**: `EXPLAIN SELECT ...` 关注 `type`、`key`、`rows`、`Extra` 判断是否走索引、是否 filesort/temp。  
**Why**: 优化前先用计划评估访问路径，避免盲目改索引。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN)
