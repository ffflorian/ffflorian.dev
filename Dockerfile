ARG COMMIT=unknown
ARG VERSION=unknown

# Build
FROM hugomods/hugo:go-git-0.162.1@sha256:0d7e48d4c3594c812224ecb75de4a8a3b26b259822a6b3494f93463bd650c415 AS builder

ARG COMMIT
ARG VERSION
ENV HUGO_COMMIT=$COMMIT
ENV HUGO_VERSION=$VERSION

WORKDIR /app

COPY . ./

RUN hugo --minify

# Serve
FROM nginx:1.31.1-alpine@sha256:8b1e78743a03dbb2c95171cc58639fef29abc8816598e27fb910ed2e621e589a

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
