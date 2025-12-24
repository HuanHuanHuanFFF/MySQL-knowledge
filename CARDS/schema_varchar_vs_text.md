---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/schema_datatype_min_set.md]]"
evidence: ""
---

# VARCHAR vs TEXT

**Point**: `VARCHAR` 适合中短文本，可建索引并参与行内存储；`TEXT` 存长文本，索引需前缀限制。

**Why**: 优先 VARCHAR 以便索引/高效存取，只有内容超长才用 TEXT。

Refs:
- sources/refman-8.0-en.pdf (chapter: data-types)
