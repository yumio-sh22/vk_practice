SELECT 'ZSTD' AS compression, round(sum(bytes)/1048576.0,3) AS bronze_mb
FROM (
 SELECT sum(file_size_in_bytes) AS bytes FROM lakekeeper.bronze."customer$files"
 UNION ALL SELECT sum(file_size_in_bytes) FROM lakekeeper.bronze."orders$files"
 UNION ALL SELECT sum(file_size_in_bytes) FROM lakekeeper.bronze."lineitem$files"
 UNION ALL SELECT sum(file_size_in_bytes) FROM lakekeeper.bronze."nation$files"
)
UNION ALL
SELECT 'GZIP' AS compression, round(sum(bytes)/1048576.0,3) AS bronze_mb
FROM (
 SELECT sum(file_size_in_bytes) AS bytes FROM lakekeeper.bronze."gzip_customer$files"
 UNION ALL SELECT sum(file_size_in_bytes) FROM lakekeeper.bronze."gzip_orders$files"
 UNION ALL SELECT sum(file_size_in_bytes) FROM lakekeeper.bronze."gzip_lineitem$files"
 UNION ALL SELECT sum(file_size_in_bytes) FROM lakekeeper.bronze."gzip_nation$files"
);
