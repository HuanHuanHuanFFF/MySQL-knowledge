---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__index_core]]"
related: []
evidence: "sources/refman-8.0-en.pdf (chapter: The Optimizer); sources/xiaolincoding__mysql__select_execution_flow.html"
---

# 优化器：生成执行计划

Point: 优化器根据统计信息评估可用索引、是否覆盖、回表成本与连接顺序，选择成本最低的执行计划供执行器驱动。  
Why: 理解优化器决策可解释 EXPLAIN 输出与索引选择，指导调优。  
Refs:
- sources/refman-8.0-en.pdf (chapter: The Optimizer)
- sources/xiaolincoding__mysql__select_execution_flow.html
