-- This file is automatically generated by LogicalPlanToSQLSuite.
SELECT t.key - 5, cnt, SUM(cnt)
FROM (SELECT x.key, COUNT(*) as cnt
FROM parquet_t1 x JOIN parquet_t1 y ON x.key = y.key GROUP BY x.key) t
GROUP BY cnt, t.key - 5
WITH ROLLUP
--------------------------------------------------------------------------------
SELECT `gen_attr_3` AS `(key - CAST(5 AS BIGINT))`, `gen_attr_0` AS `cnt`, `gen_attr_4` AS `sum(cnt)` FROM (SELECT (`gen_attr_6` - CAST(5 AS BIGINT)) AS `gen_attr_3`, `gen_attr_5` AS `gen_attr_0`, sum(`gen_attr_5`) AS `gen_attr_4` FROM (SELECT `gen_attr_6`, count(1) AS `gen_attr_5` FROM (SELECT `key` AS `gen_attr_6`, `value` AS `gen_attr_10` FROM `default`.`parquet_t1`) AS gen_subquery_0 INNER JOIN (SELECT `key` AS `gen_attr_9`, `value` AS `gen_attr_11` FROM `default`.`parquet_t1`) AS gen_subquery_1 ON (`gen_attr_6` = `gen_attr_9`) GROUP BY `gen_attr_6`) AS t GROUP BY `gen_attr_5`, (`gen_attr_6` - CAST(5 AS BIGINT)) GROUPING SETS((`gen_attr_5`, (`gen_attr_6` - CAST(5 AS BIGINT))), (`gen_attr_5`), ())) AS gen_subquery_2
