---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/insert_from_select.md]]"
evidence: ""
---

# INSERT 基本写法

**Point**: 单行/多行插入：`INSERT INTO tbl (cols) VALUES (...), (...);`，列顺序按列清单，缺省列用默认值或允许 NULL。

**Why**: 显式列清单可避免字段顺序变动导致错位或 NULL 违约。

SQL/Notes:
```sql
INSERT INTO users (id, name) VALUES (1,'a'), (2,'b');
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
