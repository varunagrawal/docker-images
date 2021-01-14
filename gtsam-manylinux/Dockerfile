FROM quay.io/pypa/manylinux2014_x86_64

# Install packages required for build
RUN yum install -y wget libicu libicu-devel centos-release-scl-rh devtoolset-7-gcc-c++

# Download and install Boost-1.65.1
RUN mkdir -p boost && \
    cd boost && \
    wget -nv https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz && \
    tar xzf boost_1_65_1.tar.gz && \
    cd boost_1_65_1 && \
    ./bootstrap.sh --with-libraries=serialization,filesystem,thread,system,atomic,date_time,timer,chrono,program_options,regex && \
    ./b2 -j$(nproc) cxxflags="-fPIC" runtime-link=static variant=release link=static install

# Clone and build GTSAM
RUN git clone https://github.com/borglab/gtsam.git -b prerelease/4.1.1

WORKDIR gtsam

ENV BUILDDIR="/io/gtsam_build"

WORKDIR /io/gtsam_build

RUN cmake /gtsam -DCMAKE_BUILD_TYPE=Release \
    -DGTSAM_BUILD_TESTS=OFF -DGTSAM_BUILD_UNSTABLE=ON \
    -DGTSAM_USE_QUATERNIONS=OFF \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_ALLOW_DEPRECATED_SINCE_V41=OFF \
    -DCMAKE_INSTALL_PREFIX=$BUILDDIR/../gtsam_install \
    -DBoost_USE_STATIC_LIBS=ON \
    -DBOOST_ROOT=/usr/local \
    -DBoost_NO_SYSTEM_PATHS=ON \
    -DBUILD_STATIC_METIS=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF \
    -DGTSAM_WITH_TBB=OFF

RUN make -j$(nproc) install
