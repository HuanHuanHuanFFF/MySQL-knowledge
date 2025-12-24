---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 观测点：连接与计划

Point: `SHOW PROCESSLIST` 查看连接与当前状态；`EXPLAIN` 展示优化器计划但不执行查询。
Why: 知道链路中的可观测手段，有助于排查卡顿（连接/锁等）或验证计划命中情况。
SQL/Notes:
```sql
SHOW PROCESSLIST;  -- 连接与命令状态
EXPLAIN FORMAT=JSON SELECT ...;  -- 查看计划
```
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (连接器 show processlist)
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
- sources/refman-8.0-en.pdf (chapter: The EXPLAIN Statement)
