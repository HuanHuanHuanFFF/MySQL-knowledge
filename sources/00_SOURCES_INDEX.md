# Sources Nav

## Start Here
- [[sources/reading_queue]] — 不知道先看什么时，从这里按主线进入。
- [[sources/mysql_manual_links]] — 官方手册入口，负责兜底定义、边界和版本差异。
- [[sources/javaguide_map]] — JavaGuide 材料地图，适合快速找到现成解释源。

## Source Priority
- [[sources/refman-8.0-en.pdf]] — 冲突时以官方手册为准；适合确认隔离级别、MVCC、锁、索引、`EXPLAIN`、窗口函数、数据类型等边界。
- [[sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes]]、[[sources/javaguide_map]] — 适合先建第一层理解，再回手册校正。
- [[sources/sql-question/sql-syntax-summary]]、`sql-questions-01~05` — 适合 SQL 基础、JOIN、GROUP BY、题型例子与常见坑。
- [[sources/xiaolincoding__mysql__select_execution_flow.html]] — 适合执行流程第一层图景，不作为官方兜底。

## By Topic

### SQL Basics / JOIN / GROUP BY
- [[sources/sql-question/sql-syntax-summary]] — 基础 SQL 总表；做 `SQL Basics`、`Join`、`Group & Aggregate` 时先查这里。
- [[sources/sql-question/sql-questions-01]] ~ [[sources/sql-question/sql-questions-05]] — 题型化材料；需要补例子、题感或高频问法时再翻。
- [[sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes]] — 适合补 `SELECT` 骨架、逻辑执行顺序、DDL/DML、常用函数与元数据查看。

### Schema / Data Types
- [[sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes]] — 建表、约束、`SHOW CREATE TABLE`、`DESC` 这类基础入口。
- [[sources/JavaGuide-mysql/some-thoughts-on-database-storage-time]] — 专门解决 `TIMESTAMP` / `DATETIME` / 字符串存时间的取舍。
- [[sources/refman-8.0-en.pdf]] — 数据类型与 DDL 语法的最终兜底。

### Execution Flow / EXPLAIN
- [[sources/xiaolincoding__mysql__select_execution_flow.html]] — 适合建立“一条 `SELECT` 要经过哪些阶段”的第一层图。
- [[sources/JavaGuide-mysql/how-sql-executed-in-mysql]] — 执行链路的文字版说明，方便抽卡和回看。
- [[sources/JavaGuide-mysql/mysql-query-execution-plan]] — 读 `EXPLAIN`、排查计划与慢 SQL 时先看这篇。
- [[sources/refman-8.0-en.pdf]] — 用来确认 optimizer、protocol、`EXPLAIN` 的官方边界。

### Index / Query Optimization
- [[sources/JavaGuide-mysql/mysql-index]] — 索引主线入口：B+Tree、聚簇/二级、联合/覆盖、选择性。
- [[sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion]] — 专门处理“有索引但不走”的典型坑。
- [[sources/JavaGuide-mysql/mysql-auto-increment-primary-key-continuous]] — 主键 / 自增补充材料。
- [[sources/JavaGuide-mysql/mysql-high-performance-optimization-specification-recommendations]] — 更偏工程习惯与设计建议，适合后面再读。
- [[sources/refman-8.0-en.pdf]] — 真正确认 B-Tree、主键优化、`ORDER BY` 优化、统计信息、慢日志与 `EXPLAIN` 时回这里。

### Transaction / MVCC / Lock
- [[sources/JavaGuide-mysql/transaction-isolation-level]] — 四个隔离级别与并发现象的第一层入口。
- [[sources/JavaGuide-mysql/innodb-implementation-of-mvcc]] — `MVCC / Read View / 快照读 / 当前读` 的主补充源。
- [[sources/JavaGuide-mysql/mysql-questions-01]] — 适合补默认隔离级别、脏读/幻读等高频问法。
- [[sources/refman-8.0-en.pdf]] — 冲突时以 `Transaction Isolation Levels`、`Consistent Nonlocking Reads`、`Locking Reads` 为准。

### Future Topics
- [[sources/JavaGuide-mysql/mysql-logs]] — redo / binlog / undo，留给后面的日志主线。

## Current Coverage Mapping
- 当前 `SQL Basics` / `Join` / `Group & Aggregate` 主要依赖 `sql-question` 系列。
- 当前 `Schema Basics` 主要依赖 `一千行 MySQL 学习笔记` + 手册数据类型章节。
- 当前 `Select Execution Flow` 主要依赖 `小林coding + how-sql-executed-in-mysql + refman`.
- 当前 `Index Core` 主要依赖 `mysql-index + mysql-query-execution-plan + refman`.
- 当前 `Tx / MVCC / Locks` 主要依赖 `transaction-isolation-level + innodb-implementation-of-mvcc + refman`.
