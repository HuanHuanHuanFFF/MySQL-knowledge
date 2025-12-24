---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/ddl_alter_table_common.md]]"
evidence: ""
---

# CREATE/DROP INDEX 基本

**Point**: 建索引：`CREATE [UNIQUE] INDEX idx ON t(col1[,col2]);`；删索引：`DROP INDEX idx ON t;`。联合索引按左前缀生效。

**Why**: 选定列顺序决定可用查询，删除不用的索引减轻写开销。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
