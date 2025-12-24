---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/index__full_scan_vs_index.md]]"
evidence: ""
---

# 什么是索引

**Point**: 索引是按排序结构（B+树等）存放的快速定位数据方式，减少 I/O；主键/唯一/普通索引都建立在列上。

**Why**: 理解索引是查询加速的核心，后续设计与排查都基于此。

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
