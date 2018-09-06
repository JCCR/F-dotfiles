#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# yaourt -S polybar awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete

# Terminate already running bar instances
killall -q polybar

mod_left=$POLYBAR_1_MODULES_LEFT
mod_center=$POLYBAR_1_MODULES_CENTER
mod_right=$POLYBAR_1_MODULES_RIGHT

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  	echo $mod_left $mod_center $mod_right
  	echo $m
    POLYBAR_MODULES_LEFT=$mod_left POLYBAR_MODULES_CENTER=$mod_center POLYBAR_MODULES_RIGHT=$mod_right MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
    mod_left=$POLYBAR_2_MODULES_LEFT
    mod_center=$POLYBAR_2_MODULES_CENTER
    mod_right=$POLYBAR_2_MODULES_RIGHT
  done
else
POLYBAR_MODULES_LEFT=$mod_left POLYBAR_MODULES_CENTER=$mod_center POLYBAR_MODULES_RIGHT=$mod_right polybar --reload mainbar-i3 -c ~/.config/polybar/config &
fi

#for future scripts - how to find interface
#interface-name=$(ip route | grep '^default' | awk '{print $5}')
#interface-name=$(ifconfig -a | sed -n 's/^\([^ ]\+\).*/\1/p' | grep -Fvx -e lo:| sed 's/.$//')
