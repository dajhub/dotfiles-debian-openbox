#!/bin/sh

# This script display an appropriate brightness icon according to the brightness level

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

# Dependencies: `xbacklight` or `light-git'

# Prefer the `light` package, use `xbacklight` if `light` not found
if [[ $(which light) == *"/light"* ]]
then
    b=$(light -G)
else
    b=$(xbacklight -get)
fi

# Lets round the float result
bri=$(echo "($b+0.5)/1" | bc)

if [[ "$bri" -gt "90" ]]; then
    echo /usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-high-symbolic.svg
elif [[ "$bri" -gt "50" ]]; then
    echo /usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-high-symbolic.svg
elif [[ "$bri" -gt "30" ]]; then
    echo /usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-medium-symbolic.svg
else
    echo /usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-low-symbolic.svg
fi
if  [[ $1 = "-l" ]]; then
    echo ${bri}%
fi
