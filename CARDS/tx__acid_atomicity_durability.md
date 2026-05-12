---
type: mysql-card
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__transaction_as_one_unit]]"
  - "Next: [[CARDS/tx__acid_consistency_boundary]]"
evidence: "sources/JavaGuide-mysql/mysql-questions-01.md; sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md"
---

# 事务失败前后，数据库分别要兜住什么？

**Point**: A 和 D 都围绕提交边界：提交前失败要撤回，提交后故障要保住。

**Why**: `COMMIT` 是数据库对这组修改的确认。确认前失败，半成品不能留下；确认后故障，已经答应成功的结果不能丢。

Refs:
- sources/JavaGuide-mysql/mysql-questions-01.md (section: ACID)
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md (section: 事务的特性)
