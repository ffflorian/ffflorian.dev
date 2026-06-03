# Build
FROM hugomods/hugo:go-git-0.162.1@sha256:0d7e48d4c3594c812224ecb75de4a8a3b26b259822a6b3494f93463bd650c415 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:1.31.1-alpine@sha256:d1aedbc848110c391df415b27a241ea36159e63b51b151c29ab059867f9f5174

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
