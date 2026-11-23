# Build
FROM hugomods/hugo:go-git-0.165.0@sha256:1ed608105d52c678d3280bf0c23f4e76286bfb514233cf3c537e906c202cb8ee AS builder

ARG COMMIT
ARG VERSION

ENV HUGO_COMMIT=$COMMIT
ENV HUGO_VERSION=$VERSION

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:1.31.9-alpine-slim@sha256:5bfced78d24d644270bedb0a9968697042e38d5c03fb6354603df025279c1cbe

# hadolint ignore=DL3017
RUN apk upgrade --no-cache

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
