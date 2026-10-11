SET SESSION lakekeeper.compression_codec = 'ZSTD';

CREATE TABLE lakekeeper.bronze.customer
WITH (format = 'PARQUET') AS
SELECT custkey, name, acctbal, nationkey, address, phone, comment FROM tpch.sf1.customer;

CREATE TABLE lakekeeper.bronze.orders
WITH (format = 'PARQUET') AS
SELECT orderkey, custkey, orderdate FROM tpch.sf1.orders;

CREATE TABLE lakekeeper.bronze.lineitem
WITH (format = 'PARQUET') AS
SELECT orderkey, extendedprice, discount, returnflag FROM tpch.sf1.lineitem;

CREATE TABLE lakekeeper.bronze.nation
WITH (format = 'PARQUET') AS
SELECT nationkey, name FROM tpch.sf1.nation;
