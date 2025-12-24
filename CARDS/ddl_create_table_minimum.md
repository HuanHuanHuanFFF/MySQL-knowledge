---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/ddl_alter_table_common.md]]"
evidence: ""
---

# CREATE TABLE 最小写法

**Point**: 定义列/类型/约束，常用：`CREATE TABLE t (id INT PRIMARY KEY, name VARCHAR(50) NOT NULL, created_at DATETIME DEFAULT CURRENT_TIMESTAMP);`

**Why**: 新表需明确主键、非空、默认，避免后续频繁调整。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
