#!/bin/bash

source /opt/ros/jazzy/setup.bash
source /home/pi/mandeye_pandar_ros2/install/setup.bash
export LD_LIBRARY_PATH=/home/pi/mandeye_pandar_ros2/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai:${LD_LIBRARY_PATH}
ros2 launch hesai_ros_driver start.py
