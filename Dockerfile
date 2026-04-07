# Build
FROM hugomods/hugo:base-non-root-0.108.0 AS builder

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
