# Use OpenJDK 11 as the base image
FROM openjdk:11-jre-slim

EXPOSE 8095

# Copy the compiled JAR file from the target directory to the container
ADD target/devopsassignment.jar devopsassignment.jar

# Expose the port that your Spring Boot application listens on


# Command to run the Spring Boot application when the container starts
ENTRYPOINT ["java", "-jar", "devopsAssignment.jar"]
