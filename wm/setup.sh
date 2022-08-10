#!/bin/bash
eval $INSTALL_CMD unzip

mv FiraCode.zip ~/.local/share/fonts/
cd ~/.local/share/fonts/
unzip FiraCode.zip
rm FiraCode.zip
cd -

mkdir -p ~/.config/i3
ln -s $PWD/i3/config ~/.config/i3/

eval $INSTALL_CMD i3-gaps
eval $INSTALL_CMD picom
eval $INSTALL_CMD polybar
eval $INSTALL_CMD rofi
eval $INSTALL_CMD dunst
eval $INSTALL_CMD feh
eval $INSTALL_CMD alacritty
eval $INSTALL_CMD dbus
eval $INSTALL_CMD network-manager-applet

mkdir ~/.config/polybar
ln -s $PWD/polybar/config.ini ~/.config/polybar/
ln -s $PWD/polybar/launch.sh ~/.config/polybar/

ln -s $PWD/picom/picom.conf ~/.config/

mkdir ~/.config/rofi
ln -s $PWD/rofi/config.rasi ~/.config/rofi/

mkdir ~/.config/dunst
ln -s $PWD/dunst/dunstrc ~/.config/dunst/

mkdir ~/.config/alacritty
ln -s $PWD/alacritty/alacritty.yml ~/.config/alacritty/

ln -s $PWD/.xinitrc ~/
ln -s $PWD/scripts ~/
ln -s $PWD/.bgimage ~/

feh --bg-scale ~/.bgimage/background.png

i3
