# Build
FROM hugomods/hugo:go-git-0.161.1@sha256:0b4c95b5b1fbd243c2b5d83c422ec0dec7bbf3afeb6aa678fd17ffb61ec47054 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:alpine@sha256:5616878291a2eed594aee8db4dade5878cf7edcb475e59193904b198d9b830de

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
