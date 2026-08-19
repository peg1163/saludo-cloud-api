# Saludo Cloud API

Microservicio sencillo hecho con Spring Boot para la evaluación final de Infraestructura como Código.

## Endpoints

- `GET /hello`: devuelve un saludo usando `STUDENT_NAME`.
- `GET /health`: devuelve `OK`.

## Ejecutar localmente

```bash
./gradlew bootRun
```

La aplicación estará disponible en `http://localhost:8080`.

## Ejecutar con Docker

```bash
docker build -t saludo-cloud:local .
docker run --rm -p 8080:8080 saludo-cloud:local
```

Para cambiar el nombre del saludo:

```bash
docker run --rm -p 8080:8080 \
  -e STUDENT_NAME="Otro nombre" \
  saludo-cloud:local
```

El puerto interno también puede configurarse con `SERVER_PORT`. En Azure, Terraform
envía `STUDENT_NAME` y `SERVER_PORT` a la revisión de Container Apps.

## Integración continua

Los pull requests ejecutan las pruebas de Gradle y validan la construcción Docker.
Los cambios aceptados en `main` publican una imagen en GHCR con dos etiquetas:

- `sha-<commit>`, inmutable para despliegues.
- `latest`, solamente para pruebas manuales.

La infraestructura debe desplegar la referencia inmutable de la imagen, nunca
depender solamente de `latest`.
