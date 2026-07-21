# Build
FROM hugomods/hugo:go-git-0.164.0@sha256:aef0d2f3361bbc92eb45c6dab4085a173c7257935128436acef94dd9a8be1ece AS builder

ARG COMMIT
ARG VERSION

ENV HUGO_COMMIT=$COMMIT
ENV HUGO_VERSION=$VERSION

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:1.31.3-alpine@sha256:4a73073bd557c65b759505da037898b61f1be6cbcc3c2c3aeac22d2a470c1752

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
