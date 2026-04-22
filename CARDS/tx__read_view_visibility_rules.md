---
type: mysql-card
stack: "[[STACKS/stack__tx_mvcc_impl.md]]"
tags: [mysql, tx, mvcc]
related:
  - "Prereq: [[CARDS/tx__read_view_fields_minimal.md]]"
  - "Prereq: [[CARDS/tx__version_chain_minimal.md]]"
  - "Next: [[CARDS/tx__rc_rr_same_chain_different_result.md]]"
evidence: ""
---

# 一次一致性读，到底怎么判“这个版本我能不能看”？

**Point**: 一次一致性读可以先按这条动作链理解：先为这次读确定要用的 `Read View`；再看当前版本；按这份 `Read View` 判断当前版本是否可见；如果不可见，就顺着 `undo` 把更老版本继续找出来再判断。 

**Why**: 因为同一行可能同时挂着多个版本，一致性读必须有一套规则决定当前事务该停在哪一版；否则要么读到不该看的新版本，要么找不到应该返回的旧版本。

Notes:
- 一次一致性读先要确定“这次读拿哪份 `Read View` 来判”；RC 常每次读拿新视图，RR 常复用第一次一致性读的视图。
- 当前版本的作者信息若落在 `m_up_limit_id` 之前，通常可直接判可见。
- 当前版本的作者信息若大于等于 `m_low_limit_id`，通常可直接判不可见。
- 落在中间：再查 `m_ids`；若版本来自创建视图时仍活跃的事务，通常不可见。
- 当前版本不可见时，不是直接报错，而是顺着 `DB_ROLL_PTR` 去上一版，再重复这套判断。
- 当前事务自己写出的版本是一个单独特例，见 `tx__self_written_version_visibility`。

Example: 先确定这次读用哪份 `Read View`，再拿当前版本的 `DB_TRX_ID` 去判；若这版不可见，就沿 `DB_ROLL_PTR` 退到上一版继续看。

Up: [[STACKS/stack__tx_mvcc_impl]]

Refs:
- sources/refman-8.0-en.pdf (chapter: 17.7.2.3 Consistent Nonlocking Reads)
- sources/JavaGuide-mysql/innodb-implementation-of-mvcc.md
