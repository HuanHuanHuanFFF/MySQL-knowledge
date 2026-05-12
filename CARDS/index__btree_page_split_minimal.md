---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__btree_balance_for_lookup]]"
  - "Next: [[CARDS/index__btree_sequential_primary_key]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics); sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)"
---

# 页分裂：满页插入的最小模型

**Point**: B+Tree 插入新键时要保持有序；如果目标叶子页已经放满，就把它拆成两个页，并把新的分界键向上一层传播。

**Why**: 索引不能因为插入而失去有序性，也不能让一个页无限变大。页分裂是在“保持顺序”和“维持固定页大小”之间的基本维护动作，它让树还能继续作为可查询的有序目录。

Notes:
- 插入先定位到目标叶子页，再把新键放到正确位置。
- 如果叶子页满了，拆成两个页，上层目录需要新增或调整分界键。
- 如果上层也满了，分裂可能继续向上传播。
- 本卡只保留最小分裂模型，不展开其他维护机制或页格式细节。

```text
插入 18 前：

        [10 | 30]
           |
     [12 | 15 | 20]   <- 目标叶子页已满

插入 18 后：

        [10 | 18 | 30]   <- 上层新增/调整分界键 (上层也可能继续分裂)
           |      |
      [12 | 15] [18 | 20] <- 原叶子页拆成两个页
```

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
- sources/JavaGuide-mysql/mysql-index.md (section: B 树& B+ 树)
