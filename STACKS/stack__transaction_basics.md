# Stack: Transaction Basics

Scope: 事务基础、ACID、并发事务工程权衡；作为隔离级别、MVCC、锁主线的前置入口。

## Part 1: 为什么需要事务
- [[CARDS/tx__why_transaction_needed]]
- [[CARDS/tx__transaction_as_one_unit]]

## Part 2: ACID 在约束什么
- [[CARDS/tx__acid_minimal_model]]
- [[CARDS/tx__acid_atomicity_durability]]
- [[CARDS/tx__acid_consistency_boundary]]
- [[CARDS/tx__acid_isolation_concurrency]]

## Part 3: 正确性和并发性能怎么折中
- [[CARDS/tx__serial_execution_tradeoff]]
- [[CARDS/tx__concurrency_control_two_directions]]

## Continue
- 隔离级别 / MVCC / 锁主线: [[STACKS/stack__tx_mvcc_lock]]

## Read (embed)
### Part 1: 为什么需要事务
![[CARDS/tx__why_transaction_needed]]
![[CARDS/tx__transaction_as_one_unit]]

### Part 2: ACID 在约束什么
![[CARDS/tx__acid_minimal_model]]
![[CARDS/tx__acid_atomicity_durability]]
![[CARDS/tx__acid_consistency_boundary]]
![[CARDS/tx__acid_isolation_concurrency]]

### Part 3: 正确性和并发性能怎么折中
![[CARDS/tx__serial_execution_tradeoff]]
![[CARDS/tx__concurrency_control_two_directions]]

## Evidence
- sources/refman-8.0-en.pdf (chapters: transaction control statements; 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads; 17.7.2.4 Locking Reads; InnoDB Multi-Versioning)
- sources/JavaGuide-mysql/mysql-questions-01.md
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
- sources/JavaGuide-mysql/transaction-isolation-level.md
- sources/JavaGuide-mysql/mysql-logs.md
