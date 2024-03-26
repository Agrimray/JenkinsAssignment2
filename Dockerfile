FROM maven:3.6.3-openjdk-15-slim AS build

WORKDIR /app


COPY . .


RUN mvn clean package


FROM openjdk:15-slim


WORKDIR /app


COPY --from=build /app/target/*.jar app.jar


CMD ["java", "-jar", "app.jar"]
