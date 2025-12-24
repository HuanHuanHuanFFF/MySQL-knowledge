---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 预处理：对象与类型检查

Point: 预处理阶段基于解析树检查表/列存在性、权限、类型匹配，并展开 `*` 为具体列。
Why: 早期校验能在生成计划前发现对象不存在或列类型不匹配等问题，减少后续无效优化。
Details: 核实表/列元数据、检查列权限、验证函数/表达式类型一致性；失败则终止执行并报错。
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (#预处理器)
- sources/refman-8.0-en.pdf (chapter: SQL Statements / Preparation)
- sources/JavaGuide-mysql/how-sql-executed-in-mysql.md
