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

HEALTHCHECK --interval=30s --timeout=3s --start-period=20s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
