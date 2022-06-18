#!/bin/sh
# ！！！ 注意 ！！！
# 本脚本仅仅在云效的部署阶段参考，不保证本地运行成功
# ！！！ 注意 ！！！

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
docker compose up --build
echo "check docker status=>"
docker ps
