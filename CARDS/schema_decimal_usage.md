---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
evidence: ""
---

# DECIMAL 使用场景

**Point**: 金额/精确小数用 `DECIMAL(p,s)`，避免 FLOAT/DOUBLE 误差；注意精度过高占用存储。

**Why**: 财务等需要确定小数精度，避免二进制浮点引发舍入问题。

Refs:
- sources/refman-8.0-en.pdf (chapter: data-types)
