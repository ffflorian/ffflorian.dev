# Build
FROM hugomods/hugo:go-git-0.160.1@sha256:305a2a1c76007e72ed67cd71a4d202821325d600c7f85778fc8f269939077047 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:alpine@sha256:5616878291a2eed594aee8db4dade5878cf7edcb475e59193904b198d9b830de

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
