## REVIEW · Tx / MVCC / Locks

### Quick
<details>
<summary>Q1：事务为什么需要隔离级别？</summary>
A：
- 因为并发事务会同时读写同一批数据，需要统一规则定义彼此“能看见什么”。
- 它本质上是在一致性、可重复性和并发性能之间做取舍。
</details>

See: [[CARDS/tx__what_is_isolation_level]]

---

<details>
<summary>Q2：隔离级别这一段最先要记住的三类并发现象是什么？</summary>
A：
- 脏读、不可重复读、幻读。
- 先记现象，再回推各隔离级别解决到了哪一步。
</details>

See: [[CARDS/tx__isolation_level_summary]]

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
<summary>Q4：四种隔离级别里哪个最严格？</summary>
A：
- Serializable 最严格。
- 它按串行化语义执行事务，能避免三类读现象。
</details>

See: [[CARDS/tx__serializable]]

---

### Core
<details>
<summary>Q5：脏读的定义是什么？</summary>
A：
- 读到了别的事务尚未提交的数据。
- 如果对方随后回滚，你读到的内容就从未真正成立过。
</details>

See: [[CARDS/tx__dirty_read]]

---

<details>
<summary>Q6：不可重复读的定义是什么？</summary>
A：
- 同一事务里前后两次读同一行，结果却不同。
- 原因是中间有别的事务提交了修改。
</details>

See: [[CARDS/tx__non_repeatable_read]]

---

<details>
<summary>Q7：幻读的定义是什么？</summary>
A：
- 同一事务里重复执行同一个范围查询，返回的行集合变了。
- 重点不是某一行值变了，而是“符合条件的记录集合”变了。
</details>

See: [[CARDS/tx__phantom_read]]

---

<details>
<summary>Q8：不可重复读和幻读的核心区别是什么？</summary>
A：
- 不可重复读更偏“同一行的值变了”。
- 幻读更偏“同一范围内的记录数或集合变了”。
</details>

See: [[CARDS/tx__phantom_read]]

---

<details>
<summary>Q9：Read Uncommitted 的核心特点是什么？</summary>
A：
- 它保护最弱，允许读到未提交数据。
- 因此脏读、不可重复读、幻读都可能出现。
</details>

See: [[CARDS/tx__read_uncommitted]]

---

<details>
<summary>Q10：Read Committed 比 Read Uncommitted 多解决了什么问题？</summary>
A：
- 它至少解决了脏读。
- 因为它只能读到其他事务已经提交的数据。
</details>

See: [[CARDS/tx__read_committed]]

---

<details>
<summary>Q11：为什么 Read Committed 下同一事务两次读还能不一样？</summary>
A：
- 因为它不要求整段事务共用同一个稳定读视图。
- 别的事务中途提交后，后一次读取可能看到新结果。
</details>

See: [[CARDS/tx__read_committed]]

---

<details>
<summary>Q12：Repeatable Read 主要解决了什么问题？</summary>
A：
- 它能防脏读和不可重复读。
- 同一事务里重复读取同一行时，结果应保持一致。
</details>

See: [[CARDS/tx__repeatable_read]]

---

<details>
<summary>Q13：在这一页里，应该怎样理解 Repeatable Read 和幻读的关系？</summary>
A：
- 先按标准概念记：RR 主要保证“同一行重复读稳定”。
- 幻读仍是后续要单独展开的主题，这一页不提前深挖实现细节。
</details>

See: [[CARDS/tx__repeatable_read]]

---

<details>
<summary>Q14：Serializable 比 Repeatable Read 更进一步在哪里？</summary>
A：
- 它不只保证行值稳定，还要避免幻读。
- 所以四种级别里它的结果约束最强。
</details>

See: [[CARDS/tx__serializable]]

---

<details>
<summary>Q15：如何最快记住四种隔离级别的差异？</summary>
A：
- 直接按三类现象对照：谁允许脏读、不可重复读、幻读。
- 这是这一页的最小记忆框架。
</details>

See: [[CARDS/tx__isolation_level_summary]]

---

<details>
<summary>Q16：如果题目问“默认不改配置时事务跑在哪个级别”，应该怎么答？</summary>
A：
- 答 InnoDB 默认跑在 Repeatable Read。
- 这也是 MySQL 里最常见的默认前提。
</details>

See: [[CARDS/tx__mysql_default_isolation]]

---

### Pitfalls
<details>
<summary>Q17：读到未提交数据，这属于不可重复读吗？</summary>
A：
- 不属于，这叫脏读。
- 关键点是“对方还没提交”，不是“同一事务前后两次结果不同”。
</details>

See: [[CARDS/tx__dirty_read]]

---

<details>
<summary>Q18：同一范围查询第二次多出一行，这是不可重复读吗？</summary>
A：
- 更准确地说，这是幻读。
- 因为变化的是结果集合，而不是同一行的值。
</details>

See: [[CARDS/tx__phantom_read]]

---

<details>
<summary>Q19：能不能把 Repeatable Read 直接背成“完全没有幻读”？</summary>
A：
- 这一页不建议这么背。
- 先记标准概念边界：RR 重点防脏读和不可重复读，幻读实现细节后面再拆。
</details>

See: [[CARDS/tx__isolation_level_summary]]

---
