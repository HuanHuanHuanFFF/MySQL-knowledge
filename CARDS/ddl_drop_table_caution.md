---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/ddl_create_table_minimum.md]]"
evidence: ""
---

# DROP TABLE 注意

**Point**: `DROP TABLE [IF EXISTS] t;` 直接删除表及数据，无法回滚；删除前应确认备份。

**Why**: 结构级删除风险高，优先用备份或改名再清理。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
