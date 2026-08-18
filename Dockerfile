FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /workspace

COPY gradlew build.gradle settings.gradle ./
COPY gradle gradle
COPY src src

RUN chmod +x gradlew && ./gradlew clean bootJar --no-daemon

FROM eclipse-temurin:21-jre-alpine

RUN addgroup -S app && adduser -S app -G app

WORKDIR /app

COPY --from=build --chown=app:app /workspace/build/libs/*.jar app.jar

USER app

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
