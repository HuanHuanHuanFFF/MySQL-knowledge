---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__read_view_visibility_rules.md]]"
  - "Compare: [[CARDS/tx__rc_vs_rr_read_view_timing.md]]"
  - "Prereq: [[CARDS/tx__version_chain_minimal.md]]"
evidence: ""
---

# 同一条版本链下，为什么 RC 会读到新提交，而 RR 还停在旧版本？

**Point**: 因为差别不在版本链本身，而在第二次一致性读时用的是不是同一个 Read View：RC 会刷新视图，RR 往往复用第一次视图。

**Why**: 版本链只负责“候选版本有哪些”；真正决定最后停在哪一版的，是这次读拿着什么可见性规则去筛。RC 第二次读能向前看，RR 第二次读更容易继续回到旧版本。

Notes:
- 最小链式例子可以先记成：`v3 -> v2 -> v1`。
- 第一次读时，RC 和 RR 都可能沿规则停在 `v1`。
- 后续 `v2` 已提交后，RC 第二次读若拿到新 Read View，就可能停到 `v2`。
- RR 若继续沿用第一次 Read View，就会继续跳过 `v2`，停回 `v1`。

Example: “同一条链、不同视图、停在不同版本” 才是 RC / RR 在实现层真正分叉的地方。


Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.1 Transaction Isolation Levels; 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
- sources/JavaGuide-mysql/transaction-isolation-level.md
