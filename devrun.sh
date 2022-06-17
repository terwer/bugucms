#!/bin/sh
# 构建和运行
./mvnw clean package -DskipTests

cd target
pwd
mv ./classes/Dockerfile ./Dockerfile
mv ./classes/docker-compose.yml ./docker-compose.yml
pwd
ls -l

docker compose up --build
