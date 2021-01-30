FROM alpine:3.13.1

ARG BUILD_DATE
ARG REVISION
ARG VERSION
ARG IMAGE

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.authors="Markus Breuer"
LABEL org.opencontainers.image.url="https://github.com/bfblog/openssl"
LABEL org.opencontainers.image.documentation="https://github.com/bfblog/openssl/blob/master/README.md"
LABEL org.opencontainers.image.source=""
LABEL org.opencontainers.image.version="${VERSION}" 
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.vendor="bfblog"
LABEL org.opencontainers.image.licenses=""
LABEL org.opencontainers.image.ref.name="${IMAGE}"
LABEL org.opencontainers.image.title="OpenSSL"
LABEL org.opencontainers.image.description="An OpenSSL Docker Image"

RUN apk add openssl=1.1.1i-r0 --no-cache

WORKDIR /workspace

ENTRYPOINT ["openssl"]