---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_balance_for_lookup]]"
  - "Next: [[CARDS/index__btree_range_lookup_start]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 等值查询：从根节点走到叶子节点

**Point**: 等值查询从根节点开始比较分界键，逐层选择子范围，最后到达可能包含目标键的叶子节点。

**Why**: `WHERE id = 18` 只需要找一个确定键。B+Tree 把“全表里找 18”变成“沿目录选择方向”，查询只需要走到对应叶子，再检查那里有没有这个键。

Notes:
```text
查 18：
        [10 | 20]
       /    |    \
    <10  [10,20)  ≥20
            |
        [10, 12, 18]
```

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
