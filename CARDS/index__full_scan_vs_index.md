---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Prereq: [[CARDS/index__what_is_index.md]]"
  - "Next: [[CARDS/index__when_index_used.md]]"
evidence: ""
---

# 全表扫描 vs 索引访问

**Point**: 全表扫描逐行读取；索引访问先在索引定位再回表/覆盖读取，能显著减少行数。

**Why**: 判断语句是否命中索引、估算成本时的基本对比。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
