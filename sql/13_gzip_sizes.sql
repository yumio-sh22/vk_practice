SELECT 'gzip_customer' AS table_name,
       round(sum(file_size_in_bytes) / 1048576.0, 3) AS mb
FROM lakekeeper.bronze."gzip_customer$files"
UNION ALL
SELECT 'gzip_orders',
       round(sum(file_size_in_bytes) / 1048576.0, 3)
FROM lakekeeper.bronze."gzip_orders$files"
UNION ALL
SELECT 'gzip_lineitem',
       round(sum(file_size_in_bytes) / 1048576.0, 3)
FROM lakekeeper.bronze."gzip_lineitem$files"
UNION ALL
SELECT 'gzip_nation',
       round(sum(file_size_in_bytes) / 1048576.0, 3)
FROM lakekeeper.bronze."gzip_nation$files";
