#
# GTK environment
#

#export GDK_BACKEND=wayland # May cause problems with some xorg applications
export TDESKTOP_DISABLE_GTK_INTEGRATION=1
export CLUTTER_BACKEND=wayland
export BEMENU_BACKEND=wayland

# Firefox
export MOZ_ENABLE_WAYLAND=1

#
# Qt environment
#
export QT_QPA_PLATFORM=wayland-egl #error with apps xcb
export QT_WAYLAND_FORCE_DPI=physical
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

#
# Elementary environment
#
export ELM_DISPLAY=wl
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl
export ELM_ACCEL=opengl
# export ELM_SCALE=1

#
# SDL environment
#
export SDL_VIDEODRIVER=wayland

#
# Java environment
#
export _JAVA_AWT_WM_NONREPARENTING=1

export NO_AT_BRIDGE=1
export WINIT_UNIX_BACKEND=wayland
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
