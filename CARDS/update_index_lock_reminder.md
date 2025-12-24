---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/update_with_where_basics.md]]"
evidence: ""
---

# UPDATE 与索引/锁提醒

**Point**: WHERE 未命中索引会全表扫描并加锁更多行；精确主键/索引过滤可缩小锁范围。

**Why**: 避免大面积锁表或慢查询，更新前确认索引可用。

SQL/Notes:
```sql
UPDATE orders SET status='paid'
WHERE id = 123;  -- 主键等值命中
```

Refs:
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
