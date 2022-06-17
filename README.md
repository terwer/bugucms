# bugucms
light-weight cms

## note

The whole project is refactored with Spring Boot 2.7.0

## dev and deploy via docker(recommeneded)
```
docker-compose up --build
```

or
```
docker-compose up -d --build
```

## build
```bash
./mvnw clean package -DskipTests
```

## dev
```bash
./devrun.sh
```

## deploy 
```bash
./deploy.sh
```



