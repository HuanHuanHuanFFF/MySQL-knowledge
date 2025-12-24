---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
evidence: ""
---

# SHOW CREATE TABLE / DESC

**Point**: `SHOW CREATE TABLE t` 输出完整建表 SQL（含字符集、索引、约束）；`DESC t`/`SHOW COLUMNS FROM t` 快速查看列信息。

**Why**: 诊断表结构、校验默认/索引时的首选命令。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
