---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
related:
  - "Prereq: [[CARDS/ddl_alter_table_common.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 13.1.15 CREATE INDEX; 13.1.9 DROP INDEX)"
---

# CREATE/DROP INDEX 基础

**Point**: 创建索引：`CREATE [UNIQUE] INDEX idx ON t(col1[,col2]);`；删除：`DROP INDEX idx ON t;`，联合索引列顺序决定最左前缀。  
**Why**: 掌握基本 DDL 才能按需新增或清理索引。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 13.1.15 CREATE INDEX; 13.1.9 DROP INDEX)
