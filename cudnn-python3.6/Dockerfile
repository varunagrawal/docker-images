FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

MAINTAINER Varun Agrawal "varunagrawal@gatech.edu"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
        && apt-get install -y software-properties-common curl \
        && add-apt-repository ppa:jonathonf/python-3.6 \
        && apt-get remove -y software-properties-common \
        && apt autoremove -y \
        && apt-get update \
        && apt-get install -y python3.6 python3.6-dev \
        && curl -o /tmp/get-pip.py "https://bootstrap.pypa.io/get-pip.py" \
        && python3.6 /tmp/get-pip.py \
        && apt-get install -y ruby git gcc g++ build-essential