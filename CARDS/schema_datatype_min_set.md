---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/schema_primary_key_choice.md]]"
evidence: ""
---

# 数据类型最小集选择

**Point**: 常用：`INT/BIGINT` 数值；`DECIMAL(p,s)` 精确小数；`VARCHAR` 可变长字符串；`TEXT` 长文本；`DATETIME` 跨时区存时间点；`TIMESTAMP` 受时区、2038 限制。

**Why**: 依据容量/精度/时区需求选型，避免过大类型或受限时间戳。

Refs:
- sources/refman-8.0-en.pdf (chapter: data-types)
