FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["/bin/sh", "-c", "echo ---DATASOURCE_URL=$SPRING_DATASOURCE_URL--- && echo ---DATASOURCE_USERNAME=$SPRING_DATASOURCE_USERNAME--- && exec java -jar app.jar"]