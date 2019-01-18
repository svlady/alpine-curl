FROM alpine:3.8

ARG PKG_VERSION
ENV PKG_VERSION ${PKG_VERSION:-7.61.1-r1}

RUN apk add --no-cache --upgrade curl="$PKG_VERSION"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["curl"]
