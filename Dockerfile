FROM openjdk:17-jdk-slim
WORKDIR /app

COPY gradle/wrapper gradle/wrapper
COPY gradlew .

COPY build.gradle .
COPY settings.gradle .
COPY src ./src

RUN ./gradlew build

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]




