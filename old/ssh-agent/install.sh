#!/bin/sh
os=$1
echo ''
if [ X"$os" = X"u" ]; then
    echo "does not support ubuntu"
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing ssh-agent for Arch systems'
    echo ''
    mkdir -p $HOME/.config/systemd/user
    cat ./ssh-agent/ssh-agent.service > $HOME/.config/systemd/user/ssh-agent.service

    mkdir -p $HOME/.ssh
    touch $HOME/.ssh/config
    echo "" >> $HOME/.ssh/config
    echo "AddKeysToAgent  yes" >> $HOME/.ssh/config

    systemctl --user enable ssh-agent
    systemctl --user start ssh-agent
fi



echo ''
