---
type: mysql-card
stack: "[[STACKS/stack__join_core.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/join_inner_vs_left.md]]"
  - "Next: [[CARDS/join_left_turns_inner.md]]"
evidence: ""
---

# LEFT JOIN: ON vs WHERE 过滤

**Point**: 左连接的匹配条件放 ON；要保留左表全部行的过滤也放 ON。放 WHERE 的条件会在连接后过滤，可能把右表为 NULL 的行去掉。

**Why**: 过滤位置不同会改变是否保留左表行，避免把 LEFT JOIN 变成 INNER。

Refs:
- sources/sql-question/sql-syntax-summary.md
