#CONNECTED=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
#NUM_OF_DISPLS=$(echo $CONNECTED | wc -w)
#CONFIG=$(cat $HOME/.config/screen)
#
#if [[ $NUM_OF_DISPLS > 1 ]]; then
#    CONFIG=$(cat $HOME/.config/screens)
#fi
#
#
#desktops=""
#while read config; do
#   monitor=$(echo $config | awk '{$1 = ""; print $0;}')
#   desktops=$desktops$monitor
#done <<< "$CONFIG"
#echo $desktops | tr " " "\n"
#

echo 1
echo 2
echo 3
echo 4
echo 5
echo 6
echo 7
echo web
echo music
echo com
