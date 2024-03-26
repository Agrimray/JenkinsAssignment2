# Use an official Maven image as a base image
FROM maven:3.6.3-openjdk-15-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the Maven project
RUN mvn clean package

# Use an official OpenJDK image as a base image for the runtime environment
FROM openjdk:15-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file built from the previous stage into the container
COPY --from=build /app/target/*.jar app.jar

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
