---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_overview_shape]]"
  - "Next: [[CARDS/index__btree_leaf_nodes_hold_entries]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 内部节点：只负责指路

**Point**: 内部节点主要保存分界键和指向下一层的指针，作用是把查询导向更小的键值范围。

**Why**: 数据库表很大时，上层结构越轻，越适合承担“目录”角色。内部节点不处理完整数据，只负责分路，查询就能先把大范围切成小范围，再交给叶子节点处理最终索引项。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
