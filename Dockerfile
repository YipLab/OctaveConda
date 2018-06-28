# Base image with compatible CUDA and CUDNN drivers for Tensorflow 1.4.0
FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

RUN apt-get update && apt-get install -y

# Install octave and octave-forge packages
RUN apt-get install -y \
  octave \
  octave-control \
  octave-image \
  octave-io \ 
  octave-optim \
  octave-signal \
  octave-statistics 

# Install Anaconda
RUN apt-get update && \
    apt-get install -y wget bzip2 ca-certificates && \
    rm -rf /var/lib/apt/lists/*
RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

# Install missing libgl1-mesa-glx
RUN apt update && apt install libgl1-mesa-glx -y

ENV PATH /root/anaconda3/bin:$PATH

# Configuring access to Jupyter
RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py
# Jupyter listens port: 8888
EXPOSE 8888
