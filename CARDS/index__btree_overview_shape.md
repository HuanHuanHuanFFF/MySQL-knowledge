---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Next: [[CARDS/index__btree_internal_nodes_as_directory]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# B+Tree 大概长什么样？

![[assets/mysql/btree/bplus_tree.png]]

**Point**: B+Tree 可以先看成一棵多层有序树：上层节点负责导航，叶子节点保存最终索引项，并按顺序连接起来。

**Why**: MySQL 索引既要支持单点定位，也要支持范围扫描。B+Tree 把“从上往下定位”和“在叶子层横向顺扫”放进同一个结构里。

- 顶层和中间层是 internal nodes：保存分界键和指向下一层的指针，作用像目录。
- 底层是 leaf nodes：保存最终索引项。
- 叶子节点按索引键有序排列，并且相互连接。
- 查一个值时，从根节点向下走到叶子；查范围时，先定位起点，再沿叶子链继续扫描。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
