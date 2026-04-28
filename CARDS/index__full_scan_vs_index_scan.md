---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/index__what_is_index.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# 全表扫描和索引扫描，差别到底在哪？

**Point**: 全表扫描是把整张表里的行一条条看过去；索引扫描是先用索引缩小查找范围，再去访问更少的记录。

**Why**: 索引真正带来的收益不是“凭空变快”，而是少读很多无关数据。能先把范围缩小，后面真正要看、要取、要比较的记录就会少很多。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
