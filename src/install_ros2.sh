#!/bin/bash


# This script will install ROS2 Humble Hawksbill or later onto a system running Ubuntu Linux
# Copyright (C) 2023 Adam Vadala-Roth
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.

# Set the ROS2 distribution
ROS_DISTRO=humble

# Set the locale
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# Add the ROS 2 repository
sudo sh -c "echo 'deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu focal main' > /etc/apt/sources.list.d/ros2.list"
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update the package list
sudo apt update

# Install ROS 2 packages
sudo apt install -y ros-$ROS_DISTRO-desktop

# Source the ROS 2 setup file
source /opt/ros/$ROS_DISTRO/setup.bash

# Install additional dependencies
sudo apt install -y python3-argcomplete python3-colcon-common-extensions python3-pip

# Install ROS 2 tools
pip3 install -U argcomplete

# Source the ROS 2 setup file in the bashrc
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

# Install additional ROS 2 packages or tools as needed

echo "ROS 2 installation complete!"
