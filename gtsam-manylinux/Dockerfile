FROM quay.io/pypa/manylinux_2_24_x86_64

# Install packages required for build
# RUN yum install -y wget libicu libicu-devel centos-release-scl-rh devtoolset-7-gcc-c++
RUN apt-get -y update && apt-get install -y wget libicu-dev build-essential apt-utils git cmake software-properties-common pkg-config  

# Download and install Boost-1.65.1
RUN mkdir -p boost && \
    cd boost && \
    wget -nv https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz && \
    tar xzf boost_1_65_1.tar.gz && \
    cd boost_1_65_1 && \
    ./bootstrap.sh --with-libraries=serialization,filesystem,thread,system,atomic,date_time,timer,chrono,program_options,regex && \
    ./b2 -j$(nproc) cxxflags="-fPIC" runtime-link=static variant=release link=static install
