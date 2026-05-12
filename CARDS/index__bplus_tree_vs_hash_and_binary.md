---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__bplus_tree_vs_btree]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (sections: Hash 表; 二叉查找树（BST）; 红黑树; B 树& B+ 树); sources/JavaGuide-mysql/mysql-questions-01.md (sections: 为什么 InnoDB 没有使用哈希作为索引的数据结构？; 为什么 InnoDB 没有使用 B 树作为索引的数据结构？)"
---

# B+Tree 为什么比 Hash、二叉树更适合通用数据库索引？

**Point**: Hash 适合等值定位，但会打散顺序；二叉树、红黑树每个节点分支少，数据量大时树高和页访问路径不如多路 B+Tree 友好。

**Why**: 数据库索引要同时照顾等值查找、范围扫描和按键顺序读取。B+Tree 保留键的有序性，又通过多路分支压低树高，比只擅长等值的 Hash、分支较少的二叉树类结构更适合作为默认索引结构。

Notes:
- Hash 的强项是根据 key 快速定位；弱点是哈希后相邻值不再相邻，范围扫描和按键顺序读取都不自然。
- 二叉树、红黑树每层最多向少数方向分支；数据量很大时，层数更容易变多，可能带来更多页面访问。
- B+Tree 的取舍是：保留有序结构，同时让一个节点容纳更多分支，减少从根到叶的层数。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (sections: Hash 表; 二叉查找树（BST）; 红黑树; B 树& B+ 树)
- sources/JavaGuide-mysql/mysql-questions-01.md (sections: 为什么 InnoDB 没有使用哈希作为索引的数据结构？; 为什么 InnoDB 没有使用 B 树作为索引的数据结构？)
