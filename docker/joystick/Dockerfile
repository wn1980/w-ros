FROM ros:kinetic-ros-core

RUN apt-get update && apt-get install -y \ 
	ros-$ROS_DISTRO-joy \
	ros-$ROS_DISTRO-joystick-drivers \
	ros-$ROS_DISTRO-teleop-twist-joy \
	joystick

#ros-$ROS_DISTRO-kobuki-safety-controller \
#ros-$ROS_DISTRO-yujin-ocs \
	
#COPY ./root/ /root/
#RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash && cd ~/catkin_ws && catkin_make -DCMAKE_BUILD_TYPE=Release'

COPY ./ros_entrypoint.sh /
COPY ./start.launch /

RUN usermod -aG dialout root && \
	usermod -aG plugdev root && \
	usermod -aG input root
