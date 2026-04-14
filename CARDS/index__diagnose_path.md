---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN; 5.3 Slow Query Log); sources/JavaGuide-mysql/mysql-query-execution-plan.md"
---

# 慢 SQL 索引排查路径

**Point**: 排查慢 SQL：先确认慢日志/复现语句→EXPLAIN 看 type/key/rows/Extra→核对谓词是否可索引、统计是否新→调整索引或改写再验证。  
**Why**: 给出可重复的诊断步骤，避免盲目建索引或改语句。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.8.1 Using EXPLAIN; 5.3 Slow Query Log)
- sources/JavaGuide-mysql/mysql-query-execution-plan.md
