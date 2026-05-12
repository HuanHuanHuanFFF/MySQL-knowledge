---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_overview_shape]]"
  - "Prereq: [[CARDS/index__btree_leaf_link_for_range_scan]]"
  - "Next: [[CARDS/index__bplus_tree_vs_hash_and_binary]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树); sources/JavaGuide-mysql/mysql-questions-01.md (section: 为什么 InnoDB 没有使用 B 树作为索引的数据结构？)"
---

# B+Tree 和 B-Tree 差在哪？

![[assets/mysql/btree/b_tree.png]]

**Point**: B-Tree 的键和记录可以分布在内部节点、叶子节点；B+Tree 更强调内部节点只做目录，最终记录集中在叶子层，叶子节点再按顺序相连。

**Why**: 数据库索引不只查一个值，还经常要从某个起点继续向后扫一段。B+Tree 把记录集中到有序叶子层后，范围扫描可以先定位起点，再沿叶子链连续读取，而不是在树的不同层之间来回找记录。

Notes:
- B-Tree 也适合查找，但记录可能出现在内部节点，范围扫描更依赖树上的遍历。
- B+Tree 的内部节点更像目录页：少放记录，多放分界键和指针。
- 对 InnoDB 这种以页为读写单位的存储结构，目录层更矮、叶子层连续，和查询路径更贴合。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
- sources/JavaGuide-mysql/mysql-questions-01.md (section: 为什么 InnoDB 没有使用 B 树作为索引的数据结构？)
