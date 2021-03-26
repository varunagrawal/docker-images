# Basic Ubuntu 18.04 image with Boost and TBB installed. To be used for building further downstream packages.

# Get the base Ubuntu image from Docker Hub
FROM ubuntu:bionic

# Disable GUI prompts
ENV DEBIAN_FRONTEND noninteractive

# Update apps on the base image
RUN apt-get -y update && apt-get -y install build-essential apt-utils git cmake software-properties-common

# Install Boost 1.67
RUN add-apt-repository -y ppa:mhier/libboost-latest && apt-get -y update && apt-get -y install libboost1.67-dev

# Clone GTSAM (develop branch)
WORKDIR /usr/src/
RUN git clone --single-branch --branch develop https://github.com/borglab/gtsam.git

# Change to build directory. Will be created automatically.
WORKDIR /usr/src/gtsam/build

# Run cmake
RUN cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DGTSAM_WITH_EIGEN_MKL=OFF \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_BUILD_TIMING_ALWAYS=OFF \
    -DGTSAM_BUILD_TESTS=OFF \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_WITH_TBB=OFF \
    ..

# Build
RUN make -j2 install && make clean

# Needed to link with GTSAM
RUN echo 'export LD_LIBRARY_PATH=/usr/local/lib:LD_LIBRARY_PATH' >> /root/.bashrc

# Run bash
CMD ["bash"]
