# gomeet-go-swagger

[go-swagger](https://github.com/go-swagger/go-swagger) dockerfile for gomeet microservices

Available from docker hub as [gomeet/gomeet-go-swagger](https://hub.docker.com/r/gomeet/gomeet-go-swagger/).

## Usage with a regular gomeet-<SERVICE_NAME>

### In docker-compose

```yaml
version: "3"

networks:
  grpc:
    driver: bridge
  http:
    driver: bridge
services:
  svc:
    image: gomeet/gomeet-echo:${TAG}
    networks:
      - grpc
      - http
  go-swagger:
    container_name: go-swagger
    image: gomeet/gomeet-go-swagger
    depends_on:
      - svc
    command: [ "serve", "http://svc:13000/api/v1/swagger.json" ]
    ports:
      - 8000:80
    networks:
      - http
```

### Docker cli

```bash
docker run \
       --rm gomeet/gomeet-go-swagger \
       serve http://localhost:13000/api/v1/swagger.json
```

## Build

Requirements :

  * [Docker](https://docs.docker.com/engine/installation/) of course

```bash
make
```

## Publish

Requirements :

  * [Docker](https://docs.docker.com/engine/installation/) of course

```bash
make push
```
