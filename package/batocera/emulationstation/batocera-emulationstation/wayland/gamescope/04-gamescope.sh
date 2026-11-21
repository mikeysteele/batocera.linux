export XDG_RUNTIME_DIR=/var/run
for _sock in /var/run/gamescope-[0-9]* /var/run/wayland-[0-9]*; do
    case "$_sock" in *.lock) continue ;; esac
    if [ -S "$_sock" ]; then
        export WAYLAND_DISPLAY="${_sock##*/}"
        break
    fi
done
[ -z "$WAYLAND_DISPLAY" ] && export WAYLAND_DISPLAY=gamescope-0
export DISPLAY=:0
export GDK_BACKEND=x11
