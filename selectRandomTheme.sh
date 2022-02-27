#!/bin/sh 

#note: use backticks to pipeline a command into a variable
#replace "~/Pictures/Wallpapers" with the directory where the pictures you want to set as wallpaper are located.
RAN_IMAGE=`ls ~/Pictures/Wallpapers | shuf -n 1`
echo $RAN_IMAGE has been chosen 

#pywal dependency!!! 
wal -i ~/Pictures/Wallpapers/$RAN_IMAGE 
