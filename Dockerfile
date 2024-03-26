# Use OpenJDK 11 as the base image
FROM openjdk:11-jre-slim



# Copy the compiled JAR file from the target directory to the container
ADD target/devopsAssignment-0.0.1-SNAPSHOT.jar devopsassignment.jar

# Expose the port that your Spring Boot application listens on
EXPOSE 8080

# Command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "devopsAssignment.jar"]
