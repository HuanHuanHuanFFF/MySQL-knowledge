---
type: mysql-review
stack: "[[STACKS/stack__transaction_basics]]"
tags: [mysql, review]
---

# Review · Transaction Basics

> 规则：页面默认只显示问题；点击问题才展开答案。不会的就点 See 回到对应 CARD。

## Quick (10s)

<details>
<summary>Q1：业务动作为什么需要事务？</summary>
A：
- 因为一件业务事常常不是单条 SQL。
- 事务要避免中间失败后留下半截业务结果。
</details>

See: [[CARDS/tx__why_transaction_needed]]

---

<details>
<summary>Q2：怎么用 SQL 明确一段事务的开始和结束？</summary>
A：
- `START TRANSACTION` 开始事务，`COMMIT` 确认提交，`ROLLBACK` 撤回未提交修改。
- 这段边界内的相关 SQL 被当作同一个事务处理。
</details>

See: [[CARDS/tx__transaction_as_one_unit]]

---

<details>
<summary>Q3：ACID 分别代表哪四个事务特性？</summary>
A：
- Atomicity（原子性）、Consistency（一致性）、Isolation（隔离性）、Durability（持久性）。
- 分别约束：失败怎么撤回、状态是否正确、并发怎么隔开、提交后怎么保住。
</details>

See: [[CARDS/tx__acid_minimal_model]]

---

## Core (2~5m)

<details>
<summary>Q4：原子性和持久性分别在事务提交前后兜住什么？</summary>
A：
- 原子性兜提交前：失败时不能留下半截修改。
- 持久性兜提交后：已经 `COMMIT` 的结果不能因为故障丢掉。
</details>

See: [[CARDS/tx__acid_atomicity_durability]]

---

<details>
<summary>Q5：ACID 里的 Consistency（一致性）和“读一致性”是一回事吗？</summary>
A：
- 不是。
- ACID 的一致性说的是事务前后数据库状态仍合法。
- “同一事务里多次读是否稳定”属于读一致性问题，后面由隔离级别和 MVCC 处理。
</details>

See: [[CARDS/tx__acid_consistency_boundary]]

---

<details>
<summary>Q6：为什么隔离性比单个事务的提交和回滚更复杂？</summary>
A：
- 因为它处理的是多个事务交错执行时的互相影响。
- 核心问题变成：能不能看见、会不会覆盖、冲突时要不要等待。
</details>

See: [[CARDS/tx__acid_isolation_concurrency]]

---

<details>
<summary>Q7：如果只追求正确性，最简单粗暴的事务执行方式是什么？</summary>
A：
- 让事务一个个排队执行。
- 这样事务之间没有交叉，最容易保证正确。
</details>

See: [[CARDS/tx__serial_execution_tradeoff]]

---

<details>
<summary>Q8：为什么数据库不能只靠“所有事务排队执行”解决并发问题？</summary>
A：
- 这样正确性最好理解，但并发能力会很差。
- 业务系统的吞吐和响应时间都会受影响。
</details>

See: [[CARDS/tx__serial_execution_tradeoff]]

---

<details>
<summary>Q9：为了避免所有事务都排队，数据库分别用锁和 MVCC 解决什么问题？</summary>
A：
- 锁处理必须互斥的读写/写写冲突。
- MVCC 让普通读尽量读到合适版本，而不是总被写操作阻塞。
</details>

See: [[CARDS/tx__concurrency_control_two_directions]]

---

## Pitfalls (Optional)

<details>
<summary>Q10：有了 MVCC，是不是就不需要锁了？</summary>
A：
- 不是。
- MVCC 主要优化普通读；真正必须互斥的冲突仍然要靠锁处理。
</details>

See: [[CARDS/tx__concurrency_control_two_directions]]

---

<details>
<summary>Q11：为什么并发控制本质上是在两个极端之间做折中？</summary>
A：
- 完全放开并发容易破坏正确性。
- 全部排队又牺牲性能，所以数据库要在正确性和并发能力之间折中。
</details>

See: [[CARDS/tx__concurrency_control_two_directions]]

---

## References
- [[STACKS/stack__transaction_basics]]
