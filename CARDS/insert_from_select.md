---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/insert_basic_patterns.md]]"
  - "Compare: [[CARDS/insert_null_default_checks.md]]"
evidence: ""
---

# INSERT ... SELECT 迁移

**Point**: `INSERT INTO tgt (cols) SELECT ... FROM src ...` 将查询结果写入目标表，列数/类型需匹配。

**Why**: 用于批量迁移或生成派生数据，比应用侧循环插入高效。

SQL/Notes:
```sql
INSERT INTO archive (id, name)
SELECT id, name FROM users WHERE active = 0;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
