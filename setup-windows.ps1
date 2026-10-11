# Использовать из корня репозитория, PowerShell, Docker Desktop запущен.
# Повторный запуск docker run при существующем контейнере вызовет ошибку имени;
# в этом случае проверь docker ps -a и docker start <имя>.
docker run -d --name lakehouse-minio `
 -p 9000:9000 -p 9001:9001 `
 -e MINIO_ROOT_USER=minioadmin -e MINIO_ROOT_PASSWORD=minioadmin `
 -v minio-data:/data pgsty/silo:latest server /data --console-address ":9001"
docker run --rm --entrypoint /bin/sh pgsty/mc:latest -c "mc alias set m http://host.docker.internal:9000 minioadmin minioadmin && mc mb --ignore-existing m/warehouse"
docker run -d --name lakehouse-pg `
 -e POSTGRES_PASSWORD=postgres -p 5432:5432 `
 -v pg-data:/var/lib/postgresql/data postgres:17
# Дождись статуса accepting connections:
docker exec lakehouse-pg pg_isready
docker run --rm `
 -e 'LAKEKEEPER__PG_ENCRYPTION_KEY=This-is-NOT-Secure!' `
 -e 'LAKEKEEPER__PG_DATABASE_URL_READ=postgresql://postgres:postgres@host.docker.internal:5432/postgres' `
 -e 'LAKEKEEPER__PG_DATABASE_URL_WRITE=postgresql://postgres:postgres@host.docker.internal:5432/postgres' `
 quay.io/lakekeeper/catalog:latest-main migrate
docker run -d --name lakekeeper `
 -e 'LAKEKEEPER__PG_ENCRYPTION_KEY=This-is-NOT-Secure!' `
 -e 'LAKEKEEPER__PG_DATABASE_URL_READ=postgresql://postgres:postgres@host.docker.internal:5432/postgres' `
 -e 'LAKEKEEPER__PG_DATABASE_URL_WRITE=postgresql://postgres:postgres@host.docker.internal:5432/postgres' `
 -p 8181:8181 quay.io/lakekeeper/catalog:latest-main serve
curl.exe -X POST http://localhost:8181/management/v1/bootstrap `
 -H 'Content-Type: application/json' -d '{"accept-terms-of-use": true}'
curl.exe -X POST http://localhost:8181/management/v1/warehouse `
 -H 'Content-Type: application/json' -d '@create-warehouse.json'
docker run -d --name trino `
 -p 8080:8080 `
 -v "${PWD}/catalog:/etc/trino/catalog" trinodb/trino:476
# Подожди готовности Trino, затем:
docker ps
docker exec trino trino --execute 'SHOW CATALOGS'
