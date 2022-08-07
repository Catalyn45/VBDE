#!/bin/bash

eval $INSTALL_CMD i3-gaps
eval $INSTALL_CMD picom
eval $INSTALL_CMD polybar
eval $INSTALL_CMD rofi

mkdir -p ~/.config/i3
cp ./i3/config ~/.config/i3/config

mkdir ~/.config/polybar
cp ./polybar/config.ini ~/.config/polybar/config.ini
cp ./polybar/launch.sh ~/.config/polybar/launch.sh

cp ./picom/picom.conf ~/.config/picom.conf
