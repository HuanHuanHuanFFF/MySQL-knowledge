---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/case_when_conditional_mapping.md]]"
evidence: ""
---

# CASE 计数/条件聚合

**Point**: 在聚合中用 `SUM(CASE WHEN cond THEN 1 ELSE 0 END)` 统计满足条件的行，支持多条件同时输出。

**Why**: 单次扫描统计多种口径，避免多次子查询。

SQL/Notes:
```sql
SELECT SUM(CASE WHEN status='paid' THEN 1 ELSE 0 END) AS paid_cnt FROM orders;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
