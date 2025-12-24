---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/show_metadata_basics.md]]"
evidence: ""
---

# EXPLAIN 基础字段

**Point**: `EXPLAIN SELECT ...` 查看执行计划；关注 `type`、`key`、`rows`、`Extra` 等字段判定是否走索引、是否 filesort/temp。

**Why**: 在优化前快速评估查询路径，避免盲目改索引。

Refs:
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
