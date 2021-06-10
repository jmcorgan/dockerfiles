FROM ubuntu:20.04
LABEL maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

ARG http_proxy

# Update and install gpg
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy \
       gnupg \
       curl \
       ca-certificates \
       --no-install-recommends

# Get Tor project signing key
RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import \
    && gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key --keyring /etc/apt/trusted.gpg add -

# Add repository to apt
RUN echo "deb http://deb.torproject.org/torproject.org focal main" \
    > /etc/apt/sources.list.d/torproject.org.list

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy \
       tor \
       nyx \
       --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 9050/tcp 9040/tcp 5300/udp
VOLUME ["/etc/tor"]
VOLUME ["/var/lib/tor"]

CMD ["/usr/bin/tor"]
