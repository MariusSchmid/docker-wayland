# Set up noVNC

~~~
docker compose build
docker compose up
~~~

# deprecated
~~~
docker network create ros
docker pull theasp/novnc:latest
docker run -d --rm --net=ros \
   --env="DISPLAY_WIDTH=3000" --env="DISPLAY_HEIGHT=1800" --env="RUN_XTERM=no" \
   --name=novnc -p=8080:8080 \
   theasp/novnc:latest

docker run -d --net=ros --name roscore osrf/ros:noetic-desktop-full roscore
docker run -it --net=ros --env="DISPLAY=novnc:0.0" --env="ROS_MASTER_URI=http://roscore:11311" osrf/ros:noetic-desktop-full bash
docker run --name ubvnc -p 6080:80 -p 5900:5900 dorowu/ubuntu-desktop-lxde-vnc:bionic
docker run --rm -it --entrypoint bash novnc_weston
~~~