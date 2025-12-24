---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
  - "Next: [[CARDS/schema_auto_increment_notes.md]]"
evidence: ""
---

# 主键选择原则

**Point**: PRIMARY KEY 唯一标识行，推荐整型自增或雪花等稳定、短、单列键；避免频繁更新的业务字段。

**Why**: 聚簇索引依赖主键，选择稳定短键可减少页分裂和二级索引存储。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
