CONFIG=$(cat $HOME/.config/screens)
desktops=""
while read config; do
   monitor=$(echo $config | awk '{$1 = ""; print $0;}')
   desktops=$desktops$monitor
done <<< "$CONFIG"
echo $desktops | tr " " "\n"
