FROM openjdk:11-jre-slim
EXPOSE 8095
ADD target/devopsassignment.jar devopsassignment.jar
ENTRYPOINT ["java", "-jar", "/devopsassignment.jar"]
