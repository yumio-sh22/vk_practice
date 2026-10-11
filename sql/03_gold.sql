-- Эквивалент Q10 для выбранного среза данных
SET SESSION lakekeeper.compression_codec = 'ZSTD';
CREATE TABLE lakekeeper.gold.top20_returned_customers
WITH (format = 'PARQUET') AS
SELECT custkey, name,
       sum(extendedprice * (1 - discount)) AS revenue,
       acctbal, nation, address, phone, comment
FROM lakekeeper.silver.returned_items
GROUP BY custkey, name, acctbal, nation, address, phone, comment
ORDER BY revenue DESC
LIMIT 20;

SELECT * FROM lakekeeper.gold.top20_returned_customers ORDER BY revenue DESC;
