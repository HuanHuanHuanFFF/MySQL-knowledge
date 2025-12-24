---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/index__full_scan_vs_index.md]]"
  - "Next: [[CARDS/explain_select_basics.md]]"
evidence: ""
---

# 何时会用到索引

**Point**: 等值/范围条件、前缀 LIKE、ORDER BY/GROUP BY 兼容索引前缀可用索引；函数/类型不匹配/前缀通配常导致索引失效。

**Why**: 编写条件时预判是否走索引，避免落入全表扫描。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
