FROM nvidia/cuda
label maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

# Miminum packages needed to bootstrap pip
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -qy \
        build-essential \
        libfreetype6-dev \
        libpng-dev \
        pkg-config \
        python3-dev \
        python3-pip \
        python3-setuptools \
        --no-install-recommends \
    && apt-get clean

# Upgrade pip to pip's pip
RUN pip3 install --upgrade pip \
    && apt-get purge -y python3-pip

# Install needed binary packages from Ubuntu
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -qy \
       libcudnn7-dev \
       --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Keras with TensorFlow backend support
RUN pip3 install \
        tensorflow-gpu \
        keras \
        --upgrade
