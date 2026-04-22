---
type: mysql-review
stack: "[[STACKS/stack__tx_mvcc_impl]]"
tags: [mysql, review]
---

# Review · Tx / MVCC Implementation

> 规则：页面默认只显示问题；点击问题才展开答案。不会的就点 See 回到对应 CARD。

## Quick (10s)

<details>
<summary>Q1：undo log 的第一职责是什么？为什么事务需要它？</summary>
A：
- 先服务事务回滚；事务要满足原子性，所以执行到一半失败或主动回滚时，数据库得能把已改数据撤回去。
</details>

See: [[CARDS/tx__what_is_undo_log]]

---

<details>
<summary>Q2：一次一致性读，先要解决哪两个问题？</summary>
A：
- 当前这版能不能看；如果不能看，上一版去哪里找。
</details>

See: [[CARDS/tx__mvcc_two_questions_before_read_view]]

---

<details>
<summary>Q3：Read View 一句话是在干什么？</summary>
A：
- 它是当前这次一致性读的判断上下文，用来判断当前版本对当前事务是否可见。
</details>

See: [[CARDS/tx__what_read_view_does_in_mvcc]]

---

## Core (2~5m)

<details>
<summary>Q4：insert undo 和 update undo，在 MVCC 主线里最核心的差异是什么？</summary>
A：
- `update undo` 主要给 MVCC 留旧版本；`insert undo` 主要用来撤销未提交插入，提交后通常会较快清理。
</details>

See: [[CARDS/tx__insert_undo_vs_update_undo_split]]

---

<details>
<summary>Q5：多个版本是怎么沿着 undo 串成一条链的？</summary>
A：
- 当前记录通过 `DB_ROLL_PTR` 指向更老版本相关的 `undo log`，于是就形成了从新到旧的版本链。
</details>

See: [[CARDS/tx__version_chain_minimal]]

---

<details>
<summary>Q6：delete 为什么也能进入版本链？</summary>
A：
- 因为在 InnoDB 里，`delete` 更像特殊更新：当前版本被标删除，但旧版本仍能沿 `undo log` 回退出来。
</details>

See: [[CARDS/tx__delete_on_version_chain]]

---

<details>
<summary>Q7：undo log 在 MVCC 里，不只是“回滚日志”还负责什么？</summary>
A：
- 负责提供旧版本，让一致性读在最新版本不可见时还能继续往前找。
</details>

See: [[CARDS/tx__undo_log_role_for_mvcc]]

---

<details>
<summary>Q8：要让 MVCC 的可见性判断跑起来，行上至少需要哪些核心信息？</summary>
A：
- 这版是谁写的，以及如果这版不能看要往哪退回上一版；常对应 `DB_TRX_ID` 和 `DB_ROLL_PTR`。
</details>

See: [[CARDS/tx__mvcc_hidden_columns_minimal]]

---

<details>
<summary>Q9：Read View 在这条实现链里负责什么？</summary>
A：
- 它提供当前这次一致性读的判断上下文，用来判断当前版本对当前事务是否可见。
</details>

See: [[CARDS/tx__what_read_view_does_in_mvcc]]

---

<details>
<summary>Q10：Read View 里那几个关键字段，各自是在管哪几类信息？</summary>
A：
- 主要管活跃事务 ID 集合、可见性的上下两侧边界，以及创建这个 Read View 的事务。
</details>

See: [[CARDS/tx__read_view_fields_minimal]]

---

<details>
<summary>Q11：一次一致性读，到底怎么判“这个版本我能不能看”？</summary>
A：
- 先把当前版本的作者信息交给当前这次读对应的 Read View 规则去判断；若不可见，再顺着 `DB_ROLL_PTR` 去上一版继续判断。
</details>

See: [[CARDS/tx__read_view_visibility_rules]]

---

<details>
<summary>Q12：为什么事务自己刚写的版本，自己通常能看到？</summary>
A：
- 因为 Read View 要排除的是别的活跃事务干扰，不会把当前事务自己的修改也一起屏蔽。
</details>

See: [[CARDS/tx__self_written_version_visibility]]

---

<details>
<summary>Q13：同一条版本链下，为什么 RC 会读到新提交，而 RR 还停在旧版本？</summary>
A：
- 差别不在版本链，而在第二次读是否刷新 Read View：RC 常刷新，RR 常复用第一次视图。
</details>

See: [[CARDS/tx__rc_rr_same_chain_different_result]]

---

## Pitfalls (Optional)

<details>
<summary>Q14：为什么 insert undo 通常能更早清理，而 update undo 往往要留更久？</summary>
A：
- 新插入但不可见时，别的事务通常直接当“这行不存在”；但更新前的旧值后续可能还要被一致性读看到。
</details>

See: [[CARDS/tx__insert_undo_vs_update_undo_split]]

---

<details>
<summary>Q15：DB_ROW_ID 按官方也算隐藏列，为什么在这条 MVCC 主线里不是核心？</summary>
A：
- 它更偏内部 row id / 聚簇索引补位；可见性判断和版本回退真正盯的是 `DB_TRX_ID` 与 `DB_ROLL_PTR`。
</details>

See: [[CARDS/tx__mvcc_hidden_columns_minimal]]

---

## References
- [[STACKS/stack__tx_mvcc_impl]]
