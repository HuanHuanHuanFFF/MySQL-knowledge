# Stack: Tx / MVCC / Locks

Scope: 不先背名词，而是先追几个真实问题，再顺着设计目标、实现机制、边界与取舍往下读。

## Core Model
- [[CARDS/tx__what_is_isolation_level.md]]
- [[CARDS/tx__what_is_mvcc.md]]
- [[CARDS/tx__snapshot_read_vs_current_read.md]]
- [[CARDS/tx__what_is_read_view.md]]

## Phenomena
- [[CARDS/tx__dirty_read.md]]
- [[CARDS/tx__non_repeatable_read.md]]
- [[CARDS/tx__phantom_read.md]]

## Isolation Levels
- [[CARDS/tx__read_uncommitted.md]]
- [[CARDS/tx__read_committed.md]]
- [[CARDS/tx__repeatable_read.md]]
- [[CARDS/tx__serializable.md]]

## Design / Tradeoff
- [[CARDS/tx__rc_vs_rr_read_view_timing.md]]
- [[CARDS/tx__mysql_default_isolation.md]]
- [[CARDS/tx__why_mysql_default_rr.md]]
- [[CARDS/tx__isolation_level_summary.md]]

## Go Deeper
- [[STACKS/stack__tx_mvcc_impl.md]]

## Q&A / Start Here
![[QA/tx__why_plain_select_should_not_lock]]
![[QA/tx__how_to_tell_snapshot_vs_current_read]]
![[QA/tx__why_rc_and_rr_feel_different]]
![[QA/tx__why_not_default_rc_or_serializable]]

## Read (embed)
### Core Model
![[CARDS/tx__what_is_isolation_level.md]]
![[CARDS/tx__what_is_mvcc.md]]
![[CARDS/tx__snapshot_read_vs_current_read.md]]
![[CARDS/tx__what_is_read_view.md]]

### Phenomena
![[CARDS/tx__dirty_read.md]]
![[CARDS/tx__non_repeatable_read.md]]
![[CARDS/tx__phantom_read.md]]

### Isolation Levels
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

## Continue
- [[STACKS/stack__tx_mvcc_impl.md]]
