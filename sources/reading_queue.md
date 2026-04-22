# Reading Queue

## 默认读法
1. 先看 [[sources/mysql_manual_links]]，知道官方手册在哪些主题负责兜底。
2. 再按当前要补的主线，从下面对应分支进入。
3. 不要试图一次读完整个 `sources/`；每次只为当前主线选 1~3 份材料。

## 如果要补 SQL Basics / Join / Group & Aggregate
1. [[sources/sql-question/sql-syntax-summary]]
2. [[sources/sql-question/sql-questions-01]]
3. [[sources/sql-question/sql-questions-02]]
4. [[sources/sql-question/sql-questions-03]]
5. 需要兜底时再回 [[sources/refman-8.0-en.pdf]]

## 如果要补 Schema Basics
1. [[sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes]]
2. [[sources/JavaGuide-mysql/some-thoughts-on-database-storage-time]]
3. [[sources/JavaGuide-mysql/mysql-auto-increment-primary-key-continuous]]
4. 需要确认边界时回 [[sources/refman-8.0-en.pdf]]

## 如果要补 Select Execution Flow
1. [[sources/xiaolincoding__mysql__select_execution_flow.html]]
2. [[sources/JavaGuide-mysql/how-sql-executed-in-mysql]]
3. [[sources/JavaGuide-mysql/mysql-query-execution-plan]]
4. 再按 [[sources/mysql_manual_links]] 里的章节名回 [[sources/refman-8.0-en.pdf]]

## 如果要补 Index Core
1. [[sources/JavaGuide-mysql/mysql-index]]
2. [[sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion]]
3. [[sources/JavaGuide-mysql/mysql-query-execution-plan]]
4. [[sources/JavaGuide-mysql/mysql-auto-increment-primary-key-continuous]]
5. 再按 [[sources/mysql_manual_links]] 里的索引章节回 [[sources/refman-8.0-en.pdf]]

## 如果要补 Tx / MVCC / Locks
1. [[sources/JavaGuide-mysql/transaction-isolation-level]]
2. [[sources/JavaGuide-mysql/innodb-implementation-of-mvcc]]
3. [[sources/JavaGuide-mysql/mysql-questions-01]]
4. 再按 [[sources/mysql_manual_links]] 里的事务章节回 [[sources/refman-8.0-en.pdf]]

## 以后再开的新线
1. [[sources/JavaGuide-mysql/mysql-logs]]
2. [[sources/JavaGuide-mysql/mysql-high-performance-optimization-specification-recommendations]]

## 现在不建议怎么读
- 不建议先啃完整本 [[sources/refman-8.0-en.pdf]]。
- 不建议把 `sql-questions-01~05` 当主线教材顺读到底。
- 不建议在没有具体主线的情况下同时翻 SQL 基础、执行流程、事务、索引四类材料。
