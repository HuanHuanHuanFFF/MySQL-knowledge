---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 解析器：词法语法与语法树

Point: 解析器先做词法分析识别关键字/标识符，再做语法分析校验 SQL 语法并生成语法树；语法错误在此阶段报出。
Why: 语法树是后续检查与优化的输入，理解解析阶段可定位语法类错误发生点。
Details: 仅检查语法结构，不验证表/列存在；生成的 AST 提供语句类型、表名、字段、条件等结构供后续阶段使用。
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (#第三步-解析 SQL, #解析器)
- sources/JavaGuide-mysql/how-sql-executed-in-mysql.md
- sources/refman-8.0-en.pdf (chapter: SQL Syntax / Parser)
