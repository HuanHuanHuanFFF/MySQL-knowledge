---
type: mysql-card
tags: [mysql]
Up: "[[STACKS/stack__index_core]]"
evidence: "sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)"
---

# 联合索引最左前缀

**Point**: 联合索引就是把多个列按创建时的顺序放进同一棵索引里，例如 `(a, b, c)`；最左前缀原则指的是，只有从左往右连续使用这份顺序，数据库才能继续利用这份索引。

**Why**: 在 B+Tree 里，联合索引就是按创建时的规则排序的：先按 `a`，再在相同 `a` 内按 `b`，最后按 `c`。跳过最左列或中间断开时，后面的顺序就接不上了，所以也就用不好这份索引。

Refs:
- sources/refman-8.0-en.pdf (chapter: 8.3.1 B-Tree Index Characteristics)
