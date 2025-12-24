---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 优化器：生成执行计划

Point: 优化器根据统计信息和规则选择索引、JOIN 顺序与访问方法，输出执行计划。
Why: 计划决定访问成本与性能，理解其职责有助于解释 EXPLAIN 输出与调优方向。
Details: 评估可用索引、是否覆盖、回表成本、连接类型（如 nested loop），选择成本最小的计划；计划供执行器驱动，不直接执行。
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (#优化器)
- sources/refman-8.0-en.pdf (chapter: The Optimizer)
- sources/JavaGuide-mysql/how-sql-executed-in-mysql.md
