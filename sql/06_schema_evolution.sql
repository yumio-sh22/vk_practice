ALTER TABLE lakekeeper.silver.returned_items ADD COLUMN note varchar;
SHOW COLUMNS FROM lakekeeper.silver.returned_items;
SELECT note FROM lakekeeper.silver.returned_items LIMIT 5;

ALTER TABLE lakekeeper.silver.returned_items DROP COLUMN note;
