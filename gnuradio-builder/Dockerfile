FROM jcorgan/gnuradio-builddeps
LABEL maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

#RUN apt-get update -q \
#    && apt-get install -y \
#       git \
#       --no-install-recommends \
#    && rm -rf /var/lib/apt/lists/*

# Add an unprivileged user and switch to that
RUN useradd -ms /bin/bash user
USER user
ENV HOME /home/user
WORKDIR /home/user

ADD .bashrc .bashrc
ADD .buildrc .buildrc
ADD build.sh build.sh
ENTRYPOINT ["/bin/bash", "-c", "/home/user/build.sh"]
