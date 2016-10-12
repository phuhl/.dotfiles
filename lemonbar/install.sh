#!/bin/sh
os=$1
echo ''
if [ X"$os" = X"u" ]; then
    echo 'Installing lemonbar (with xft) for Ubuntu-like systems'
    echo ''
    sudo rm .tmp -r
    mkdir .tmp
    git clone https://github.com/krypt-n/bar .tmp
    cd .tmp
    sudo apt-get -qq install libxft-dev libx11-xcb-dev fonts-font-awesome dzen2  gcc make

    make
    sudo make install
    cd -
    sudo rm .tmp -r
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing lemonbar (with xft) for Arch systems'
    echo ''
    sudo rm .tmp -r
    mkdir .tmp
    git clone https://github.com/krypt-n/bar .tmp
    cd .tmp
    sudo pacman -S wireless_tools iw crda gcc make --noconfirm --needed

    make
    sudo make install
    cd -
    sudo rm .tmp -r
fi



echo ''
