---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__schema_basics]]"
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
  - "Next: [[CARDS/schema_auto_increment_notes.md]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization)"
---

# 主键选择原则

**Point**: PRIMARY KEY 唯一标识行，推荐稳定、短的单列整数（自增/分布式）；避免频繁更新的业务列。  
**Why**: 聚簇索引依赖主键，主键越稳定越能减少页分裂和二级索引存储。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.2 Primary Key Optimization)
