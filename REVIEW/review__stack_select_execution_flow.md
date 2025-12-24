## 复习提问：SELECT 执行流程

<details>
<summary>连接器做了哪些事？权限快照有什么影响？</summary>
认证、读取并缓存权限，连接超时/并发受 wait_timeout、max_connections 控制，权限变更需重连才生效。
</details>

See: [[CARDS/execflow__connector_auth.md]]

---

<details>
<summary>MySQL 8.0 的查询缓存是否还存在？旧版命中/失效规则？</summary>
8.0 已移除；旧版以 SQL 文本为 key 命中，表更新会使缓存失效。
</details>

See: [[CARDS/execflow__query_cache_status.md]]

---

<details>
<summary>解析器阶段做什么，哪些错误在这里报？</summary>
词法/语法分析生成语法树，语法错误此处报；不验证表列存在。
</details>

See: [[CARDS/execflow__parser_ast.md]]

---

<details>
<summary>预处理阶段检查哪些内容？</summary>
检查表/列存在与权限、类型匹配，展开 *，不通过即终止。
</details>

See: [[CARDS/execflow__preprocessor_checks.md]]

---

<details>
<summary>优化器的主要职责是什么？</summary>
选择索引、JOIN 顺序与访问方法，输出成本最小的计划。
</details>

See: [[CARDS/execflow__optimizer_plan.md]]

---

<details>
<summary>执行器与存储引擎的分工边界？</summary>
执行器驱动计划调用引擎接口；引擎负责索引/数据存取与缓冲。
</details>

See: [[CARDS/execflow__executor_engine_boundary.md]]

---

<details>
<summary>结果如何返回给客户端？</summary>
执行器逐行序列化为协议数据发送，客户端解析，断开则中止传输。
</details>

See: [[CARDS/execflow__result_return.md]]

---

<details>
<summary>链路中的常用观测点有哪些？</summary>
SHOW PROCESSLIST 查连接状态；EXPLAIN 查看计划不执行查询。
</details>

See: [[CARDS/execflow__observability_points.md]]

---

<details>
<summary>为什么 EXPLAIN 不等于真实执行？</summary>
只展示计划未实际执行，执行时可能因统计或参数不同而变化。
</details>

See: [[CARDS/execflow__explain_not_execution.md]]
