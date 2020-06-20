#!/bin/bash
set -e

source /opt/ros/ardent/setup.bash

echo "ROS2 Ardent ready!"
echo "Try typing \"ros2 run demo_nodes_cpp talker\""

exec "$@"
