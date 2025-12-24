---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/insert_basic_patterns.md]]"
evidence: ""
---

# INSERT 列清单与默认值

**Point**: 缺省列值遵循默认或 NULL；未列出的 NOT NULL 列无默认时会报错，显式列清单可避免顺序错位。

**Why**: 变更表结构后旧 SQL 可能错位或命中 NOT NULL 约束，插入前需确认默认值。

SQL/Notes:
```sql
INSERT INTO t (col_a) VALUES ('x'); -- 其他列走默认/NULL
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
