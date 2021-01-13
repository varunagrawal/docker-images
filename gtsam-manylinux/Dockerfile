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

# FIX auditwheel
# https://github.com/pypa/auditwheel/issues/136
ADD auditwheel.txt /io/auditwheel.txt

RUN echo /opt/_internal/*/*/*/*/auditwheel && \
    cd /opt/_internal/tools/lib64/python3.7/site-packages/auditwheel && \
    patch -p2 < /io/auditwheel.txt

RUN mkdir -p /io/wheelhouse

ENV PYTHON_VERSION="cp39-cp39"

COPY ./requirements.txt /io/requirements.txt
COPY ./entrypoint.sh /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]
