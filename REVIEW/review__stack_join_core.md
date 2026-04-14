## REVIEW · Join Core

### Quick

<details>
<summary>Q：INNER JOIN 与 LEFT JOIN 的核心区别？</summary>
A：
- INNER 仅返回匹配行；LEFT 返回左表全部行，右表缺失填 NULL。
</details>

See: [[CARDS/join_inner_vs_left]]

---

<details>
<summary>Q：LEFT JOIN 时 ON 与 WHERE 的过滤差异？</summary>
A：
- 保留左表行的条件放 ON；WHERE 过滤会去掉右表为 NULL 的行。
</details>

See: [[CARDS/join_on_vs_where_left]]

---

<details>
<summary>Q：多表 JOIN 的基本写法？</summary>
A：
- 每表取别名并逐个写连接条件，避免笛卡尔积。
</details>

See: [[CARDS/join_multitable_pattern]]

---

### Core

<details>
<summary>Q：JOIN 产生重复行会带来什么统计问题？</summary>
A：
- 一对多/多对多会放大 COUNT/SUM，需 DISTINCT、GROUP BY 或拆分。
</details>

See: [[CARDS/join_duplicates_count_pitfall]]

---

<details>
<summary>Q：LEFT JOIN 变成 INNER 的常见原因？</summary>
A：
- 在 WHERE 过滤右表列非空，丢掉原应保留的 NULL 行。
</details>

See: [[CARDS/join_left_turns_inner]]

---

<details>
<summary>Q：在 JOIN 中做条件计数的安全方法？</summary>
A：
- 用 SUM(CASE WHEN ...) 分别累计各条件，避免重复行翻倍。
</details>

See: [[CARDS/join_duplicates_count_pitfall]]

---

<details>
<summary>Q：JOIN 时为何推荐使用表别名？</summary>
A：
- 避免歧义、简化多表条件书写，方便扩展更多 JOIN。
</details>

See: [[CARDS/join_multitable_pattern]]

---

<details>
<summary>Q：LEFT JOIN 过滤右表字段应放在哪个子句？</summary>
A：
- 放 ON，保持左表全量；放 WHERE 会转换为 INNER。
</details>

See: [[CARDS/join_on_vs_where_left]]

---

<details>
<summary>Q：INNER JOIN 可以用 WHERE 模拟吗？</summary>
A：
- 可以，通过 WHERE 指定连接条件，相当于隐式内连接。
</details>

See: [[CARDS/join_inner_vs_left]]

---

<details>
<summary>Q：多表 JOIN 时连接顺序的重要性？</summary>
A：
- 需确保每步 JOIN 条件明确，减少笛卡尔积和重复行。
</details>

See: [[CARDS/join_multitable_pattern]]

---

<details>
<summary>Q：LEFT JOIN 结果里的 NULL 表示什么？</summary>
A：
- 表示右表未匹配到行，字段填 NULL。
</details>

See: [[CARDS/join_inner_vs_left]]

---

<details>
<summary>Q：何时考虑用子查询/CTE 替代复杂 JOIN？</summary>
A：
- 当需要先聚合或逻辑过于复杂时，用子查询/CTE 产出中间表再 JOIN。
</details>

See: [[CARDS/join_when_use_subquery]]

---

<details>
<summary>Q：LEFT JOIN 统计右表命中行时如何写？</summary>
A：
- 在 ON 保留左表后，用 SUM(CASE WHEN 右表列 IS NOT NULL THEN 1 ELSE 0 END) 统计命中。
</details>

See: [[CARDS/join_duplicates_count_pitfall]]

---

<details>
<summary>Q：JOIN 中控制行数防止重复的常用手段？</summary>
A：
- 必要时先子查询聚合或 DISTINCT，再 JOIN 以避免行数放大。
</details>

See: [[CARDS/join_duplicates_count_pitfall]]

---

### Pitfalls

<details>
<summary>Q：为什么在 LEFT JOIN 后再对右表列使用 WHERE = 常量会丢数据？</summary>
A：
- WHERE 阶段过滤 NULL，会丢掉未匹配行，使 LEFT 退化为 INNER。
</details>

See: [[CARDS/join_left_turns_inner]]

---

<details>
<summary>Q：COUNT(*) 在 JOIN 后翻倍如何避免？</summary>
A：
- 使用 DISTINCT、分组聚合或拆分子查询控制行数。
</details>

See: [[CARDS/join_duplicates_count_pitfall]]

---

<details>
<summary>Q：JOIN 中缺失 ON 条件会怎样？</summary>
A：
- 产生笛卡尔积，行数暴增，需明确连接条件。
</details>

See: [[CARDS/join_multitable_pattern]]

---

<details>
<summary>Q：LEFT JOIN 想过滤右表行但保留左表全部，正确写法？</summary>
A：
- 将右表过滤放 ON，并允许右表字段为 NULL。
</details>

See: [[CARDS/join_on_vs_where_left]]

---

<details>
<summary>Q：JOIN 后聚合时遗漏 DISTINCT 可能导致什么？</summary>
A：
- 多对多放大导致统计过大，应按需 DISTINCT 或预聚合。
</details>

See: [[CARDS/join_duplicates_count_pitfall]]

---
