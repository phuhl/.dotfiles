#!/bin/env bash

## INSTALLATION:
## install the darkman package
# mkdir -p $HOME/.config/darkman

## Put this script to $HOME/.config/darkman and make it executable:
# chmod +x $HOME/.config/darkman/mode_switcher.sh

## Some tuning the darkman for using only one script at one folder:
# sudo ln -s $HOME/.config/darkman /usr/share/dark-mode.d
# sudo ln -s $HOME/.config/darkman /usr/share/light-mode.d

## Fix visibility the NIRI_SOCKET variable for systemd service darkman:
## ~/.config/systemd/user/darkman.service:
# [Unit]
# PartOf=graphical-session.target
# After=graphical-session.target
# Requisite=graphical-session.target
#
# [Service]
# ExecStart=/usr/bin/darkman run
# Restart=on-failure

## Started together with niri.service:
# ln -s ~/.config/systemd/user/darkman.service ~/.config/systemd/user/niri.service.wants/

## Start service:
# systemctl --user daemon-reload && systemctl start --user darkman


case $(darkman get) in
light)
    # Set mode for GTK4 applications
    niri msg action do-screen-transition && dconf write /org/gnome/desktop/interface/color-scheme '"prefer-light"'

    kvantummanager --set KvArc

    # niri
    sed -i 's/ \/-\(.* { \/\/ light\)/ \1/
            s/ *\(.* { \/\/ dark\)/ \/-\1/
            s/\/-\/-/\/-/' "$HOME"/.config/niri/config.kdl


    # alacritty
    sed -i 's/dark/light/' "$HOME"/.config/alacritty/alacritty-theme.toml

    # Switch wallpaper
        # ln -sf "$HOME"/Pictures/Wallpapers/niri_light.jpg "$HOME"/.config/niri/wallpaper
        # systemctl restart --user swaybg
    ;;
dark)
    # Set mode for GTK4 applications
    niri msg action do-screen-transition && dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'

    kvantummanager --set KvArcDark

    # niri
    sed -i 's/ *\(.* { \/\/ light\)/ \/-\1/
            s/ \/-\(.* { \/\/ dark\)/ \1/
            s/\/-\/-/\/-/' "$HOME"/.config/niri/config.kdl

    # alacritty
    sed -i 's/light/dark/' "$HOME"/.config/alacritty/alacritty-theme.toml


    # Switch wallpaper
        # ln -sf "$HOME"/Pictures/Wallpapers/niri_dark.jpg "$HOME"/.config/niri/wallpaper
        # systemctl restart --user swaybg
    ;;
esac
