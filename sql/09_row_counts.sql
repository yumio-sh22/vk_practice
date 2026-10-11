SELECT 'bronze.customer' AS table_name, count(*) AS rows_count FROM lakekeeper.bronze.customer
UNION ALL
SELECT 'bronze.orders' AS table_name, count(*) AS rows_count FROM lakekeeper.bronze.orders
UNION ALL
SELECT 'bronze.lineitem' AS table_name, count(*) AS rows_count FROM lakekeeper.bronze.lineitem
UNION ALL
SELECT 'bronze.nation' AS table_name, count(*) AS rows_count FROM lakekeeper.bronze.nation
UNION ALL
SELECT 'silver.returned_items' AS table_name, count(*) AS rows_count FROM lakekeeper.silver.returned_items
UNION ALL
SELECT 'gold.top20_returned_customers' AS table_name, count(*) AS rows_count FROM lakekeeper.gold.top20_returned_customers;
