---
type: mysql-card
stack: "[[STACKS/stack__sql_basics.md]]"
tags: [mysql]
related:
  - "Compare: [[CARDS/concat_basics.md]]"
evidence: ""
---

# SUBSTRING / LENGTH

**Point**: `SUBSTRING(str,pos,len)` 截取子串；`LENGTH(str)` 返回字节长度（与字符数可能不同）。

**Why**: 截取/校验长度时区分字节与字符，避免多字节字符截断异常。

SQL/Notes:
```sql
SELECT SUBSTRING(name,1,5) AS prefix, LENGTH(name) AS len_bytes FROM users;
```

Refs:
- sources/JavaGuide-mysql/a-thousand-lines-of-mysql-study-notes.md
