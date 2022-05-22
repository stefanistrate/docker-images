FROM nvidia/cuda:11.6.2-cudnn8-runtime-ubuntu20.04

# Change shell.
SHELL ["/bin/bash", "-c"]

# Install additional APT tools.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    software-properties-common

# Install Python.
ENV DEBIAN_FRONTEND=noninteractive
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    python3.9 \
    python3.9-distutils \
    && ln -s $(which python3.9) /usr/local/bin/python3 \
    && ln -s $(which python3.9) /usr/local/bin/python

# Install Pip.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm -rf get-pip.py \
    && python -m pip install --no-cache-dir --upgrade \
    pip \
    setuptools \
    wheel

# Install TCMalloc.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libtcmalloc-minimal4
ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4

# Install additional CUDA packages.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libcupti-dev
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/cuda/lib64:/usr/local/cuda/compat

# Install OpenCV dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libgl1

# Install Git.
RUN add-apt-repository ppa:git-core/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    git

# Install frequently used packages for deep learning.
RUN python -m pip install --no-cache-dir --upgrade \
    absl-py \
    albumentations \
    catboost \
    matplotlib \
    numpy \
    opencv-python-headless \
    pandas \
    Pillow \
    scikit-learn \
    tqdm \
    wandb
