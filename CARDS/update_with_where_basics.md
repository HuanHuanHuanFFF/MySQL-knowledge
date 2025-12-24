---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/insert_basic_patterns.md]]"
  - "Next: [[CARDS/update_index_lock_reminder.md]]"
evidence: ""
---

# UPDATE 必带 WHERE

**Point**: `UPDATE tbl SET col = ... WHERE 条件;` 未带 WHERE 将全表更新；影响行数由匹配行决定。

**Why**: 避免误删式全表更新；上线前确认 WHERE 命中范围。

SQL/Notes:
```sql
UPDATE orders SET status='paid' WHERE id=123;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
