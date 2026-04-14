---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/update_with_where_basics.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.2.2 Optimizing UPDATE Statements); sources/JavaGuide-mysql/mysql-query-execution-plan.md"
---

# UPDATE 与索引/锁提醒

**Point**: WHERE 未命中索引会全表扫描并锁定更多行；精确主键/索引过滤可缩小锁范围并减少行访问。  
**Why**: 更新前确认索引可用，避免大面积锁表或慢查询。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.2.2 Optimizing UPDATE Statements)
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
