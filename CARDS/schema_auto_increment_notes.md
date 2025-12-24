---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_primary_key_choice.md]]"
evidence: ""
---

# 自增主键注意

**Point**: `AUTO_INCREMENT` 仅整型主键可用，删除主键前需先移除自增属性；自增不保证无间断。

**Why**: 避免误以为连续编号；设计时接受跳号或自带分布式 ID。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
