---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_node_as_page]]"
  - "Next: [[CARDS/index__btree_page_split_minimal]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-questions-01.md (section: 为什么 InnoDB 没有使用 B 树作为索引的数据结构？)"
---

# 高扇出：让树保持矮

**Point**: 扇出可以理解成“一个节点能分出多少条路”。B+Tree 的内部节点只放索引键和指针，所以一个节点可以容纳很多分支；分支越多，同样数据量下树通常越矮。

**Why**: 不考虑缓存命中时，索引定位的主要成本来自磁盘 I/O。每层能分出更多方向，就能用更少层数覆盖更多数据，减少可能读取的页面数，进而减少查询时间。

Notes:
- 可以把内部节点想成一页目录：一页目录里能放下更多分界键，就能少翻几层目录。
- 这里不需要背公式，抓住“分支多 -> 层数少 -> 读页少”即可。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-questions-01.md (section: 为什么 InnoDB 没有使用 B 树作为索引的数据结构？)
