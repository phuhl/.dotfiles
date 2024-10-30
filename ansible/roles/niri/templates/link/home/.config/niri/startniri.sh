echo "Starting Niri"

# export XDG_CURRENT_DESKTOP=niri
# export XDG_SESSION_DESKTOP=niri


# Issue with gnome keyring on river:
# https://bbs.archlinux.org/viewtopic.php?id=202754
# Also should fix slow startup of Gtk apps:
# https://github.com/swaywm/sway/wiki#gtk-applications-take-20-seconds-to-start
# https://github.com/riverwm/river/issues/464
# Also against slow GTK apps:
# https://github.com/swaywm/sway/issues/5732

# XDG_CURRENT_DESKTOP=niri dbus-run-session niri
niri-session > /tmp/niri.log 2>&1
