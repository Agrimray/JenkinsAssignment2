FROM openjdk:11-jre-slim
EXPOSE 8095
ADD target/devopsAssignment-0.0.1-SNAPSHOT.jar devopsAssignment.jar
ENTRYPOINT ["java", "-jar", "/devopsAssignment.jar"]
