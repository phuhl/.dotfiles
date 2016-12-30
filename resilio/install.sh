#!/bin/bash
os=$1
echo ''

install_resilio () {
    mkdir /opt/resilio
    cd /opt/resilio

    wget https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz -O /opt/resilio/resilio.tar.gz
    tar -xvzf /opt/resilio/resilio.tar.gz
    rm /opt/resilio/resilio.tar.gz
}



if [ X"$os" = X"u" ]; then
    echo 'Installing resilio for Ubuntu-like systems'
    echo ''
    install_resilio
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing resilio for Arch systems'
    echo ''
    install_resilio
fi



echo ''
