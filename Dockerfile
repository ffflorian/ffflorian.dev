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
FROM nginx:1.31.2-alpine@sha256:54f2a904c251d5a34adf545a72d32515a15e08418dae0266e23be2e18c66fefa

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
