# 🚀 Strapi (v4) - Docker

<div>
<a href="https://github.com/osama-altamimi/Strapi-Docker"><img alt="Static Badge" title="GitHub" src="https://img.shields.io/badge/GitHub-34567C?style=for-the-badge&logo=github&labelColor=2C4767"></a>
<a href="https://hub.docker.com/r/osama144/strapi/tags"><img alt="Docker Image Version (tag)" title="Container version" src="https://img.shields.io/docker/v/osama144/strapi/latest?style=for-the-badge&logo=docker&logoColor=white&labelColor=1155ba&color=236ad3"></a>
<a href="https://hub.docker.com/r/osama144/strapi"><img alt="Docker Pulls" title="Strapi on Docker Hub" src="https://img.shields.io/docker/pulls/osama144/strapi?style=for-the-badge&logo=docker&logoColor=white&labelColor=1155ba&color=236ad3"></a>
</div>
<br/>

> This is Docker container for [Strapi (v4)](https://github.com/strapi/strapi)

## Example
Using Docker Compose, create `docker-compose.yml` file with the following content:

You can find more example on [GitHub](https://github.com/naskio/docker-strapi/tree/main/examples).
```yml
version: "3.9"
services:
  strapi:
    image: osama144/strapi:latest # or ghcr.io/osama-altamimi/strapi:latest
    container_name: Strapi
    restart: on-failure:5
    ports:
      - 1337:1337
    environment:
      NODE_ENV: development # or production
```

## How to use ?

This image allows you to create a new Strapi project.

- for `NODE_ENV = development`: The command that will run in your project is [`strapi develop`](https://docs.strapi.io/dev-docs/cli#strapi-develop).
- for `NODE_ENV = production`: The command that will run in your project is [`strapi start`](https://docs.strapi.io/dev-docs/cli#strapi-start).

> The [Content-Type Builder](https://strapi.io/features/content-types-builder) plugin is disabled WHEN `NODE_ENV = production`.

## ⚙️ Creating a new strapi project
**Environment Variables**

- `NODE_ENV` The command that will run in your project. | Default > `development`

- `DATABASE_CLIENT` The database client to use, supported by Strapi: (sqlite, postgres, mysql). | Default > `sqlite`

- `DATABASE_HOST` The database host.

- `DATABASE_PORT` The database port.

- `DATABASE_NAME` The database name.

- `DATABASE_USERNAME` The database username.

- `DATABASE_PASSWORD` The database password.

- `DATABASE_SSL` Boolean for SSL. | Default > `false`

## 📚 Official Documentation

- [Resource center](https://strapi.io/resource-center) - Strapi resource center.
- [Strapi documentation](https://docs.strapi.io) - Official Strapi documentation.
- [Strapi tutorials](https://strapi.io/tutorials) - List of tutorials made by the core team and the community.

---

<div align="center">
  <p>This project is a personal effort and is not affiliated with any company ❤️.</p>
</div>
