#!/bin/sh

# dbus-update-activation-environment --systemd DISPLAY
# dbus-update-activation-environment --systemd DISPLAY XAUTHORITY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=niri

# systemctl --user import-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
# hash dbus-update-activation-environment 2>/dev/null && \
#      dbus-update-activation-environment --systemd DISPLAY XAUTHORITY WAYLAND_DISPLAY



gammastep &
waybar &
deadd-notification-center &

# Lock screen when idle
# If annoying, maybe install and look into: sway-audio-idle-inhibit
swayidle -w &

# Background img
#swaybg -m fill -i ~/images/downloads/wallpapers/19513k34grf1ejpg.jpg &

# Automatic monitor setup
kanshi &

# Start darkman
darkman get &

# Desktop icons + wallpaper
pcmanfm-qt --desktop &
