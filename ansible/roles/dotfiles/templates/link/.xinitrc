#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
	[ -x "$f" ] && . "$f"
    done
    unset f
fi


# add ~/.fonts for x to search for fonts

xset fp rehash
xset +fp /home/philipp/.fonts

XDG_SESSION_TYPE=x11

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec dwm

# ssh-agent
eval `ssh-agent -t 2h`

### i3
#exec i3

### bspwm
exec bspwm
