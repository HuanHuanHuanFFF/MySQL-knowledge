---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_equality_lookup_walkthrough]]"
  - "Next: [[CARDS/index__btree_leaf_link_for_range_scan]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 范围查询：先找到起点

**Point**: 范围查询先从根走到叶子，定位范围起点，然后从这个位置开始继续顺序读取。

**Why**: `BETWEEN 10 AND 20` 要的是一段连续区间。B+Tree 先用目录能力跳过范围之前的索引项，再把后续工作交给叶子层顺序扫描。

Notes:
- 图里的 `22~40` 范围查询就是先找到 `[22 | 25 | 27]` 这个起点叶子，再沿叶子链向右读。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
