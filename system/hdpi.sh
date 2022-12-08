#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/philipp/.Xauthority
export XDG_SESSION_CLASS=user
export XDG_SESSION_TYPE=x11
export HOME=/home/philipp
export PATH="$PATH:/usr/bin:/usr/local/bin"
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

CONNECTED=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
NUM_OF_DISPLS=$(echo $CONNECTED | wc -w)

CONFIG=$(cat $HOME/.config/dpi)
while read config; do
    MATCHES=1
    if [[ $(echo $config | awk '{ print NF - 1 }') !=  $NUM_OF_DISPLS ]]; then
        MATCHES=0
    fi
    for con in $CONNECTED; do
        if [[ " $config " != *" $con "* ]]; then
            MATCHES=0
        fi
    done
    if [[ $MATCHES == 1 ]]; then
        echo $(echo "$config" | awk '{print $(NF)}' )
    fi
done <<< "$CONFIG"
