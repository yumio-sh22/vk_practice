SET SESSION lakekeeper.compression_codec = 'GZIP';

CREATE TABLE lakekeeper.bronze.gzip_customer
WITH (format = 'PARQUET') AS
SELECT * FROM lakekeeper.bronze.customer;

CREATE TABLE lakekeeper.bronze.gzip_orders
WITH (format = 'PARQUET') AS
SELECT * FROM lakekeeper.bronze.orders;

CREATE TABLE lakekeeper.bronze.gzip_lineitem
WITH (format = 'PARQUET') AS
SELECT * FROM lakekeeper.bronze.lineitem;

CREATE TABLE lakekeeper.bronze.gzip_nation
WITH (format = 'PARQUET') AS
SELECT * FROM lakekeeper.bronze.nation;