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

Después de publicar, el workflow obtiene el digest SHA-256 y llama al workflow
reutilizable del repositorio `peg1163/saludo-cloud-iac`. La conexión queda
registrada en GitHub Actions mediante este contrato:

```text
saludo-cloud-api
    -> GHCR: ghcr.io/peg1163/saludo-cloud@sha256:<digest>
    -> saludo-cloud-iac/.github/workflows/image-contract.yml
    -> validación de Terraform
```

El workflow de IaC valida la referencia recibida, pero no despliega en Azure
sin una aprobación separada de `terraform apply`.
