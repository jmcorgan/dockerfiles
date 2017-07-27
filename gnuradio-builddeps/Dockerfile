FROM ubuntu:16.04
LABEL maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

# Install minimum dependencies to compile GNU Radio
RUN apt-get update -q \
    && mv /sbin/sysctl /sbin/sysctl.orig \
    && ln -sf /bin/true /sbin/sysctl \
    && apt-get install -y \
       build-essential \
       ca-certificates \
       ccache \
       cmake \
       doxygen-latex \
       libboost-date-time-dev \
       libboost-dev \
       libboost-filesystem-dev \
       libboost-program-options-dev \
       libboost-regex-dev \
       libboost-system-dev \
       libboost-test-dev \
       libboost-thread-dev \
       libcanberra-gtk-module \
       libcodec2-dev \
       libcomedi-dev \
       libcppunit-dev \
       libfftw3-dev \
       libgsl0-dev \
       libgsm1-dev \
       liblog4cpp5-dev \
       libsdl1.2-dev \
       libuhd-dev \
       libusb-1.0-0-dev \
       libzmq3-dev \
       portaudio19-dev \
       python-cheetah \
       python-dev \
       python-gtk2 \
       python-lxml \
       python-mako \
       python-matplotlib \
       python-networkx \
       python-numpy \
       python-opengl \
       python-pygraphviz \
       python-scipy \
       python-sphinx \
       python-zmq \
       swig \
       uhd-host \
       wxgtk3.0-dev \
       libqt4-dev \
       libqwt5-qt4 \
       libqwt-dev \
       python-qt4 \
       pyqt4-dev-tools \
       libqwt-qt5-dev \
       qtbase5-dev \
       python-pyqt5 \
       pyqt5-dev-tools \
       --no-install-recommends \
    && rm -f /sbin/sysctl \
    && mv /sbin/sysctl.orig /sbin/sysctl \
    && rm -rf /var/lib/apt/lists/*
