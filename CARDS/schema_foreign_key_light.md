---
type: mysql-card
stack: "[[STACKS/stack__schema_basics.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/schema_index_minimal.md]]"
evidence: ""
---

# FOREIGN KEY 简述

**Point**: 外键维护父子一致性，可定义 `FOREIGN KEY (col) REFERENCES parent(pk)`；部分团队为解耦/性能选择不用，改为应用侧校验。

**Why**: 评估业务需求与维护成本，开启外键可防止孤儿记录，但会增加写时检查与锁竞争。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
