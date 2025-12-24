---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/like_wildcard_basics.md]]"
evidence: ""
---

# CAST/隐式转换与索引

**Point**: 类型不匹配或在索引列上包函数/隐式转换（如字符串与数字比较）会让索引失效，退化全表扫。

**Why**: 保持条件类型一致，必要时显式 CAST 常量到列类型，避免对列做函数。

SQL/Notes:
```sql
-- 风险：列被隐式转换，索引失效
SELECT * FROM t WHERE str_col = 123;                -- str_col 为 VARCHAR
SELECT * FROM t WHERE DATE(ts_col) = '2023-01-01';  -- 对列包函数

-- 稳定写法：常量转换或改写条件
SELECT * FROM t WHERE str_col = CAST(123 AS CHAR);
SELECT * FROM t WHERE ts_col >= '2023-01-01' AND ts_col < '2023-01-02';
```

Refs:
- sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion.md
