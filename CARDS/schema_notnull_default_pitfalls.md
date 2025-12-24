---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
evidence: ""
---

# NOT NULL / DEFAULT 常见坑

**Point**: NOT NULL 列若无 DEFAULT 插入需提供值；DEFAULT 仅在缺省时生效，显式插入 NULL 会报错（若 NOT NULL）。

**Why**: 表结构变更后旧 SQL 可能因缺默认或 NULL 被拒，需同步列清单或补默认。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
