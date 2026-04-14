## REVIEW · Index Core

### Quick
<details>
<summary>Q1：什么是索引？</summary>
A：
- 索引是按有序结构保存键值并指向行的数据组织，用来加速定位。
- 它的目标是少扫行，不是替代数据本身。
</details>

See: [[CARDS/index__what_is_index]]

---

<details>
<summary>Q2：全表扫描和索引扫描的差别是什么？</summary>
A：
- 全表扫描逐行读整表；索引扫描先在索引定位，再决定是否回表。
- 差别核心是访问行数和访问路径。
</details>

See: [[CARDS/index__full_scan_vs_index]]

---

<details>
<summary>Q3：InnoDB 的聚簇索引和二级索引有什么区别？</summary>
A：
- 聚簇索引叶子存整行；二级索引叶子存主键值。
- 二级索引查完整行时，通常还要再回主键树取数据。
</details>

See: [[CARDS/index__clustered_vs_secondary]]

---

<details>
<summary>Q4：看 EXPLAIN 时先盯哪几个字段？</summary>
A：
- 先看 `type`、`key`、`rows`、`Extra`。
- 它们能快速判断是否走索引、扫多少行、有没有 filesort / 临时表。
</details>

See: [[CARDS/explain_select_basics]]

---

### Core
<details>
<summary>Q5：为什么 B+Tree 适合做普通索引？</summary>
A：
- 因为它有序、扇出高、层数低。
- 所以既支持等值查找，也支持范围查找。
</details>

See: [[CARDS/index__btree_basics]]

---

<details>
<summary>Q6：主键为什么建议用稳定、短的单列整数？</summary>
A：
- 主键越稳定，聚簇索引越不容易频繁重排。
- 越短，二级索引叶子里存的主键也越省空间。
</details>

See: [[CARDS/schema_primary_key_choice]]

---

<details>
<summary>Q7：什么叫覆盖索引？什么时候会回表？</summary>
A：
- 查询需要的列都在同一索引叶子里，就是覆盖索引。
- 缺列时就要按主键再取整行，也就是回表。
</details>

See: [[CARDS/index__covering_index_vs_back_to_table]]

---

<details>
<summary>Q8：联合索引“最左前缀”是什么意思？</summary>
A：
- 复合索引按定义顺序生效，要从最左列开始连续使用。
- 中间断开或过早遇到范围条件，后续列通常就难继续利用。
</details>

See: [[CARDS/index__leftmost_prefix]]

---

<details>
<summary>Q9：什么样的查询条件更容易用到索引？</summary>
A：
- 等值、范围、前缀 LIKE、与索引前缀兼容的 ORDER BY / GROUP BY 更容易利用索引。
- 对索引列做函数、类型不匹配、前导通配符常让优化器放弃索引。
</details>

See: [[CARDS/index__when_index_used]]

---

<details>
<summary>Q10：`LIKE 'abc%'` 和 `LIKE '%abc%'` 对索引的影响有什么不同？</summary>
A：
- `'abc%'` 常能利用 B-Tree 前缀有序性。
- `'%abc%'` 因为前导通配符，通常无法走普通索引。
</details>

See: [[CARDS/like_prefix_vs_contains]]

---

<details>
<summary>Q11：为什么对索引列做 CAST 或隐式转换容易让索引失效？</summary>
A：
- 因为列一旦被包进函数或发生类型转换，原有有序键值就不好直接利用。
- 结果常退化成全表扫描。
</details>

See: [[CARDS/cast_conversion_index_risk]]

---

<details>
<summary>Q12：选择性和统计信息为什么会影响索引选择？</summary>
A：
- 优化器会用它们估算过滤行数和成本。
- 统计过期或采样失真时，就可能选错索引。
</details>

See: [[CARDS/index__cardinality_statistics]]

---

<details>
<summary>Q13：ORDER BY 什么时候能直接借助索引，什么时候会 filesort？</summary>
A：
- 当排序列与索引前缀和方向兼容，且 WHERE 不破坏顺序时，能直接用索引。
- 否则 `Extra` 往往会出现 `Using filesort`。
</details>

See: [[CARDS/index__order_by_filesort]]

---

<details>
<summary>Q14：优化器生成执行计划时主要在权衡什么？</summary>
A：
- 它会比较可用索引、覆盖与否、回表成本、连接顺序和统计信息。
- 目标是选择成本更低的访问路径。
</details>

See: [[CARDS/execflow__optimizer_plan]]

---

<details>
<summary>Q15：排查慢 SQL 的索引问题，最稳的路径是什么？</summary>
A：
- 先确认慢日志或复现语句，再看 EXPLAIN 的 `type/key/rows/Extra`。
- 然后核对谓词可索引性、统计是否新，再决定改索引还是改写 SQL。
</details>

See: [[CARDS/index__diagnose_path]]

---

<details>
<summary>Q16：CREATE INDEX 和 DROP INDEX 的最小写法怎么记？</summary>
A：
- 创建：`CREATE [UNIQUE] INDEX idx ON t(col1[,col2])`。
- 删除：`DROP INDEX idx ON t`。
</details>

See: [[CARDS/index_create_drop_basics]]

---

<details>
<summary>Q17：索引最小集先记哪几类？</summary>
A：
- 先记普通 `INDEX`、`UNIQUE`、联合索引。
- 联合索引的关键不是“有几列”，而是列顺序和左前缀。
</details>

See: [[CARDS/schema_index_minimal]]

---

### Pitfalls
<details>
<summary>Q18：索引是不是建得越多越好？</summary>
A：
- 不是。
- 每多一个索引，写入维护成本、空间成本和优化器决策复杂度都会上升。
</details>

See: [[CARDS/index__write_cost]]

---

<details>
<summary>Q19：为什么“明明建了索引却没走”是索引题常见坑？</summary>
A：
- 因为是否走索引不只看“有没有”，还看条件写法、统计信息和成本判断。
- 语句写法不友好时，优化器照样可能放弃它。
</details>

See: [[CARDS/index__when_index_used]]

---

<details>
<summary>Q20：UPDATE 的 WHERE 没命中索引，风险不只是慢，还是哪两件事？</summary>
A：
- 会扫描更多行。
- 还可能扩大锁范围，增加并发冲突。
</details>

See: [[CARDS/update_index_lock_reminder]]

---
