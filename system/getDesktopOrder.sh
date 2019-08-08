CONNECTED=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
NUM_OF_DISPLS=$(echo $CONNECTED | wc -w)
CONFIG=$(cat $HOME/.config/screen)

if [[ $NUM_OF_DISPLS > 1 ]]; then
    CONFIG=$(cat $HOME/.config/screens)
fi

desktops=""
while read config; do
   monitor=$(echo $config | awk '{$1 = ""; print $0;}')
   desktops=$desktops$monitor
done <<< "$CONFIG"
echo $desktops | tr " " "\n"
