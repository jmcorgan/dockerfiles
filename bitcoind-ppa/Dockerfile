FROM ubuntu:16.04
label maintainer="Johnathan Corgan <johnathan@corganlabs.com"

# Need this for add-apt-repository
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y \
      software-properties-common \
      --no-install-recommends

# Add bitcoind from PPA repository
RUN DEBIAN_FRONTEND=noninteractive \
    add-apt-repository ppa:bitcoin/bitcoin \
    && apt-get update -q && apt-get install -y \
         bitcoind \
         db4.8 \
         --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Override commandline to use custom config file
ADD bitcoin.conf bitcoin.conf

# Override command line
ENTRYPOINT ["/usr/bin/bitcoind", "-conf /bitcoin.conf", "-printtoconsole"]
