SELECT c.custkey, c.name, sum(l.extendedprice * (1 - l.discount)) AS revenue,
       c.acctbal, n.name AS nation, c.address, c.phone, c.comment
FROM tpch.sf1.customer AS c
JOIN tpch.sf1.orders AS o ON c.custkey = o.custkey
JOIN tpch.sf1.lineitem AS l ON l.orderkey = o.orderkey
JOIN tpch.sf1.nation AS n ON c.nationkey = n.nationkey
WHERE o.orderdate >= DATE '1993-10-01'
  AND o.orderdate < DATE '1994-01-01'
  AND l.returnflag = 'R'
GROUP BY c.custkey, c.name, c.acctbal, n.name, c.address, c.phone, c.comment
ORDER BY revenue DESC LIMIT 20;

-- Контроль строк и данных после загрузки
SELECT count(*) FROM lakekeeper.gold.top20_returned_customers;
SELECT count(*) FROM lakekeeper.silver.returned_items;
SELECT count(*) FROM lakekeeper.bronze.customer;
SELECT count(*) FROM lakekeeper.bronze.orders;
SELECT count(*) FROM lakekeeper.bronze.lineitem;
SELECT count(*) FROM lakekeeper.bronze.nation;
-- Контроль совпадения результатов , сравнение возвращённых 20 строк в двух первых запросах
SELECT * FROM lakekeeper.gold.top20_returned_customers ORDER BY revenue DESC;
