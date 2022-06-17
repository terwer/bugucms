# 依赖的镜像
FROM adoptopenjdk/openjdk11:alpine-jre

#镜像创建者的信息
MAINTAINER terwer "youweics@163.com"

# 设置编码
ENV LANG C.UTF-8

# 设置时区
# ENV TZ Asia/Shanghai
ENV TZ CST-8

VOLUME /tmp
ARG JAR_FILE=target/bugucms-stanalone-2.0.0.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--server.port=8000"]