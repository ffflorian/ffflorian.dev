# Build
FROM hugomods/hugo:go-git-0.161.1@sha256:0b4c95b5b1fbd243c2b5d83c422ec0dec7bbf3afeb6aa678fd17ffb61ec47054 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:1.31.0-alpine@sha256:dc48b7a872a79fb541ba5081d320b11b549231bc63ba465a7495afaa7d2ebcb8

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
