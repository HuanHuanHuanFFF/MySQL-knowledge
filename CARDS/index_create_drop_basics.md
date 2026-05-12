---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/ddl_alter_table_common.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 13.1.15 CREATE INDEX; 13.1.9 DROP INDEX)"
---

# CREATE/DROP INDEX 基础

**Point**: 最基本的索引语句就是 `CREATE INDEX ...` 和 `DROP INDEX ...`；如果要建联合索引，列顺序在创建时就已经定下来，后面的使用方式也会跟着它走。

**Why**: 索引不是只会“看”，还得能有意识地创建、调整和清理；而联合索引的列顺序一旦设计错，后面的查询路径和最左前缀都会受影响。

SQL/Notes:
```sql
CREATE INDEX idx_orders_status_created_at
ON orders(status, created_at);

DROP INDEX idx_orders_status_created_at ON orders;
```

Refs:
- sources/refman-8.0-en.pdf (chapter: 13.1.15 CREATE INDEX; 13.1.9 DROP INDEX)
