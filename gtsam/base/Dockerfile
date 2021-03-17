# Basic Ubuntu 18.04 image with Boost and TBB installed. To be used for building further downstream packages.

# Get the base Ubuntu image from Docker Hub
FROM ubuntu:bionic

# Disable GUI prompts
ENV DEBIAN_FRONTEND noninteractive

# Update apps on the base image
RUN apt-get -y update && apt-get -y install build-essential apt-utils git cmake software-properties-common

# Install Boost 1.67
RUN add-apt-repository -y ppa:mhier/libboost-latest && apt-get -y update && apt-get -y install libboost1.67-all-dev
