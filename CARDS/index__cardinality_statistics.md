---
type: mysql-card
tags: [mysql]
stack: ""
evidence: "sources/refman-8.0-en.pdf (chapter: 8.9.6 Index Statistics; 8.8.1 Optimizer Statistics)"
---

# 选择性与统计信息

**Point**: 优化器依赖索引基数/选择性估算过滤行数，统计过期或采样不足会导致选错索引；可用 ANALYZE TABLE 刷新。  
**Why**: 理解统计信息作用，遇到错误计划时知道检查和维护统计。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.9.6 Index Statistics; 8.8.1 Optimizer Statistics)
