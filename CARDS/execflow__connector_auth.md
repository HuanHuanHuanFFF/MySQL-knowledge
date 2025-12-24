---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 连接器：建立连接与权限缓存

Point: 连接器先完成 TCP 握手、账号密码认证，读取当前用户权限并缓存于连接生命周期；后续权限判断基于建立连接时的快照。
Why: 理解权限在连接级缓存，解释为何改权限需重连才生效；连接管理也影响资源占用（长/短连接、超时）。
Details: 连接时若认证失败立即拒绝；wait_timeout 控制空闲连接回收；max_connections 控制并发连接上限；已建立连接不受中途权限变更影响，需要新连接才读取新权限。
SQL/Notes:
```sql
SHOW PROCESSLIST;        -- 查看当前连接
SHOW VARIABLES LIKE 'wait_timeout';
```
Refs:
- sources/xiaolincoding__mysql__select_execution_flow.html (#第一步-连接器)
- sources/JavaGuide-mysql/how-sql-executed-in-mysql.md
- sources/refman-8.0-en.pdf (chapter: Connection Management)
