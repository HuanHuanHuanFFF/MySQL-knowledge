---
type: mysql-card
tags: [mysql]
stack: "[[STACKS/stack__sql_basics]]"
related:
  - "Compare: [[CARDS/like_wildcard_basics.md]]"
evidence: "sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion.md"
---

# CAST/隐式转换与索引

**Point**: 在索引列上做函数或类型转换（如字符串列与数字比较、DATE(col)）会让索引失效，退化全表扫。  
**Why**: 需保持列与常量类型一致，必要时转换常量或改写范围条件，避免对列做函数。  
**SQL**:
```sql
SELECT * FROM t WHERE str_col = CAST(123 AS CHAR);
SELECT * FROM t WHERE ts_col >= '2023-01-01' AND ts_col < '2023-01-02';
```
**Refs**:
- sources/JavaGuide-mysql/index-invalidation-caused-by-implicit-conversion.md
