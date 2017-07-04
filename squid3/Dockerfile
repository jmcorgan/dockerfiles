FROM alpine:latest
LABEL maintainer johnathan@corganlabs.com

RUN apk update \
    && apk add squid \
    && apk add curl \
    && apk add dumb-init \
    && rm -rf /var/cache/apk/*

COPY start.sh /
ADD  etc /etc

VOLUME /etc/squid
VOLUME /var/cache/squid
VOLUME /var/log/squid

EXPOSE 3128

ENTRYPOINT ["/start.sh"]
