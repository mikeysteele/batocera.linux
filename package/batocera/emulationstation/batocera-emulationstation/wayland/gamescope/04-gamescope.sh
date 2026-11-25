#!/bin/sh

export XDG_CURRENT_DESKTOP=gamescope
export XDG_SESSION_TYPE=wayland
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM="wayland;xcb"
export GDK_BACKEND=x11

# Gamescope sets DISPLAY=:0 and WAYLAND_DISPLAY=gamescope-0 for its child tree,
# but external SSH/scripts may need defaults when querying
if [ -z "${WAYLAND_DISPLAY}" ]; then
    export WAYLAND_DISPLAY=gamescope-0
fi
if [ -z "${DISPLAY}" ]; then
    export DISPLAY=:0
fi
