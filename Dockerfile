# install node
ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine

# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# The environment in which the application is running
ENV NODE_ENV=${NODE_ENV}

# Database
ENV DATABASE_CLIENT=${DATABASE_CLIENT}
ENV DATABASE_HOST=${DATABASE_HOST}
ENV DATABASE_PORT=${DATABASE_PORT}
ENV DATABASE_NAME=${DATABASE_NAME}
ENV DATABASE_USERNAME=${DATABASE_USERNAME}
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}
ENV DATABASE_SSL=${DATABASE_SSL}

# App KEYS
ARG APP_KEYS
ARG ADMIN_JWT_SECRET
ARG API_TOKEN_SALT
ARG TRANSFER_TOKEN_SALT
ARG JWT_SECRET
ENV APP_KEYS=${APP_KEYS}
ENV ADMIN_JWT_SECRET=${ADMIN_JWT_SECRET}
ENV API_TOKEN_SALT=${API_TOKEN_SALT}
ENV TRANSFER_TOKEN_SALT=${TRANSFER_TOKEN_SALT}
ENV JWT_SECRET=${JWT_SECRET}

# Application files
WORKDIR /app

# Copy package files
COPY scripts/package.json ./

# install packages
RUN npm install

# Copy strapi project files
COPY scripts/config/ config/
COPY scripts/public/ public/
COPY scripts/src/ src/
COPY scripts/favicon.png ./

# Set permissions and change user
ARG PUID=node
ENV PUID=${PUID}
ARG PGID=node
ENV PGID=${PGID}
RUN chown -R ${PUID}:${PGID} /app
USER ${PUID}:${PGID}

# Build the application
RUN npm run build

# Expose the application port
EXPOSE 1337

# Start the application
CMD if [ "$NODE_ENV" = "production" ]; then npm run start; elif [ "$NODE_ENV" = "development" ]; then npm run develop; else npm run develop; fi