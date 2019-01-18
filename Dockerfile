FROM alpine:3.8

RUN apk add --no-cache --upgrade curl

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["curl"]
