---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 执行器与存储引擎分工

Point: Server 层执行器按计划调用存储引擎接口取数；存储引擎负责索引/数据访问与返回记录。
Why: 清楚层次分工便于判断问题归因：计划/SQL 在 Server 层，数据读写与缓冲在引擎层。
Details: 执行器遍历计划步骤（索引查找、回表等），通过 handler API 请求引擎；InnoDB 负责页缓存、索引结构与锁，Server 层处理解析、优化、权限、函数等跨引擎逻辑。
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (Server 层 vs 引擎层描述)
- sources/refman-8.0-en.pdf (chapter: The MySQL Server and Storage Engines)
- sources/JavaGuide-mysql/how-sql-executed-in-mysql.md
