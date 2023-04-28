FROM maven:3.11.0-jdk-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM openjdk:17-jdk-slim
COPY --from=build /target/DogManagementSystem-0.0.1-SNAPSHOT.jar DogManagementSystem.jar
CMD ["java", "-jar", "DogManagementSystem.jar"]