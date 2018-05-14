FROM jcorgan/keras-base
label maintainer="Johnathan Corgan <johnathan@corganlabs.com>"

# Install 
RUN echo Using http_proxy=$http_proxy
RUN pip3 install --proxy=$http_proxy \
    bokeh \
    ggplot \
    h5py \
    leveldb \
    lmdb \
    matplotlib \
    notebook \
    numpy \
    pandas \
    pandoc \
    plotly \
    pydot \
    scipy \
    seaborn \
    sklearn \
    --upgrade
	
# Create an unprivileged user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

# Startup script
#COPY start.sh $HOME/start.sh
#RUN chmod 755 $HOME/start.sh

# Runtime environment
USER user
WORKDIR $HOME
#CMD /home/user/start.sh
