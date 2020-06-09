#! /bin/bash
#/home/adminu/documents/bin/bash/detect-displays.sh
# ist jetzt in bspwmrc drin
nitrogen --restore &
compton --config $HOME/.config/compton/compton.conf -cGb --opengl --sw-opti --vsync opengl-swc --backend glx  --detect-rounded-corners &
numlockx on &
plank &
libinput-gestures &
sleep 1 && xdotool search --class Plank windowraise

# polybar ist in:
#$HOME/.dotfiles/bin/detect-screens
unclutter &
#dunst &
#$HOME/.dotfiles/system/panel &
sleep 5
#stalonetray &
wait
