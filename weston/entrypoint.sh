#!/bin/bash
# export XDG_RUNTIME_DIR="/home/developer"
export XDG_RUNTIME_DIR="/run/user/developer"
export WAYLAND_DEBUG=1
export DISPLAY=:7
# export QT_QPA_PLATFORM=wayland-egl
# export GDK_BACKEND=wayland
# export CLUTTER_BACKEND=wayland
# export SDL_VIDEODRIVER=wayland
# export LC_ALL=en_US.UTF-8



# xpra start --start=xterm --bind-tcp=0.0.0.0:10000
xpra start :7 --start=xterm --bind-tcp=0.0.0.0:10000 
sleep 2
DISPLAY=:7 weston --backend=x11-backend.so --xwayland 
# DISPLAY=:7 weston --backend=x11-backend.so --xwayland --fullscreen
# cat /home/weston/weston.log

# tail -f /dev/null
# exec dbus-launch weston --backend=x11-backend.so --xwayland
# exec dbus-launch weston --backend=rdp-backend.so --width=1920 --height=1080

