New-Item -ItemType Directory -Force spark/jars | Out-Null
Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.7.1/iceberg-spark-runtime-3.5_2.12-1.7.1.jar' -OutFile 'spark/jars/iceberg-spark-runtime-3.5_2.12-1.7.1.jar'
Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-aws-bundle/1.7.1/iceberg-aws-bundle-1.7.1.jar' -OutFile 'spark/jars/iceberg-aws-bundle-1.7.1.jar'
