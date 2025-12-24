---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/ddl_create_table_minimum.md]]"
  - "Next: [[CARDS/index_create_drop_basics.md]]"
evidence: ""
---

# ALTER TABLE 常用操作

**Point**: 常用子句：`ADD COLUMN`、`MODIFY COLUMN`、`DROP COLUMN`、`ADD INDEX/UNIQUE`。

**Why**: 结构变更最常用的四类动作，注意在低峰执行并备份。

SQL/Notes:
```sql
ALTER TABLE t ADD COLUMN status TINYINT DEFAULT 0;
ALTER TABLE t ADD INDEX idx_created(created_at);
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
