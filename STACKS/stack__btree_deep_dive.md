# Stack: B+Tree Deep Dive

Scope: 从 MySQL 索引查询的角度解释 B+Tree 的结构、根到叶定位、范围扫描；再连接到 InnoDB 的页、分裂、聚簇索引、二级索引、回表与覆盖索引；最后用 B-Tree、Hash、二叉树/红黑树做最小对比收束。

## Read First
- [[STACKS/stack__index_core]]
- [[CARDS/index__btree_basics]]

## Cards

### Problem / Shape
- [[CARDS/index__btree_overview_shape]]

### Node Roles
- [[CARDS/index__btree_internal_nodes_as_directory]]
- [[CARDS/index__btree_leaf_nodes_hold_entries]]

### Lookup Path
- [[CARDS/index__btree_balance_for_lookup]]
- [[CARDS/index__btree_equality_lookup_walkthrough]]
- [[CARDS/index__btree_range_lookup_start]]
- [[CARDS/index__btree_leaf_link_for_range_scan]]

## Deeper: Storage / Maintenance
- [[CARDS/index__innodb_page_minimal]]
- [[CARDS/index__btree_node_as_page]]
- [[CARDS/index__btree_high_fanout]]
- [[CARDS/index__btree_page_split_minimal]]
- [[CARDS/index__btree_sequential_primary_key]]

## InnoDB Index Path
- [[CARDS/index__clustered_vs_secondary]]
- [[CARDS/index__covering_index_vs_back_to_table]]

## Why B+Tree
- [[CARDS/index__bplus_tree_vs_btree]]
- [[CARDS/index__bplus_tree_vs_hash_and_binary]]

## Read (embed)
![[CARDS/index__btree_overview_shape]]
![[CARDS/index__btree_internal_nodes_as_directory]]
![[CARDS/index__btree_leaf_nodes_hold_entries]]
![[CARDS/index__btree_balance_for_lookup]]
![[CARDS/index__btree_equality_lookup_walkthrough]]
![[CARDS/index__btree_range_lookup_start]]
![[CARDS/index__btree_leaf_link_for_range_scan]]

---

## Deeper: Storage / Maintenance

![[CARDS/index__innodb_page_minimal]]
![[CARDS/index__btree_node_as_page]]
![[CARDS/index__btree_high_fanout]]
![[CARDS/index__btree_page_split_minimal]]
![[CARDS/index__btree_sequential_primary_key]]

---

## InnoDB Index Path

![[CARDS/index__clustered_vs_secondary]]
![[CARDS/index__covering_index_vs_back_to_table]]

---

## Why B+Tree

![[CARDS/index__bplus_tree_vs_btree]]
![[CARDS/index__bplus_tree_vs_hash_and_binary]]

## Evidence
- [[sources/refman-8.0-en.pdf]] (chapter: 8.3.1 B-Tree Index Characteristics)
- [[sources/JavaGuide-mysql/mysql-index.md]] (sections: 索引介绍; B 树& B+ 树)
- [[sources/JavaGuide-mysql/mysql-questions-01.md]] (section: MySQL 索引)
