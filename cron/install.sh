#!/bin/bash
os=$1
echo ''

if [ X"$os" = X"u" ]; then
    echo 'Enabling crontab for Ubuntu-like systems'
    echo ''

fi
if [ X"$os" = X"a" ]; then
    echo 'Enabling crontab for Arch-systems'
    echo ''
    systemctl enable cronie.service
fi



echo ''
