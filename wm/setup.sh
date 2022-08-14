#!/bin/bash
eval $INSTALL_CMD xorg
eval $INSTALL_CMD unzip

mv FiraCode.zip ~/.local/share/fonts/
cd ~/.local/share/fonts/
unzip FiraCode.zip
rm FiraCode.zip
cd -

eval $INSTALL_CMD i3-gaps
eval $INSTALL_CMD picom
eval $INSTALL_CMD polybar
eval $INSTALL_CMD rofi
eval $INSTALL_CMD dunst
eval $INSTALL_CMD feh
eval $INSTALL_CMD alacritty
eval $INSTALL_CMD dbus
eval $INSTALL_CMD network-manager-applet
eval $INSTALL_CMD lf
eval $INSTALL_CMD xclip
eval $INSTALL_CMD maim
eval $INSTALL_CMD light

mkdir -p ~/.config/i3
rm ~/.config/i3/config
ln -s $PWD/i3/config ~/.config/i3/

mkdir ~/.config/polybar
rm ~/.config/polybar/config.ini
ln -s $PWD/polybar/config.ini ~/.config/polybar/

rm ~/.config/polybar/launch.sh
ln -s $PWD/polybar/launch.sh ~/.config/polybar/

rm ~/.config/picom.conf
ln -s $PWD/picom/picom.conf ~/.config/

mkdir ~/.config/rofi
rm ~/.config/rofi/config.rasi
ln -s $PWD/rofi/config.rasi ~/.config/rofi/

mkdir ~/.config/dunst
rm ~/.config/dunst/dunstrc
ln -s $PWD/dunst/dunstrc ~/.config/dunst/

mkdir ~/.config/alacritty
rm ~/.config/alacritty/alacritty.yml
ln -s $PWD/alacritty/alacritty.yml ~/.config/alacritty/

rm -rf ~/scripts
ln -s $PWD/scripts ~/

rm rf ~/.bgimage
ln -s $PWD/.bgimage ~/

feh --bg-scale ~/.bgimage/background.png

