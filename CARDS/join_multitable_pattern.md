---
type: mysql-card
stack: "[[STACKS/stack__join_core.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/join_inner_vs_left.md]]"
  - "Next: [[CARDS/join_left_turns_inner.md]]"
evidence: ""
---

# 多表 JOIN 基本模式

**Point**: 每表取别名，逐个写出连接条件：`FROM a JOIN b ON a.id=b.a_id JOIN c ON b.c_id=c.id`，避免笛卡尔积。

**Why**: 清晰的别名和 ON 条件确保连接正确，方便扩展更多表。

Refs:
- sources/sql-question/sql-syntax-summary.md
