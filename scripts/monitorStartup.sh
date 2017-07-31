#!/bin/bash

# setting up new mode for my DP
xrandr --newmode "1920x1080_60.00" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode LVDS-1-1 1920x1080_60.00

# default monitor is LVDS1

MONITOR=LVDS1

# functions to switch from LVDS1 to DP and vice versa

function ActivateDP {
    echo "Switching to DP1"
    exec ~/dotfiles/arandr/work_dual_screen.sh
    MONITOR=DP-1
}

function DeactivateDP {
    echo "Switching to LVDS1"
    exec ~/dotfiles/arandr/single_screen.sh
    MONITOR=LVDS1
}

# functions to check if DP is connected and in use

function DPActive {
    [ $MONITOR = "DP-1" ]
}

function DPConnected {
    xrandr | grep "^DP-1" | grep -w connected
}

# actual script

while true
do
    if ! DPActive && DPConnected
    then
        ActivateDP
    fi

    if DPActive && ! DPConnected
    then
        DeactivateDP
    fi

    sleep 10s
done
