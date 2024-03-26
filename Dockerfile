# Use OpenJDK 11 as the base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from the target directory to the container
COPY target/devopsAssignment-0.0.1-SNAPSHOT.jar /app/devopsAssignment.jar

# Expose the port that your Spring Boot application listens on
EXPOSE 8095

# Command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "devopsAssignment.jar"]
