FROM gtsam-manylinux:latest

# Disable GUI prompts
ENV DEBIAN_FRONTEND noninteractive

# # Install gcc-7
# RUN wget -q http://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-7.5.0/gcc-7.5.0.tar.gz
# RUN tar -xf gcc-7.5.0.tar.gz
# WORKDIR /gcc-7.5.0
# RUN ./contrib/download_prerequisites
# # WORKDIR /gcc-7.5.0/build
# RUN ./configure --disable-multilib 
# RUN make -j8 && make install

# RUN update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/gcc 100
# RUN update-alternatives --install /usr/bin/g++ g++ /usr/local/bin/g++ 100


# Build GTSAM
RUN git clone https://github.com/borglab/gtsam.git -b develop /gtsam

WORKDIR /gtsam/build

RUN cmake /gtsam \
    -DCMAKE_BUILD_TYPE=Release \
    -DGTSAM_BUILD_TESTS=-OFF \
    -DGTSAM_BUILD_UNSTABLE=ON \
    -DGTSAM_WITH_TBB=OFF \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_ALLOW_DEPRECATED_SINCE_V41=OFF \
    -DGTSAM_USE_QUATERNIONS=OFF \
    -DGTSAM_ROT3_EXPMAP=ON \
    -DGTSAM_POSE3_EXPMAP=ON \
    -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF
RUN make -j4 install

# Install sdformat8
RUN yum install -y ruby-devel tinyxml-devel eigen3-devel

RUN git clone https://github.com/ignitionrobotics/ign-cmake.git -b ign-cmake2 /ign-cmake2
WORKDIR /ign-cmake2/build
RUN cmake /ign-cmake2 && make -j4 install

WORKDIR /
RUN git clone https://github.com/ignitionrobotics/ign-math.git -b ign-math6 /ign-math6
WORKDIR /ign-math6/build
RUN cmake /ign-math6 && make -j4 install

WORKDIR /
RUN git clone https://github.com/ignitionrobotics/ign-tools.git -b ign-tools0 /ign-tools0
WORKDIR /ign-tools0/build
RUN cmake /ign-tools0 && make -j4 install

WORKDIR /
RUN wget http://osrf-distributions.s3.amazonaws.com/sdformat/releases/sdformat-8.6.1.tar.bz2
RUN tar -xvjf sdformat-8.6.1.tar.bz2

WORKDIR /sdformat-8.6.1/build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr && make -j4 install

WORKDIR /
