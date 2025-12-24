---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_primary_key_choice.md]]"
evidence: ""
---

# UNIQUE 约束

**Point**: UNIQUE 保证列值唯一，可有多个 NULL；等同唯一索引，但主键只能有一个且不允 NULL。

**Why**: 需要唯一性但允许 NULL 时用 UNIQUE；与普通索引区别在于写入校验唯一。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
