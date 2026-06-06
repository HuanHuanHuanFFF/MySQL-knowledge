## REVIEW · Index Core

### Quick
<details>
<summary>Q1：MySQL 索引最先要解决什么问题？</summary>
A：
- 解决“按字段值快速找到数据”的问题。
- 没有索引时，很多查询只能从头扫描更多行。
</details>

See: [[CARDS/index__what_is_index]]

---

<details>
<summary>Q2：B+Tree 为什么适合做通用索引？</summary>
A：
- 它按键值有序组织数据。
- 既适合等值查找，也适合范围查找和顺序扫描。
</details>

See: [[CARDS/index__btree_basics]]

---

<details>
<summary>Q3：聚簇索引和二级索引的叶子节点分别存什么？</summary>
A：
- 聚簇索引叶子节点存整行记录。
- 二级索引叶子节点通常存索引列值和对应主键值。
</details>

See: [[CARDS/index__clustered_vs_secondary]]

---

<details>
<summary>Q4：二级索引查询什么时候需要回表？</summary>
A：
- 如果二级索引叶子里凑不齐 `SELECT` 需要的列，就要拿主键再查聚簇索引。
- 这一步就是回表。
</details>

See: [[CARDS/index__covering_index_vs_back_to_table]]

---

### Core
<details>
<summary>Q5：全表扫描和索引扫描的访问路径有什么差别？</summary>
A：
- 全表扫描从表里逐行检查。
- 索引扫描先按索引定位候选记录，再决定是否继续取整行。
</details>

See: [[CARDS/index__full_scan_vs_index_scan]]

---

<details>
<summary>Q6：覆盖索引为什么能比回表更省一步？</summary>
A：
- 覆盖索引里已经有查询需要的全部列。
- 数据库可以直接从索引返回，不必再走聚簇索引取整行。
</details>

See: [[CARDS/index__covering_index_vs_back_to_table]]

---

<details>
<summary>Q7：联合索引的最左前缀到底在限制什么？</summary>
A：
- 限制索引必须从最左列开始连续利用。
- 因为联合索引按创建时的列顺序组织有序性。
</details>

See: [[CARDS/index__leftmost_prefix]]

---

<details>
<summary>Q8：为什么 `LIKE 'abc%'` 比 `LIKE '%abc%'` 更容易用到索引？</summary>
A：
- B+Tree 按字典序从前往后比较。
- 前缀确定时能定位范围；前导通配符会让起点不确定。
</details>

See: [[CARDS/like_prefix_vs_contains]]

---

<details>
<summary>Q9：索引为什么不是建得越多越好？</summary>
A：
- 每多一个索引，写入时就多一份维护成本。
- 还会增加存储空间和后续排查复杂度。
</details>

See: [[CARDS/index__write_cost]]

---

<details>
<summary>Q10：看 EXPLAIN 时，索引基础阶段先看哪些字段？</summary>
A：
- 先看 `type`、`key`、`rows`、`Extra`。
- 它们能帮你判断访问方式、实际用到的索引和大致扫描量。
</details>

See: [[CARDS/explain_select_basics]]

---

<details>
<summary>Q11：排查慢 SQL 是否是索引问题，最小路径是什么？</summary>
A：
- 先看 SQL 条件和期望索引。
- 再用 EXPLAIN 看实际访问路径，最后决定改 SQL 还是补/调索引。
</details>

See: [[CARDS/index__diagnose_path]]

---

<details>
<summary>Q12：CREATE INDEX 和 DROP INDEX 的基础写法记什么？</summary>
A：
- 创建索引：`CREATE INDEX ... ON table_name (...)`。
- 删除索引：`DROP INDEX ... ON table_name`。
</details>

See: [[CARDS/index_create_drop_basics]]

---

### Pitfalls
<details>
<summary>Q13：二级索引已经命中，为什么查询仍可能不快？</summary>
A：
- 如果需要大量回表，仍然要多走聚簇索引。
- 命中索引不等于这次访问路径一定便宜。
</details>

See: [[CARDS/index__covering_index_vs_back_to_table]]

---

<details>
<summary>Q14：为什么索引基础学完后还要继续看 B+Tree 深入页？</summary>
A：
- index core 只建立基础使用路径。
- B+Tree 深入页继续解释页、范围扫描、分裂、聚簇/二级索引路径和结构对比。
</details>

See: [[CARDS/index__btree_basics]]

---
