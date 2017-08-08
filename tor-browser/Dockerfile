FROM ubuntu:16.04
LABEL maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

# Tor project parameters
ENV TOR_VERSION=7.0.4
ENV TOR_RELEASE_FILE=tor-browser-linux64-${TOR_VERSION}_en-US.tar.xz
ENV TOR_RELEASE_URL=https://dist.torproject.org/torbrowser/${TOR_VERSION}/${TOR_RELEASE_FILE}
ENV TOR_RELEASE_KEY=0x4E2C6E8793298290

# Update package repository lists and install dependencies
ARG http_proxy
ENV LANG=C.UTF-8
ENV TERM=linux
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q \
    && apt-get install -y \
        ca-certificates \
        curl \
        file \
        libx11-xcb1 \
        libasound2 \
	libdbus-glib-1-2 \
	libgtk2.0-0 \
	libxrender1 \
	libxt6 \
	xz-utils \
	--no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Download gpg verification keys from public key servers
RUN gpg --keyserver x-hkp://pool.sks-keyservers.net --recv-keys ${TOR_RELEASE_KEY} \
    && gpg --fingerprint ${TOR_RELEASE_KEY} | grep "Key fingerprint ="

# Download, verify, and install tor-browser binary
RUN cd /tmp \
    && curl -SOL ${TOR_RELEASE_URL} \
    && curl -SOL ${TOR_RELEASE_URL}.asc \
    && gpg --verify /tmp/${TOR_RELEASE_FILE}.asc \
    && tar -xJ --strip-components 1 -C /usr/local/bin -f ${TOR_RELEASE_FILE} \
    && rm -rf tor-browser* \
    && rm -rf ~/.gnupg

# Create an unprivileged user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

# Execution environment
USER user
WORKDIR /home/user
ENV PATH="/usr/local/bin/Browser:${PATH}"
CMD ["/usr/local/bin/Browser/start-tor-browser"]
