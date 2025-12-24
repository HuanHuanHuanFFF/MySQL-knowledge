---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 查询缓存现状

Point: Server 层查询缓存在 MySQL 8.0 已移除；旧版本命中缓存才返回，否则执行后写入缓存，表有更新会使相关缓存失效。
Why: 明确现代版本不再依赖查询缓存，避免误以为有缓存命中；调优应聚焦执行计划与存储层。
Details: 缓存以 SQL 文本为 key，更新表会清空对应缓存；可通过 query_cache_type=DEMAND 关闭旧版缓存。InnoDB buffer pool 不属于此缓存。
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (#第二步-查询缓存)
- sources/JavaGuide-mysql/how-sql-executed-in-mysql.md
- sources/refman-8.0-en.pdf (chapter: Query Cache / deprecated features)
