FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY target/DigitalCars-0.0.1-SNAPSHOT.jar DigitalCars-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "DigitalCars-0.0.1-SNAPSHOT.jar"]