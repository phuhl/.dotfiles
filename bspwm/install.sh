#!/bin/sh
os=$1
echo ''
if [ X"$os" = X"u" ]; then
    echo 'Installing bspwm for Ubuntu-like systems'
    echo ''
    sudo rm .tmp -r
    mkdir .tmp
    git clone https://github.com/phuhl/bspwm-rounded.git .tmp
    cd .tmp
    sudo apt-get -qq install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev gcc make

    make
    sudo make install
    cd -
    sudo rm .tmp -r
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing bspwm for Arch systems'
    echo ''
    sudo rm .tmp -r
    mkdir .tmp
    git clone https://github.com/phuhl/bspwm-rounded.git .tmp
    cd .tmp
    sudo pacman -S libxcb xcb-util xcb-util-keysyms xcb-util-wm gcc make --needed --noconfirm

    make
    sudo make install
    cd -
    sudo rm .tmp -r
fi



echo ''
