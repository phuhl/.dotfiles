#!/bin/sh
os=$1
echo ''

install_siji () {
    sudo rm .tmp -r
    mkdir .tmp
    git clone https://github.com/stark/siji .tmp
    cd .tmp
    ./install.sh
    cd -
    sudo rm .tmp -r
}

if [ X"$os" = X"u" ]; then
    echo 'Installing siji-font for Ubuntu-like systems'
    echo ''
    install_siji
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing siji-font for Arch systems'
    echo ''
    install_siji
fi



echo ''
