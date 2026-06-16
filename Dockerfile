# Build
FROM hugomods/hugo:go-git-0.163.2@sha256:779470c2870268e8a19beb00817582f33ac72cd6cab748939e366f73bf6e68c5 AS builder

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
