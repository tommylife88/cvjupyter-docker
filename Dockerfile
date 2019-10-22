FROM jupyter/base-notebook

LABEL maintainer "thatta"

# Set environment
ENV TERM xterm
ENV LC_ALL=C.UTF-8
ENV LANG C.UTF-8

USER root
RUN apt-get update && \
    apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6

# Jupyter
USER jovyan
RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master \
    jupyter_nbextensions_configurator \
    pillow \
    opencv-python \
    matplotlib \
    numpy \
    ipywidgets

RUN jupyter contrib nbextension install --user && jupyter nbextensions_configurator enable --user

# Clean cache.
USER root
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
#    rm -rf /tmp/*