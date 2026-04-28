---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Next: [[CARDS/index__full_scan_vs_index_scan.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3 Overview of the InnoDB Storage Engine)"
---

# 什么是索引

**Point**: 索引通常利用 B+Tree 把某些列的值按顺序组织起来，让数据库可以先按值快速定位，再去找到对应记录。

**Why**: 业务查询经常要按 `id`、状态、时间、名称这类字段做等值查找、范围查找或排序。如果每次都只能从头扫表，数据一大就会很慢。索引就是为了把“按字段值找数据”这件事做快。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3 Overview of the InnoDB Storage Engine)
