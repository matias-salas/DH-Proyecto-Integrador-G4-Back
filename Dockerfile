FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY target/digitalcars-0.0.1-SNAPSHOT.jar digitalcars-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "digitalcars-0.0.1-SNAPSHOT.jar"]