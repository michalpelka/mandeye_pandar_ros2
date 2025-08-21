#!/bin/bash

source /opt/ros/jazzy/setup.bash
source /home/mandeye/ros2_ws/install/setup.bash
exec ros2 launch xsens_mti_ros2_driver xsens_mti_node.launch.py

