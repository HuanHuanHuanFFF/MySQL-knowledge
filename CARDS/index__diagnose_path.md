---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN; 5.3 Slow Query Log); sources/JavaGuide-mysql/mysql-query-execution-plan.md"
---

# 慢 SQL 索引排查路径

**Point**: 排查慢 SQL 是否和索引有关，最稳的顺序是：先定位慢语句，再看 `EXPLAIN`，再核对查询条件和索引设计，最后改写 SQL 或调整索引后复测。

**Why**: 索引问题很少靠一句“加个索引”就能解决。只有把访问路径、过滤条件和实际要读的数据范围连起来看，才知道问题到底出在没命中索引，还是读了太多无关数据。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN; 5.3 Slow Query Log)
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
