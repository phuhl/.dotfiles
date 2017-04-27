#! /bin/bash
#/home/adminu/documents/bin/bash/detect-displays.sh
# ist jetzt in bspwmrc drin
nitrogen --restore &
compton --config $HOME/.config/compton/compton.conf -cGb --opengl --sw-opti --vsync opengl-swc &
numlockx on &
#dunst &
#$HOME/.dotfiles/system/panel &
sleep 5
#stalonetray &
wait
