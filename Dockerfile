FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy the Gradle artifact into the container at /app
COPY build/libs/*.jar app.jar

# Add OpenTelemetry Agent
RUN apt-get update
RUN apt install curl -y
RUN curl -L https://github.com/aws-observability/aws-otel-java-instrumentation/releases/download/v1.19.2/aws-opentelemetry-agent.jar --output opentelemetry-javaagent-all.jar

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-javaagent:opentelemetry-javaagent-all.jar", "-jar", "app.jar"]