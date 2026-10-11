SELECT committed_at, snapshot_id, operation
FROM lakekeeper.silver."returned_items$snapshots"
ORDER BY committed_at DESC;
