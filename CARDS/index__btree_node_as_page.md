---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Prereq: [[CARDS/index__innodb_page_minimal]]"
  - "Next: [[CARDS/index__btree_high_fanout]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; glossary: page); sources/JavaGuide-mysql/mysql-questions-01.md (section: MyISAM 和 InnoDB 有什么区别？)"
---

# B+Tree 节点为什么常被看成一页？

**Point**: B+Tree 的一个节点可以先理解成一个页：页里放一组有序 key 和指向下一层的指针。

**Why**: 这样就能把树高和查询成本连起来：从根走到叶子经过的节点越多，查询路径上可能访问的页面也越多。

Notes:
- 这一页只建立成本模型，不展开页头、槽目录、记录格式。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics; glossary: page)
- sources/JavaGuide-mysql/mysql-questions-01.md (section: MyISAM 和 InnoDB 有什么区别？)
