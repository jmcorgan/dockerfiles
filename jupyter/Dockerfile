FROM ubuntu:16.04
label maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

# Miminum packages needed to bootstrap pip
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -qy \
        build-essential \
        libfreetype6-dev \
        libpng-dev \
        pkg-config \
        python-dev \
        python-pip \
        python-setuptools \
        --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip to pip's pip
RUN pip install --upgrade pip \
    && apt-get purge -y python-pip

# Install the basics
RUN pip install \
        notebook\
        jupyter \
        matplotlib \
        numpy \
        --upgrade

# Create an unprivileged user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

# Startup script
COPY start.sh $HOME/start.sh
RUN chmod 755 $HOME/start.sh

# Runtime environment
USER user
WORKDIR $HOME
CMD /home/user/start.sh
