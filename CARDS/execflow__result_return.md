---
type: mysql-card
stack: "[[STACKS/stack__select_execution_flow.md]]"
tags: [mysql]
related: []
evidence: ""
---

# 结果返回流程

Point: 执行器获取结果行后按客户端协议序列化并通过连接返回，直到读完或客户端中断。
Why: 了解结果传输阶段便于解释大结果集对网络/客户端的影响，以及为何连接断开会中止传输。
Details: 行经由 Server 层写入 socket，客户端按协议解析；逐行发送可在客户端提前停止以减轻服务器负载。
Refs:
- sources/refman-8.0-en.pdf (chapter: MySQL Client/Server Protocol)
- sources/xiaolincoding__mysql__select_execution_flow.html (执行器输出描述)
