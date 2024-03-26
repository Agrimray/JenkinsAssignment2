FROM openjdk:11-jre-slim
EXPOSE 8095
ADD target/devopsAssignment-0.0.1-SNAPSHOT.jar devopsassignment.jar
ENTRYPOINT ["java", "-jar", "/devopsassignment.jar"]
