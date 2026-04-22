# MySQL Manual Links

## 用法
- 这是官方兜底页：当 JavaGuide、题解材料和仓库现有结论冲突时，以 [[sources/refman-8.0-en.pdf]] 为准。
- 本地来源是 PDF，不能直接跳章节；打开 PDF 后按下面的 section name 搜索。
- 抽 `CARD` 时通常先用 JavaGuide / `sql-question` 建第一层理解，再回手册确认边界。

## 事务 / MVCC / 锁
- `17.7.2.1 Transaction Isolation Levels`
  - 我看它是为了解决：确认四个隔离级别、默认值、异常边界，不把标准定义和 InnoDB 实现混在一起。
- `17.7.2.3 Consistent Nonlocking Reads`
  - 我看它是为了解决：快照读、一致性读、Read View 的官方边界。
- `17.7.2.4 Locking Reads`
  - 我看它是为了解决：`FOR UPDATE`、`LOCK IN SHARE MODE` 这类当前读与加锁读的行为。
- `InnoDB Multi-Versioning`
  - 我看它是为了解决：MVCC 的总说明，以及它为什么能让普通读少等锁。

## 索引 / 查询计划
- `8.3.1 B-Tree Index Characteristics`
  - 我看它是为了解决：B-Tree、最左前缀、前缀匹配、范围条件等索引基础规则。
- `8.3.2 Primary Key Optimization`
  - 我看它是为了解决：为什么主键通常建议短、稳定、单列。
- `15.6.2.1 Clustered and Secondary Indexes`
  - 我看它是为了解决：聚簇索引、二级索引、回表边界。
- `8.3.12 Index Condition Pushdown`
  - 我看它是为了解决：索引过滤、回表前后判断这些执行细节。
- `8.8.1 Using EXPLAIN`
  - 我看它是为了解决：`type`、`key`、`rows`、`Extra` 这些执行计划字段的官方语义。
- `8.2.1.14 ORDER BY Optimization`
  - 我看它是为了解决：什么时候能借索引排序，什么时候会 `filesort`。
- `8.9.6 Index Statistics`
  - 我看它是为了解决：统计信息、选择性、优化器为什么会选错索引。
- `5.3 Slow Query Log`
  - 我看它是为了解决：慢 SQL 排查入口，不只靠 `EXPLAIN`。

## 执行流程 / 协议 / 优化器
- `Connection Management`
  - 我看它是为了解决：连接器、连接生命周期、权限快照等问题。
- `The Optimizer`
  - 我看它是为了解决：优化器到底在决定什么，不把它说成“自动最优黑盒”。
- `The EXPLAIN Statement`
  - 我看它是为了解决：为什么 `EXPLAIN` 只是计划展示，不等于真实执行。
- `MySQL Client/Server Protocol`
  - 我看它是为了解决：结果集是如何返回给客户端的。
- `The MySQL Server and Storage Engines`
  - 我看它是为了解决：Server 层和存储引擎层的分工边界。

## 数据类型 / DDL / 表达式
- `data-types`
  - 我看它是为了解决：数值、字符、时间类型的定义与边界。
- `13.1.15 CREATE INDEX` / `13.1.9 DROP INDEX`
  - 我看它是为了解决：索引 DDL 的最小准确定义。
- `expressions`
  - 我看它是为了解决：`IFNULL` / `COALESCE` 等表达式函数的行为边界。

## 窗口函数
- `12.21 Window Functions`
  - 我看它是为了解决：窗口函数总模型和 `GROUP BY` 的边界。
- `12.21.1 Window Function Concepts`
  - 我看它是为了解决：`OVER`、`PARTITION BY`、`ORDER BY`、frame 这些核心概念。
- `12.21.2 Window Function Descriptions`
  - 我看它是为了解决：`ROW_NUMBER`、`RANK`、`LAG`、`LEAD` 等具体函数的定义。

## 当前最常见的回手册场景
- 想确认一个结论是不是“官方定义”而不是二手总结。
- 遇到版本差异、语义边界、锁行为这类不该靠印象回答的问题。
- 准备把一篇 JavaGuide 或题解材料蒸馏成 `CARD` 前，先检查关键表述是否需要手册兜底。
