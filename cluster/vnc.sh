#!/bin/bash
Xvfb :1 -screen 0 1024x768x24 &
# Xvfb :1 -screen 0 1280x1024x24 &
sleep 5

x11vnc -noxdamage -many -display :1 -rfbport 5901 -rfbauth ~/.x11vnc/passwd -bg
# sleep 3

dbus-run-session xfce4-session &

/usr/share/novnc/utils/launch.sh --listen 5981 --vnc localhost:5901 &
