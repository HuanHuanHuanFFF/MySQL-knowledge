---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_page_split_minimal]]"
evidence: "sources/JavaGuide-mysql/mysql-index.md (sections: B 树& B+ 树; primary key design note); sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# 顺序主键：让写入更接近追加

**Point**: 对 InnoDB 主键索引来说，递增或大体顺序的主键通常更适合 B+Tree 写入，因为新记录更容易落到索引右侧的新位置。

**Why**: 如果主键值随机分布，新记录可能频繁插入到中间叶子页，带来更多页内移动和页分裂压力。顺序主键把多数写入集中到末端附近，减少随机插入到中间页的概率，但不会消除所有页分裂。

Notes:
- 这解释的是主键取值顺序对 B+Tree 维护成本的影响。
- 递增主键仍然可能在末端页满时触发分裂。
- 本卡只解释写入顺序和页维护压力，不展开后续索引类型或查询返回路径。

Refs:
- sources/JavaGuide-mysql/mysql-index.md (sections: B 树& B+ 树; primary key design note)
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
