---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
evidence: ""
---

# TIMESTAMP vs DATETIME

**Point**: `TIMESTAMP` 存储 UTC 并随时区转换，受 2038 年限制；`DATETIME` 存储原值，无时区转换，范围大。

**Why**: 跨时区/需时区转换用 TIMESTAMP；长期历史/未来时间用 DATETIME 避免溢出。

Refs:
- sources/refman-8.0-en.pdf (chapter: data-types)
