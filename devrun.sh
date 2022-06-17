# 工作空间
APP_HOME=./target
# 修改APP_NAME为云效上的应用名
APP_NAME=bugucms-stanalone-2.0.0
# 修改APP_PORT为配置文件中的应用端口
APP_PORT=8000

JAR_NAME=${APP_HOME}/${APP_NAME}.jar

# 构建和运行
./mvnw clean package -DskipTests
java -jar ${JAR_NAME} --server.port=${APP_PORT} # jar包的名字

# chmod +x classes/deploy.sh
# sh classes/deploy.sh restart
