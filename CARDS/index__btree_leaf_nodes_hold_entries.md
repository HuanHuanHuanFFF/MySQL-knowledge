---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_internal_nodes_as_directory]]"
  - "Next: [[CARDS/index__btree_balance_for_lookup]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 叶子节点：保存最终索引项

**Point**: 叶子节点按索引键顺序保存最终索引项；查询从根走到叶子后，真正要检查和读取的就是这些条目。

**Why**: 数据库查询最后总要落到具体记录或具体索引项。把最终索引项集中放在同一层，并按键值排好顺序，可以同时服务单点命中和连续范围读取。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
