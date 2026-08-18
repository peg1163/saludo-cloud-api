# Saludo Cloud API

Microservicio sencillo hecho con Spring Boot para la evaluación final de Infraestructura como Código.

## Endpoints

- `GET /hello`: devuelve `Hola, soy Jaime ACuña`.
- `GET /health`: devuelve `OK`.

## Ejecutar localmente

```bash
./gradlew bootRun
```

La aplicación estará disponible en `http://localhost:8080`.

## Ejecutar con Docker

```bash
docker build -t peg1163/saludo-cloud:v1 .
docker run --rm -p 8080:8080 peg1163/saludo-cloud:v1
```

Para cambiar el nombre del saludo:

```bash
docker run --rm -p 8080:8080 \
  -e STUDENT_NAME="Otro nombre" \
  peg1163/saludo-cloud:v1
```
