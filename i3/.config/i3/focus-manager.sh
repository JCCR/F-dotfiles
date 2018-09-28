#!/bin/sh

xprop -root -spy _NET_ACTIVE_WINDOW | while read win; do
    echo $win
    if iskeydown Super; then
        eval $(xdotool getactivewindow getwindowgeometry --shell)
        X=$((X + (WIDTH / 2)))
        Y=$((Y + (HEIGHT / 2)))

        xdotool mousemove ${X} ${Y}
        sleep 0.1
        jetbrainsPID=`xdotool search --onlyvisible --class 'jetbrains-' getwindowpid`
        windowPID=`xdotool getactivewindow getwindowpid`
        if [ "$jetbrainsPID" == "$windowPID" ]; then
        	xdotool key Shift Shift Escape
        fi
    fi
done
