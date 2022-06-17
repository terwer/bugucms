#!/bin/sh
# 构建和运行
./mvnw clean package -DskipTests

# 注意：生产环境这里需要清理工作目录

cd target
pwd
mv ./classes/Dockerfile ./Dockerfile
mv ./classes/docker-compose.yml ./docker-compose.yml
pwd
ls -l

docker compose down
docker compose up -d --build
echo "check docker status=>"
docker ps
