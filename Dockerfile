# 依赖的镜像
FROM openjdk:8-jdk-alpine

#镜像创建者的信息
MAINTAINER terwer "youweics@163.com"

# 设置编码
ENV LANG C.UTF-8

# 设置时区
# ENV TZ Asia/Shanghai
ENV TZ CST-8

VOLUME /tmp
ARG JAR_FILE=bugucms-standalone.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=pro","-jar","/app.jar"]