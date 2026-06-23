# Build
FROM hugomods/hugo:go-git-0.163.3@sha256:13f19a0c5ef993ad88834526901c5df5dcaa26b4936fde0a50dcd3d80b51d275 AS builder

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
