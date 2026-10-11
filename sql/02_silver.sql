-- Фильтр IV квартала 1993 и возвращённых позиций, объединение четырёх источников
SET SESSION lakekeeper.compression_codec = 'ZSTD';
CREATE TABLE lakekeeper.silver.returned_items
WITH (format = 'PARQUET') AS
SELECT c.custkey, c.name, c.acctbal, n.name AS nation,
       c.address, c.phone, c.comment,
       o.orderkey, o.orderdate, l.extendedprice, l.discount
FROM lakekeeper.bronze.customer c
JOIN lakekeeper.bronze.orders o ON c.custkey = o.custkey
JOIN lakekeeper.bronze.lineitem l ON l.orderkey = o.orderkey
JOIN lakekeeper.bronze.nation n ON c.nationkey = n.nationkey
WHERE o.orderdate >= DATE '1993-10-01'
  AND o.orderdate < DATE '1994-01-01'
  AND l.returnflag = 'R';
