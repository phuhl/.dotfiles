# https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    bash $HOME/.config/niri/startniri.sh
fi
