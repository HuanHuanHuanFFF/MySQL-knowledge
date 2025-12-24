---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_primary_key_choice.md]]"
  - "Compare: [[CARDS/schema_unique_constraint.md]]"
evidence: ""
---

# 索引最小集

**Point**: 常用索引：普通 `INDEX`、UNIQUE；联合索引按左前缀生效，列顺序决定可用查询。

**Why**: 只保留必要索引减轻写开销；联合索引设计需结合查询条件顺序。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
