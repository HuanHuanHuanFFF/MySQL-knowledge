# JavaGuide Map

## 总览
- [[sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes]] — 基础总表；做 `SQL Basics`、`Schema Basics`、常用 DDL/DML、元数据查看时先查它。
- [[sources/JavaGuide-mysql/mysql-questions-01]] — 问答型补充材料；适合补高频面试问法，但不作为官方兜底。

## SQL 基础 / Schema
- [[sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes]]
  - 我看它是为了解决：`SELECT` 骨架、逻辑执行顺序、常用函数、建表与基础运维操作。
- [[sources/JavaGuide-mysql/some-thoughts-on-database-storage-time]]
  - 我看它是为了解决：`TIMESTAMP` / `DATETIME` / 字符串存时间的取舍。
- [[sources/JavaGuide-mysql/mysql-auto-increment-primary-key-continuous]]
  - 我看它是为了解决：自增主键、连续性、主键选型补充。
- [[sources/JavaGuide-mysql/mysql-high-performance-optimization-specification-recommendations]]
  - 我看它是为了解决：更偏工程习惯的 schema / index 设计建议，适合后面再读，不是第一入口。

## Execution Flow / EXPLAIN
- [[sources/JavaGuide-mysql/how-sql-executed-in-mysql]]
  - 我看它是为了解决：连接器、解析器、优化器、执行器、存储引擎边界的连续叙述。
- [[sources/JavaGuide-mysql/mysql-query-execution-plan]]
  - 我看它是为了解决：`EXPLAIN` 怎么读、执行计划里常见字段是什么意思。
- [[sources/JavaGuide-mysql/mysql-query-cache]]
  - 我看它是为了解决：旧版查询缓存的背景，解释为什么 MySQL 8.0 已移除它。

## Index / Query Optimization
- [[sources/JavaGuide-mysql/mysql-index]]
  - 我看它是为了解决：索引主线的第一层模型，覆盖 B+Tree、联合索引、覆盖索引、回表、选择性。
- [[sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion]]
  - 我看它是为了解决：隐式转换导致索引失效这种常见实战坑。
- [[sources/JavaGuide-mysql/mysql-query-execution-plan]]
  - 我看它是为了解决：索引问题排查时如何配合 `EXPLAIN`。

## Transaction / MVCC
- [[sources/JavaGuide-mysql/transaction-isolation-level]]
  - 我看它是为了解决：四个隔离级别、脏读 / 不可重复读 / 幻读的第一层理解。
- [[sources/JavaGuide-mysql/innodb-implementation-of-mvcc]]
  - 我看它是为了解决：MVCC、Read View、快照读 / 当前读、隐藏列和 `undo log` 的关系。
- [[sources/JavaGuide-mysql/mysql-questions-01]]
  - 我看它是为了解决：默认隔离级别、并发现象这些高频追问的问答视角。

## Logs / Future Advanced
- [[sources/JavaGuide-mysql/mysql-logs]]
  - 我看它是为了解决：redo / binlog / undo、两阶段提交、崩溃恢复；留给后面的日志主线。

## 什么时候优先看 JavaGuide
- 需要先搭一层可读解释，再决定抽哪些 `CARD`。
- 想快速知道某个主题里常见的“会问什么 / 会踩什么坑”。
- 已经知道要看哪条主线，但还不想直接扎进手册。

## 什么时候不要只看 JavaGuide
- 需要确认官方定义、边界或版本差异时。
- 准备写事务、锁、索引语义这类更容易说错的内容时。
- 发现 JavaGuide 结论和仓库现有 `CARD` 不完全一致时。
