---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_lock.md]]"
tags: [mysql, tx]
related:
  - "Prereq: [[CARDS/tx__dirty_read.md]]"
  - "Next: [[CARDS/tx__phantom_read.md]]"
evidence: ""
---

# 为什么同一行两次查询会变？

**Point**: 不可重复读是同一事务里前后两次读“同一行”，结果却不同，因为中间有别的事务提交了修改。

**Why**: 这里的核心是“同一行的值变了”；事务内读视图不稳定，就难以做可靠比较。

Example: T1 先读 `A=20`；T2 提交后改成 `A=19`；T1 再读同一行时看到 19。


Refs:
- sources/refman-8.0-en.pdf (chapter: glossary, non-repeatable read)
- sources/JavaGuide-mysql/mysql-questions-01.md
