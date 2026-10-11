 docker run -it --rm `
  -v "${PWD}/spark/conf:/opt/spark/conf" `
  -v "${PWD}/spark/jars:/opt/spark/iceberg-jars" `
  apache/spark:3.5.3 /opt/spark/bin/spark-sql

