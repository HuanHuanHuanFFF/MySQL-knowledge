## REVIEW · Tx / MVCC / Locks

### Quick
<details>
<summary>Q1：事务为什么需要隔离级别？</summary>
A：
- 因为并发事务会同时读写同一批数据，必须先定义彼此“能看见什么”。
- 本质是在一致性、可重复性和并发性能之间做取舍。
</details>

See: [[CARDS/tx__what_is_isolation_level]]

---

<details>
<summary>Q2：MVCC 是什么，先抓哪一个核心点？</summary>
A：
- 它是多版本并发控制：同一行可保留多个历史版本，让事务按可见性规则读到该看的版本。
- 面试里先抓“普通读少等锁、并发更高”这个核心取舍。
</details>

See: [[CARDS/tx__what_is_mvcc]]

---

<details>
<summary>Q3：MySQL / InnoDB 默认隔离级别是什么？</summary>
A：
- 默认是 Repeatable Read。
- MySQL 8.0+ 可用 `SELECT @@transaction_isolation;` 查看。
</details>

See: [[CARDS/tx__mysql_default_isolation]]

---

<details>
<summary>Q4：为什么 InnoDB 默认选 RR，而不是直接默认 RC 或 Serializable？</summary>
A：
- 可以把它理解为工程折中：比 RC 给更稳定的事务内视图，又不像 Serializable 那样把并发压得太狠。
- 目标是尽量同时兼顾读稳定性和普通读并发。
</details>

See: [[CARDS/tx__why_mysql_default_rr]]

---

### Core
<details>
<summary>Q5：快照读和当前读的最小区别是什么？</summary>
A：
- 快照读读的是可见历史版本，普通 `SELECT` 常见于此。
- 当前读读最新版本并参与加锁，常见于 `FOR UPDATE`、`UPDATE`、`DELETE`。
</details>

See: [[CARDS/tx__snapshot_read_vs_current_read]]

---

<details>
<summary>Q6：Read View 是什么，为什么 MVCC 离不开它？</summary>
A：
- 它是一致性读当下的可见性快照，决定哪些事务版本对当前读可见。
- 没有它，MVCC 就无法判断“该读哪一个旧版本”。
</details>

See: [[CARDS/tx__what_is_read_view]]

---

<details>
<summary>Q7：脏读的定义是什么？</summary>
A：
- 读到了别的事务尚未提交的数据。
- 如果对方随后回滚，你读到的内容就从未真正成立过。
</details>

See: [[CARDS/tx__dirty_read]]

---

<details>
<summary>Q8：不可重复读的定义是什么？</summary>
A：
- 同一事务里前后两次读同一行，结果却不同。
- 典型原因是中间有别的事务提交了修改。
</details>

See: [[CARDS/tx__non_repeatable_read]]

---

<details>
<summary>Q9：幻读和不可重复读的区别怎么一句话讲清？</summary>
A：
- 不可重复读偏“同一行的值变了”。
- 幻读偏“同一范围内满足条件的记录集合变了”。
</details>

See: [[CARDS/tx__phantom_read]]

---

<details>
<summary>Q10：Read Uncommitted 从机制上为什么三类问题都可能出现？</summary>
A：
- 因为它允许读到未提交版本，几乎没设“提交后才可见”的边界。
- 所以脏读、不可重复读、幻读都可能发生。
</details>

See: [[CARDS/tx__read_uncommitted]]

---

<details>
<summary>Q11：Read Committed 靠什么避免脏读？</summary>
A：
- 核心是只让已提交版本可见。
- 在 InnoDB 里，普通一致性读通常每次 `SELECT` 都基于新的已提交视图来读。
</details>

See: [[CARDS/tx__read_committed]]

---

<details>
<summary>Q12：为什么 RC 能防脏读，却还是会出现不可重复读？</summary>
A：
- 因为 RC 的一致性读会随着后续提交继续向前推进。
- 同一事务两次查询之间，如果别人提交了新版本，后一次就可能看到新值。
</details>

See: [[CARDS/tx__rc_vs_rr_read_view_timing]]

---

<details>
<summary>Q13：Repeatable Read 靠什么实现“同一事务里重复读更稳定”？</summary>
A：
- 在 InnoDB 里，一致性读会复用同一 Read View。
- 所以同一事务里重复读同一行时，通常仍看到同一版数据。
</details>

See: [[CARDS/tx__repeatable_read]]

---

<details>
<summary>Q14：Serializable 靠什么把三类读现象都压住？</summary>
A：
- 它用更保守的锁定与等待，把并发事务尽量隔开。
- 结果更稳，但等待更多、吞吐更低。
</details>

See: [[CARDS/tx__serializable]]

---

<details>
<summary>Q15：RC 和 RR 的本质实现差异，面试里最短怎么答？</summary>
A：
- 都用一致性读，但 Read View 生成时机不同。
- RC 往前刷新，RR 更早固定，所以 RR 才能换来可重复读。
</details>

See: [[CARDS/tx__rc_vs_rr_read_view_timing]]

---

<details>
<summary>Q16：为什么 RR 下普通 SELECT 不一定都要加锁，却还能有较强的读稳定性？</summary>
A：
- 因为普通 `SELECT` 常走快照读，不必把每次读都变成锁竞争。
- 这正是 InnoDB 用 MVCC 换读并发的设计点。
</details>

See: [[CARDS/tx__snapshot_read_vs_current_read]]

---

<details>
<summary>Q17：如果面试官追问“四个级别各靠什么思路兜住问题”，怎么最小回答？</summary>
A：
- RU：几乎不防；RC：只看已提交；RR：固定一致性读视图；Serializable：更强锁定与等待。
- 这是比单背异常表更像工程回答的版本。
</details>

See: [[CARDS/tx__isolation_level_summary]]

---

### Pitfalls
<details>
<summary>Q18：能不能把 RR 直接背成“完全没有幻读”？</summary>
A：
- 不建议这么背。
- 先记标准边界，再补 InnoDB 会对一部分幻读做额外处理，别把两层概念混成一句话。
</details>

See: [[CARDS/tx__isolation_level_summary]]

---

<details>
<summary>Q19：默认 RR 是否意味着 RC 一定更差，或者 Serializable 一定更好？</summary>
A：
- 不是，三者是在“读稳定性、锁等待、并发能力”之间取舍。
- 默认值只是折中，不是放之四海而皆准的最优解。
</details>

See: [[CARDS/tx__why_mysql_default_rr]]

---

<details>
<summary>Q20：把“MVCC 等于完全不加锁”这样回答，哪里不对？</summary>
A：
- MVCC 主要优化普通一致性读，不等于系统里没有锁。
- 当前读、写操作以及更高隔离级别仍会进入锁与等待。
</details>

See: [[CARDS/tx__snapshot_read_vs_current_read]]

---
