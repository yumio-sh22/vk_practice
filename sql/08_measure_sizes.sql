SELECT 'bronze.customer' AS table_name, count(*) AS files,
round(coalesce(sum(file_size_in_bytes),0)/1048576.0,3) AS mb
FROM lakekeeper.bronze."customer$files"
UNION ALL
SELECT 'bronze.orders' AS table_name, count(*) AS files,
round(coalesce(sum(file_size_in_bytes),0)/1048576.0,3) AS mb
FROM lakekeeper.bronze."orders$files"
UNION ALL
SELECT 'bronze.lineitem' AS table_name, count(*) AS files,
round(coalesce(sum(file_size_in_bytes),0)/1048576.0,3) AS mb
FROM lakekeeper.bronze."lineitem$files"
UNION ALL
SELECT 'bronze.nation' AS table_name, count(*) AS files,
round(coalesce(sum(file_size_in_bytes),0)/1048576.0,3) AS mb
FROM lakekeeper.bronze."nation$files"
UNION ALL
SELECT 'silver.returned_items' AS table_name, count(*) AS files,
round(coalesce(sum(file_size_in_bytes),0)/1048576.0,3) AS mb
FROM lakekeeper.silver."returned_items$files"
UNION ALL
SELECT 'gold.top20_returned_customers' AS table_name, count(*) AS files,
round(coalesce(sum(file_size_in_bytes),0)/1048576.0,3) AS mb
FROM lakekeeper.gold."top20_returned_customers$files";
