# Ubuntu Xenial image with ZSH
# Build with `docker build -t ubuntu-ros:xenial`

FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update

RUN apt-get install -q -y software-properties-common curl apt-transport-https ca-certificates emacs zsh gnupg2 lsb-release wget locales apt-utils git

RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

ENV TZ=America/Indiana/Tell_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone