FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

RUN apt-get update && apt-get install -y

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
