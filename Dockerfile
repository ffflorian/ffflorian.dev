# Build
FROM hugomods/hugo:go-git-0.160.0@sha256:dc6c89511ecd2f5d7ff158aaa1de7c89c09e9fcf7d93829748a515f16c78ea48 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:alpine@sha256:5616878291a2eed594aee8db4dade5878cf7edcb475e59193904b198d9b830de

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
