## REVIEW · Schema Basics


<details>
<summary>Q：选择常用数据类型时的基本原则？</summary>
A：
- 按容量/精度/时区需求选 INT/BIGINT、DECIMAL、VARCHAR/TEXT、DATETIME/TIMESTAMP，避免过大或受限类型。
</details>

See: [[CARDS/schema_datatype_min_set]]

---

<details>
<summary>Q：主键应如何选择？</summary>
A：
- 使用稳定、短的整型自增或分布式 ID，避免频繁更新的业务列。
</details>

See: [[CARDS/schema_primary_key_choice]]

---

<details>
<summary>Q：NOT NULL 与 DEFAULT 的常见坑？</summary>
A：
- NOT NULL 无默认需提供值；显式插入 NULL 会被拒，DEFAULT 仅在缺省时生效。
</details>

See: [[CARDS/schema_notnull_default_pitfalls]]

---

<details>
<summary>Q：如何快速查看表结构与建表语句？</summary>
A：
- SHOW CREATE TABLE 获取完整建表 SQL；DESC/SHOW COLUMNS 查看列信息。
</details>

See: [[CARDS/schema_show_create_desc]]

---

### Core

<details>
<summary>Q：自增主键有哪些注意事项？</summary>
A：
- 仅整型可自增，删除主键前需先移除自增，编号不保证连续。
</details>

See: [[CARDS/schema_auto_increment_notes]]

---

<details>
<summary>Q：UNIQUE 与普通索引的区别？</summary>
A：
- UNIQUE 保证唯一性（可多 NULL），写入需校验；普通索引不校验唯一。
</details>

See: [[CARDS/schema_unique_constraint]]

---

<details>
<summary>Q：外键在设计时如何取舍？</summary>
A：
- 外键强制父子一致性但增加写检查与锁竞争，部分团队改为应用侧校验。
</details>

See: [[CARDS/schema_foreign_key_light]]

---

<details>
<summary>Q：索引最小集的设计要点？</summary>
A：
- 常用 INDEX/UNIQUE，联合索引按左前缀生效，列顺序决定可用查询。
</details>

See: [[CARDS/schema_index_minimal]]

---

<details>
<summary>Q：TIMESTAMP 与 DATETIME 的选择依据？</summary>
A：
- TIMESTAMP 随时区转换且受 2038 限制；DATETIME 存原值范围大，不做时区转换。
</details>

See: [[CARDS/schema_timestamp_vs_datetime]]

---

<details>
<summary>Q：VARCHAR 与 TEXT 的适用场景？</summary>
A：
- VARCHAR 适合中短文本且易索引；TEXT 用于超长内容，索引需前缀限制。
</details>

See: [[CARDS/schema_varchar_vs_text]]

---

<details>
<summary>Q：DECIMAL 适用于哪些场景？</summary>
A：
- 用于金额等精确小数，避免浮点误差；精度过高会增大存储开销。
</details>

See: [[CARDS/schema_decimal_usage]]

---

<details>
<summary>Q：更换主键或表结构前如何确认影响？</summary>
A：
- 先用 SHOW CREATE/DESC 确认现有约束与默认，避免遗漏非空/默认/索引。
</details>

See: [[CARDS/schema_show_create_desc]]

---

<details>
<summary>Q：选择 VARCHAR 长度时应考虑什么？</summary>
A：
- 兼顾数据上限与索引效率，过大可改用 TEXT 并限前缀索引。
</details>

See: [[CARDS/schema_varchar_vs_text]]

---

### Pitfalls

<details>
<summary>Q：为何修改主键前要处理自增属性？</summary>
A：
- 自增绑定在主键上，需先移除自增再删除主键，否则报错。
</details>

See: [[CARDS/schema_auto_increment_notes]]

---

<details>
<summary>Q：UNIQUE 允许多行 NULL 吗？</summary>
A：
- 允许，多 NULL 不冲突；主键不允许 NULL。
</details>

See: [[CARDS/schema_unique_constraint]]

---

<details>
<summary>Q：选择 TIMESTAMP 可能遇到的溢出问题？</summary>
A：
- 受 2038 限制，存更远未来时间会溢出，应改用 DATETIME。
</details>

See: [[CARDS/schema_timestamp_vs_datetime]]

---

<details>
<summary>Q：使用 TEXT 时索引有什么限制？</summary>
A：
- 需前缀索引且长度有限，超长字段会导致索引成本高。
</details>

See: [[CARDS/schema_varchar_vs_text]]

---

<details>
<summary>Q：外键带来的潜在性能影响是什么？</summary>
A：
- 写入需额外一致性检查与锁，热点写负载下可能成瓶颈。
</details>

See: [[CARDS/schema_foreign_key_light]]

---
