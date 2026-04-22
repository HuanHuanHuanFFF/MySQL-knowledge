# Stack: Tx / MVCC Implementation

Scope: 这条线只讲 InnoDB 怎么把 MVCC 做出来，不再重复隔离级别总览、并发现象和设计权衡主线；这条 stack 后面说的“回滚”，默认都指事务 `ROLLBACK`。

## Read First
- [[CARDS/tx__what_is_mvcc.md]]
- [[CARDS/tx__snapshot_read_vs_current_read.md]]

## Boundary
- [[CARDS/tx__rollback_vs_recovery_boundary_minimal.md]]

## Undo / Versioning
- [[CARDS/tx__what_is_undo_log.md]]
- [[CARDS/tx__insert_undo_vs_update_undo_split.md]]
- [[CARDS/tx__version_chain_minimal.md]]
- [[CARDS/tx__delete_on_version_chain.md]]
- [[CARDS/tx__undo_log_role_for_mvcc.md]]

## Before Read View
- [[CARDS/tx__mvcc_two_questions_before_read_view.md]]
- [[CARDS/tx__mvcc_hidden_columns_minimal.md]]

## Visibility
- [[CARDS/tx__what_read_view_does_in_mvcc.md]]
- [[CARDS/tx__read_view_fields_minimal.md]]
- [[CARDS/tx__read_view_visibility_rules.md]]
- [[CARDS/tx__self_written_version_visibility.md]]

## RC vs RR On The Same Chain
- [[CARDS/tx__rc_rr_same_chain_different_result.md]]

## Read (embed)
### Boundary
![[CARDS/tx__rollback_vs_recovery_boundary_minimal.md]]

### Undo / Versioning
![[CARDS/tx__what_is_undo_log.md]]
![[CARDS/tx__insert_undo_vs_update_undo_split.md]]
![[CARDS/tx__version_chain_minimal.md]]
![[CARDS/tx__delete_on_version_chain.md]]
![[CARDS/tx__undo_log_role_for_mvcc.md]]

### Before Read View
![[CARDS/tx__mvcc_two_questions_before_read_view.md]]
![[CARDS/tx__mvcc_hidden_columns_minimal.md]]

### Visibility
![[CARDS/tx__what_read_view_does_in_mvcc.md]]
![[CARDS/tx__read_view_fields_minimal.md]]
![[CARDS/tx__read_view_visibility_rules.md]]
![[CARDS/tx__self_written_version_visibility.md]]

### RC vs RR On The Same Chain
![[CARDS/tx__rc_rr_same_chain_different_result.md]]

## Evidence
- [[EXP/...]] (optional)
- [[SNIPPETS/...]] (optional)
