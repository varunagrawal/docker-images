FROM ubuntu:16.04
MAINTAINER Varun Agrawal <varagrawal@gmail.com>

# Based on this guide http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --force-yes build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
                    libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev \
                    python3-dev python3-tk python3-numpy python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

RUN pip3 install -U pip scipy

RUN mkdir ~/opencv

RUN cd ~/opencv && git clone https://github.com/Itseez/opencv_contrib.git
RUN cd ~/opencv && git clone https://github.com/Itseez/opencv.git

RUN cd ~/opencv/opencv && mkdir release && cd release && \
          cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
          -D INSTALL_C_EXAMPLES=ON \
          -D INSTALL_PYTHON_EXAMPLES=ON \
          -D BUILD_EXAMPLES=ON \
          -D WITH_OPENGL=ON \
          -D WITH_V4L=ON \
          -D WITH_XINE=ON \
          -D WITH_TBB=ON ..

RUN cd ~/opencv/opencv/release && make -j $(nproc) && make install
