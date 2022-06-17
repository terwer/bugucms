#!/bin/sh
# 构建和运行
./mvnw clean package -DskipTests
docker compose up --build