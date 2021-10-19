#!/bin/sh
os=$1
echo ''
if [ X"$os" = X"u" ]; then
    echo "does not support ubuntu"
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing ssh for Arch systems'
    echo ''
    mkdir -p $HOME/.ssh
    touch $HOME/.ssh/config
    echo "" >> $HOME/.ssh/config
    echo "Host *" >> $HOME/.ssh/config
    echo "  IdentityFile ~/.ssh/id_rsa" >> $HOME/.ssh/config
fi



echo ''
