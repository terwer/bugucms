./mvnw clean package -DskipTests

cd target
java -jar bugucms.jar

# chmod +x classes/deploy.sh
# sh classes/deploy.sh restart