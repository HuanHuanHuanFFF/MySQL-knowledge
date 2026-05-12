---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_leaf_nodes_hold_entries]]"
  - "Next: [[CARDS/index__btree_equality_lookup_walkthrough]]"
  - "Next: [[CARDS/index__btree_page_split_minimal]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 平衡：让查询路径稳定

**Point**: B+Tree 的平衡指的是所有查询最终都走到同一层叶子节点，路径长度大体稳定。

**Why**: 数据库索引不能让某些值查得快、某些值绕很远。B+Tree 会在插入、删除后通过节点分裂、合并或重分配来维护结构，让树不要退化成很长的单边路径。

Notes:
- 插入导致节点放不下时，节点可能分裂，并把新的分界键向上调整。
- 删除导致节点太空时，可能和相邻节点合并或重新分配。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
