#!/bin/bash

#  the device number on my mouse seems to get assined and changes on reboot,
#  so I need a script to find the device number and configure it how I want
#  each time it boots.


# General device info/examples
#
# disable middle mouse button click (https://wiki.ubuntu.com/X/Config/Input)
#
# $ xinput list | grep 'id='       #see input device maps
#
# $ xinput get-button-map 11       #shows the devices it's current mapping
#                                   for a mouse, only the first three numbers have meaning (left, middle, and right mouse buttons)    
#
# remove mouse mapping to the wheel on my mouse (keep it from pasting when clicked)
# to set it back:  xinput set-button-map <deviceNum> 1 2 3
# to disable it:   xinput set-button-map <deviceNum> 1 0 3



# debug command to retrieve mouse device number
#xinput list | grep 'Microsoft 5-Button' | awk '{print $9}' | cut -c4-5

deviceNum=`xinput list | grep 'Microsoft 5-Button' | awk '{print $9}' | cut -c4-5`

#echo $deviceNum
xinput set-button-map $deviceNum 1 0 3

