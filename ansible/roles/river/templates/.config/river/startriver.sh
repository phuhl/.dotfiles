echo "Starting river"

export XDG_CURRENT_DESKTOP=river
export XDG_SESSION_DESKTOP=river


# Issue with gnome keyring on river:
# https://bbs.archlinux.org/viewtopic.php?id=202754
# Also should fix slow startup of Gtk apps:
# https://github.com/swaywm/sway/wiki#gtk-applications-take-20-seconds-to-start
# https://github.com/riverwm/river/issues/464
# Also against slow GTK apps:
# https://github.com/swaywm/sway/issues/5732

XDG_CURRENT_DESKTOP=river dbus-run-session river
