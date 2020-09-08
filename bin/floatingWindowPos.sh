#!/bin/sh
# This bspwm helper takes an argument: north|east|west|south
# It moves the window one step further in that direction according
# to the possible positions as shown in the following matrix:
# Matrix:
#           north
#             ^
#         ---------
#         | x x x |x
#  west < | x x x |x > east
#         | x x x |x
#         ---------
#             v
#           south
# Requirements: xdotool.

# get the current screen presets
 

# SCREEN=`xrandr | grep '*' | awk '{print $1}' | awk '{split($0,a,"_"); print a[1]}'`
#SCREEN_X=${SCREEN%x*}
#SCREEN_Y=${SCREEN#*x}
MONITOR=`bspc query -M -m focused --names`
SCREEN=`xrandr | grep $MONITOR | grep -o "[0-9]*x[0-9]*+[0-9]*+[0-9]*"`
OFFSET_X=`echo $SCREEN | awk '{split($0,a,"x|+"); print a[3]}'`
OFFSET_Y=`echo $SCREEN | awk '{split($0,a,"x|+"); print a[4]}'`
SCREEN_X=`echo $SCREEN | awk '{split($0,a,"x"); print a[1]}'`
SCREEN_Y=`echo $SCREEN | awk '{split($0,a,"x|+"); print a[2]}'`

#SCREEN_X=`xrandr | grep 'current' | awk '{print $8}'`
#SCREEN_Y=`xrandr | grep 'current' | awk '{gsub(",","",$10); print $10}'`
BORDER=`bspc config border_width`

# get the current window geometry
eval `xdotool getactivewindow getwindowgeometry --shell`

DISTANCE_TO_BORDER=5

# calculate new coordinates
X0=$((0-WIDTH-BORDER*2 + 50 + OFFSET_X))
X1=$((DISTANCE_TO_BORDER + OFFSET_X))
X2=$((SCREEN_X/2-WIDTH/2-BORDER*2 + OFFSET_X))
X3=$((SCREEN_X-WIDTH-BORDER*2 - $DISTANCE_TO_BORDER + OFFSET_X))
X4=$((SCREEN_X-50 + OFFSET_X))
Y1=$((SCREEN_Y-HEIGHT-BORDER*2 - $DISTANCE_TO_BORDER + OFFSET_Y))
Y2=$((SCREEN_Y/2-HEIGHT/2-BORDER*2 + OFFSET_Y))
Y3=$((DISTANCE_TO_BORDER + OFFSET_Y))

# utility function to move the window
m() {
    xdotool windowmove $WINDOW $1 $2;
}

get_next_max() {
    if [ "$1" -ge "$2" ]; then
        echo $3
    else
        echo $2
    fi
}

get_next_min() {
    if [ "$1" -le "$2" ]; then
        echo $3
    else
        echo $2
    fi
}


# execute
case $1 in
  north) m x $(get_next_min $Y $Y2 $Y3) ;;
	east) m $(get_next_max $X $X1 $(get_next_max $X $X2 $(get_next_max $X $X3 $X4))) y ;;
	south) m x $(get_next_max $Y $Y2 $Y1) ;;
	west) m $(get_next_min $X $(get_next_min $X $(get_next_min $X $X3 $X2) $X1) $X0) y ;;
esac
