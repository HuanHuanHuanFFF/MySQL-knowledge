---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_range_lookup_start]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 叶子链：让范围扫描连续发生

**Point**: B+Tree 的叶子节点按键值顺序相连；范围查询定位起点后，可以沿着叶子链一直读到范围结束。

**Why**: 范围查询的结果在索引顺序上通常是一段连续条目。叶子链把这些相邻条目接起来，数据库不用每读一个值都重新从根节点定位下一项。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
