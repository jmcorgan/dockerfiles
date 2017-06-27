FROM ubuntu:16.04
LABEL maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

# Get Tor project signing key
RUN gpg --keyserver keys.gnupg.net --recv-keys 886DDD89

# Add key to apt-key keyring
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 \
    | apt-key --keyring /etc/apt/trusted.gpg add -

# Add repository to apt
RUN echo "deb http://deb.torproject.org/torproject.org xenial main" \
    > /etc/apt/sources.list.d/torproject.org.list

ARG http_proxy
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy \
       tor \
       tor-arm \
       --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 9050/tcp 9040/tcp 5300/udp
VOLUME ["/etc/tor"]
VOLUME ["/var/lib/tor"]

CMD ["/usr/bin/tor"]
