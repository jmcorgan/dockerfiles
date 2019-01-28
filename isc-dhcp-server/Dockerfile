FROM alpine:latest
LABEL maintainer johnathan@corganlabs.com

RUN apk update \
    && apk add dhcp \
    && apk add dumb-init \
    && rm -rf /var/cache/apk/*

RUN mkdir /data
COPY start.sh /
ENTRYPOINT ["/start.sh"]
