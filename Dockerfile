# Build
FROM hugomods/hugo:go-git-0.161.1@sha256:0b4c95b5b1fbd243c2b5d83c422ec0dec7bbf3afeb6aa678fd17ffb61ec47054 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:1.31.1-alpine@sha256:d1aedbc848110c391df415b27a241ea36159e63b51b151c29ab059867f9f5174

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
