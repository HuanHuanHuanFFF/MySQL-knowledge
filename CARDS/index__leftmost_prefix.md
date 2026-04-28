---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# 联合索引最左前缀

**Point**: 联合索引就是把多个列按既定顺序放进同一棵索引里，例如 `(a, b, c)`；最左前缀原则指的是，只有从左往右连续使用这份顺序，数据库才能继续利用它的有序性。  
**Why**: 这不是死规定，而是由底层排序方式决定的：联合索引先按 `a` 排，再在相同 `a` 内按 `b` 排，最后按 `c` 排。跳过最左列或中间断开时，后面的有序性就接不上了。  
**Refs**:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
