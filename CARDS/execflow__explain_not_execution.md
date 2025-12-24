---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# EXPLAIN 只展示计划不等于真实执行

Point: EXPLAIN 解析和优化语句后输出计划，不实际执行查询；最终执行可能因统计信息变化/参数不同与 EXPLAIN 有差异。

Why: 调试时需结合真实运行与慢日志验证，不可仅凭 EXPLAIN 推断耗时或锁行为。

Refs:
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
- sources/refman-8.0-en.pdf (chapter: The EXPLAIN Statement)
- sources/xiaolincoding__mysql__select_execution_flow.html (执行器与计划说明)
