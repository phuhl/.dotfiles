#!/bin/sh
os=$1
echo ''
if [ X"$os" = X"u" ]; then
    echo 'Installing node, npm for Ubuntu-like systems'
    echo 'npm Plugins to be installed: jslint tern webpack webpack-dev-server tern supervisor'
    echo ''
    sudo apt-get -qq install nodejs
    sudo ln -s /usr/bin/nodejs /usr/bin/node
    sudo apt-get -qq install npm
    sudo npm install jslint tern webpack webpack-dev-server tern supervisor -g
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing node, npm for Arch systems'
    echo 'npm Plugins to be installed: jslint tern webpack webpack-dev-server tern supervisor'
    echo ''
    sudo pacman -S nodejs npm --noconfirm --needed
    sudo npm install jslint tern webpack webpack-dev-server tern supervisor -g
fi



echo ''
