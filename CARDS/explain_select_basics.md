---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/show_metadata_basics.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN)"
---

# EXPLAIN 基础字段

**Point**: `EXPLAIN SELECT ...` 用来先看 MySQL 打算怎么访问数据，重点关注 `type`、`key`、`rows`、`Extra`，判断有没有走对索引。

**Why**: 慢 SQL 不能靠猜。优化前先看执行计划，才能分清是没走索引、走了错索引，还是读了太多不该读的数据。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN)
