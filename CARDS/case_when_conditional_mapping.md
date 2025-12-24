---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Next: [[CARDS/case_when_conditional_count.md]]"
  - "Prereq: [[CARDS/ifnull_coalesce_null_fallback.md]]"
evidence: ""
---

# CASE WHEN 条件映射

Point: `CASE WHEN cond THEN val [WHEN ...] [ELSE val] END` 按条件返回值；**ELSE 不写时默认返回 NULL**（建议写 ELSE 避免出现 NULL），常用于字段重分类/条件统计。

Why: 把多分支判断写进 SQL，一次查询输出分类结果，减少重复逻辑。

SQL/Notes:
```sql
-- 不写 ELSE：都不满足时结果为 NULL
SELECT CASE WHEN score>=60 THEN 'pass' END AS flag FROM exam;
-- 推荐：写 ELSE 明确兜底
SELECT CASE WHEN score>=60 THEN 'pass' ELSE 'fail' END AS flag FROM exam;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md