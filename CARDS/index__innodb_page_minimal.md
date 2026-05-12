---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__btree_deep_dive]]"
related:
  - "Next: [[CARDS/index__btree_node_as_page]]"
evidence: "sources/JavaGuide-mysql/mysql-logs.md (keywords: 数据页; 16KB); sources/refman-8.0-en.pdf (glossary: page)"
---

# 页：数据库读写的一块数据

**Point**: 页是 InnoDB 管理和读写数据的基本单位；查询一条记录时，数据库通常会把记录所在的数据页加载出来。

**Why**: 磁盘和缓存不适合一个字段、一个 key 地零散读写。按页组织数据后，数据库可以一次读入一块相关数据，再在内存里继续查找和处理。

Notes:
- 这里先把页理解成“一块数据”，不展开页头、槽目录、记录格式。

Refs:
- sources/JavaGuide-mysql/mysql-logs.md
- sources/refman-8.0-en.pdf (glossary: page)
