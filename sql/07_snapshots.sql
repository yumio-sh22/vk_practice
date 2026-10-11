SELECT committed_at, snapshot_id, operation
FROM lakekeeper.silver."returned_items$snapshots"
ORDER BY committed_at DESC;

SELECT count(*) FROM lakekeeper.silver.returned_items FOR VERSION AS OF 1790828416848786939;
-- Сохранение восстановленной копии (по данным снимка, без разрушения текущей таблицы):
CREATE TABLE lakekeeper.silver.returned_items_restored WITH (format = 'PARQUET') AS
SELECT * FROM lakekeeper.silver.returned_items FOR VERSION AS OF 1790828416848786939;
