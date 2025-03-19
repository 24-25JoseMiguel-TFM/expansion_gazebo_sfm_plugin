FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"] 

# Required ROS packages  
RUN sudo apt update && apt install -y ros-noetic-joy ros-noetic-teleop-twist-joy \
    ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
    ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
    ros-noetic-rosserial-python ros-noetic-rosserial-client \
    ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
    ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
    ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
    ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers \
    ros-noetic-vision-msgs

#RUN install dynamic_reconfigure

#RUN rosmake dynamic_reconfigure

## ROS packages for Turtlebot3 robot     
#RUN sudo apt install -y ros-noetic-dynamixel-sdk \
    #ros-noetic-turtlebot3-*

RUN sudo apt install -y git 

# We also install Git and file editors, just in case
RUN sudo apt install -y git vim nano

# MESA drivers for hardware acceleration graphics (Gazebo and RViz)
RUN sudo apt -y install libgl1-mesa-glx libgl1-mesa-dri && \
    rm -rf /var/lib/apt/lists/*

#Instalación 

#RUN sudo make install lightsfm

#Instalación 

#RUN sudo apt install ros-noetic-nav2-behavior-tree ros-noetic-behaviortree-cpp-v3

# We source the ROS instalation 
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
#RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc

# The working directory inside our container
WORKDIR "/home/TFM_jose_ws"
