# Basic ROS2 ardent image

FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update

RUN apt-get install -q -y software-properties-common curl apt-transport-https ca-certificates emacs zsh gnupg2 lsb-release wget locales apt-utils git

RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

ENV TZ=America/Indiana/Tell_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set up ROS2 apt repo
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# Set ROS distro version
ENV CHOOSE_ROS_DISTRO=ardent

# Install ROS2 Desktop
RUN apt-get -y update
RUN apt-get install -y -q ros-ardent-desktop

# Install dev tools and ROS tools
RUN apt-get -q -y update && apt-get install -q -y \
  python3-pip \
  python-rosdep

RUN pip3 install -U argcomplete pip

# Set up script to source ROS2 env
COPY ./ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
