#!/bin/bash

source /opt/ros/jazzy/setup.bash
source /home/mandeye/mandeye_pandar_ros2/install/setup.bash
exec ros2 launch hesai_ros_driver start.py
