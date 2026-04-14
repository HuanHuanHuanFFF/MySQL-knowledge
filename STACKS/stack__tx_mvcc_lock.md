# Stack: Tx / MVCC / Locks

Scope: 先补 MVCC / 快照读 / Read View 的最小前置，再看三类并发现象、四种隔离级别，以及 InnoDB 默认选择背后的工程权衡。

本页重点追三个问题：
- MVCC、快照读、Read View 到底分别是什么？
- 每个隔离级别靠什么机制避免了哪些问题？
- 为什么默认不是 RC，也不是 Serializable？

## Foundations
- [[CARDS/tx__what_is_isolation_level.md]]
- [[CARDS/tx__what_is_mvcc.md]]
- [[CARDS/tx__snapshot_read_vs_current_read.md]]
- [[CARDS/tx__what_is_read_view.md]]

## Phenomena
- [[CARDS/tx__dirty_read.md]]
- [[CARDS/tx__non_repeatable_read.md]]
- [[CARDS/tx__phantom_read.md]]

## Levels
- [[CARDS/tx__read_uncommitted.md]]
- [[CARDS/tx__read_committed.md]]
- [[CARDS/tx__repeatable_read.md]]
- [[CARDS/tx__serializable.md]]

## Design / Tradeoff
- [[CARDS/tx__rc_vs_rr_read_view_timing.md]]
- [[CARDS/tx__mysql_default_isolation.md]]
- [[CARDS/tx__why_mysql_default_rr.md]]
- [[CARDS/tx__isolation_level_summary.md]]

## Read (embed)
### Foundations
![[CARDS/tx__what_is_isolation_level.md]]
![[CARDS/tx__what_is_mvcc.md]]
![[CARDS/tx__snapshot_read_vs_current_read.md]]
![[CARDS/tx__what_is_read_view.md]]

### Phenomena
![[CARDS/tx__dirty_read.md]]
![[CARDS/tx__non_repeatable_read.md]]
![[CARDS/tx__phantom_read.md]]

### Levels
![[CARDS/tx__read_uncommitted.md]]
![[CARDS/tx__read_committed.md]]
![[CARDS/tx__repeatable_read.md]]
![[CARDS/tx__serializable.md]]

### Design / Tradeoff
![[CARDS/tx__rc_vs_rr_read_view_timing.md]]
![[CARDS/tx__mysql_default_isolation.md]]
![[CARDS/tx__why_mysql_default_rr.md]]
![[CARDS/tx__isolation_level_summary.md]]

## Evidence
- [[EXP/...]] (optional)
- [[SNIPPETS/...]] (optional)
