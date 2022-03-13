#!/bin/sh

#import the colors
. "${HOME}/.cache/wal/colors.sh"

dmenu_run -fn 'Overpass Mono:pixelsize=15' -l 3 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"
