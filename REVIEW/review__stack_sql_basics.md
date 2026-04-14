## REVIEW · SQL Basics

### Quick

<details>
<summary>Q：SELECT 的标准子句骨架是什么顺序？</summary>
A：
- SELECT [ALL|DISTINCT] → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT。
</details>

See: [[CARDS/sql_select_clause_skeleton]]

---

<details>
<summary>Q：逻辑执行顺序为何与写法不同？</summary>
A：
- 实际执行 FROM→WHERE→GROUP BY→HAVING→SELECT→ORDER BY→LIMIT，解释别名与聚合可见性差异。
</details>

See: [[CARDS/sql_logical_execution_order]]

---

<details>
<summary>Q：WHERE 与 HAVING 在分组查询中的职责？</summary>
A：
- WHERE 组前按行过滤；HAVING 组后过滤，可用聚合和别名。
</details>

See: [[CARDS/where_vs_having_filters]]

---

<details>
<summary>Q：LIMIT offset,size 的基础用法？</summary>
A：
- LIMIT n 取前 n 行；LIMIT offset,size 从 offset 开始取 size 行（offset 从 0 起）。
</details>

See: [[CARDS/limit_offset_basics]]

---

### Core

<details>
<summary>Q：DISTINCT 的作用范围是什么？</summary>
A：
- 作用于选择列表整体，整行完全相同才去重，可与聚合结合。
</details>

See: [[CARDS/distinct_scope_whole_row]]

---

<details>
<summary>Q：ORDER BY 可以如何使用别名？</summary>
A：
- ORDER BY 支持用选择列表别名或原始字段排序，避免重复复杂表达式。
</details>

See: [[CARDS/order_by_alias_usage]]

---

<details>
<summary>Q：GROUP BY 开启 ONLY_FULL_GROUP_BY 时的限制？</summary>
A：
- 所有非聚合列必须出现在 GROUP BY，否则语句非法。
</details>

See: [[CARDS/group_by_visibility_only_full_group_by]]

---

<details>
<summary>Q：NULL 在比较与聚合中的处理规则？</summary>
A：
- 与 NULL 比较得 UNKNOWN 被 WHERE 过滤；COUNT(col)/AVG 忽略 NULL。
</details>

See: [[CARDS/null_handling_basics]]

---

<details>
<summary>Q：COUNT(*)、COUNT(col)、COUNT(DISTINCT col) 差异？</summary>
A：
- COUNT(*) 计行；COUNT(col) 忽略列为 NULL 的行；DISTINCT 先去重再计数。
</details>

See: [[CARDS/count_variants_semantics]]

---

<details>
<summary>Q：BETWEEN 在日期范围中的坑与推荐写法？</summary>
A：
- BETWEEN 闭区间易漏尾秒；推荐半开区间：>= start AND < next_start。
</details>

See: [[CARDS/between_datetime_boundaries]]

---

<details>
<summary>Q：常用日期函数 NOW/CURDATE/DATE_FORMAT 有何用途？</summary>
A：
- NOW 当前时间；CURDATE 当前日期；DATE_FORMAT 以指定格式输出。
</details>

See: [[CARDS/date_functions_common]]

---

<details>
<summary>Q：LIKE 通配符含义与适用场景？</summary>
A：
- % 任意长度，_ 单字符；仅用于文本列。
</details>

See: [[CARDS/like_wildcard_basics]]

---

<details>
<summary>Q：INSERT 的安全写法是什么？</summary>
A：
- 显式列清单配合 VALUES，缺省列走默认或允许 NULL，避免列顺序错位。
</details>

See: [[CARDS/insert_basic_patterns]]

---

<details>
<summary>Q：UPDATE 语句的必备条件是什么？</summary>
A：
- 必须带 WHERE 限定范围，影响行数取决于命中行。
</details>

See: [[CARDS/update_with_where_basics]]

---

<details>
<summary>Q：DELETE 与 TRUNCATE 的区别？</summary>
A：
- DELETE 按条件逐行删除可回滚；TRUNCATE 整表清空不可逐行过滤。
</details>

See: [[CARDS/delete_with_where_vs_truncate]]

---

### Pitfalls

<details>
<summary>Q：LIKE 前缀与包含模式的索引差异？</summary>
A：
- 前缀 'abc%' 可用索引；包含 '%abc%' 常无法用索引，易全表扫。
</details>

See: [[CARDS/like_prefix_vs_contains]]

---

<details>
<summary>Q：隐式转换或对列 CAST 如何导致索引失效？</summary>
A：
- 类型不匹配或对索引列包函数会弃用索引，应让常量匹配列类型或改写范围条件。
</details>

See: [[CARDS/cast_conversion_index_risk]]

---

<details>
<summary>Q：FROM 子查询的别名要求是什么？</summary>
A：
- FROM 子查询必须取表别名，否则语法错误。
</details>

See: [[CARDS/from_subquery_alias_required]]

---

<details>
<summary>Q：HAVING 能用别名而 WHERE 不行的原因？</summary>
A：
- WHERE 在 SELECT 之前执行，别名未生成；HAVING 在聚合后可见别名。
</details>

See: [[CARDS/alias_scope_where_having]]

---
