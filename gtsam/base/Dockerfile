# Basic Ubuntu 18.04 image with Boost and TBB installed. To be used for building further downstream packages.

# Get the base Ubuntu image from Docker Hub
FROM ubuntu:bionic

# Disable GUI prompts
ENV DEBIAN_FRONTEND noninteractive

# LLVM (clang) 9 is not in Bionic's repositories so we add the official LLVM repository.
RUN LLVM_KEY=15CF4D18AF4F7421 && \
    gpg --keyserver ipv4.pool.sks-keyservers.net --recv-key $LLVM_KEY || gpg --keyserver ha.pool.sks-keyservers.net --recv-key $LLVM_KEY && \
    gpg -a --export $LLVM_KEY | sudo apt-key add - && \
    add-apt-repository -y "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main"

# Update libs on the base image
RUN apt-get -y update && \
    apt-get -y install build-essential apt-utils git cmake software-properties-common pkg-config  libpython3-dev python3-numpy libicu-dev

# Install Boost 1.67
RUN add-apt-repository -y ppa:mhier/libboost-latest && apt-get -y update && apt-get -y install libboost1.67-all-dev
