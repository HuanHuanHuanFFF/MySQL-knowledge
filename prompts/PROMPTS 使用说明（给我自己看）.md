## 仓库结构
- SOURCES/：资料导航（只放链接+你自己的要点）
- STACKS/：聚合页（目录 + 嵌入卡片）
- CARDS/：原子卡（短）
- EXP/：实验（SQL + EXPLAIN + 结论）
- SNIPPETS/：可复制 SQL 模板

## 卡片规则
- 每张 CARD：只讲一个点，尽量 ≤ 12 行
- 每张 CARD 用 front matter 的 `stack:` 指向所属 STACK
- 正文不要再写 `Up:`，避免和 `stack:` 重复
- CARD 可选 Evidence：指向 EXP 或 SNIPPETS（最多 1 个）
- 多链接集中在 STACK：STACK 负责 1→多、排序、嵌入阅读

## 工作流（最小闭环）
读一段资料 → 产出：
- 1 张 CARD（必须）
- 可选 1 个 EXP 或 1 条 SNIPPETS（看是否需要证据/模板）
- 把 CARD 加入对应 STACK（目录 + 嵌入）
