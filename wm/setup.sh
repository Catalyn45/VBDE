#!/bin/bash
eval $INSTALL_CMD xorg
eval $INSTALL_CMD unzip
eval $INSTALL_CMD wget

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip

mkdir -p ~/.local/share/fonts
mv FiraCode.zip ~/.local/share/fonts/
cd ~/.local/share/fonts/
unzip FiraCode.zip
rm FiraCode.zip
cd -

eval $INSTALL_CMD i3-gaps i3lock
eval $INSTALL_CMD picom
eval $INSTALL_CMD polybar
eval $INSTALL_CMD rofi
eval $INSTALL_CMD dunst
eval $INSTALL_CMD feh
eval $INSTALL_CMD alacritty
eval $INSTALL_CMD dbus
eval $INSTALL_CMD network-manager-applet
eval $INSTALL_CMD xclip
eval $INSTALL_CMD maim
eval $INSTALL_CMD light
eval $INSTALL_CMD touchegg

mkdir -p ~/.config/i3
mv ~/.config/i3/config ~/.config/i3/config.bak
ln -s $PWD/i3/config ~/.config/i3/

mkdir ~/.config/polybar
mv ~/.config/polybar/config.ini ~/.config/polybar/config.ini.bak
ln -s $PWD/polybar/config.ini ~/.config/polybar/

mv ~/.config/polybar/launch.sh ~/.config/polybar/launch.sh.bak
ln -s $PWD/polybar/launch.sh ~/.config/polybar/

mv ~/.config/picom.conf ~/.config/picom.conf.bak
ln -s $PWD/picom/picom.conf ~/.config/

mkdir ~/.config/rofi
mv ~/.config/rofi/config.rasi ~/.config/rofi/config.rasi.bak
ln -s $PWD/rofi/config.rasi ~/.config/rofi/

mkdir ~/.config/touchegg
mv ~/.config/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf.bak
ln -s $PWD/touchegg/touchegg.conf ~/.config/touchegg/

mkdir ~/.config/dunst
mv ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.bak
ln -s $PWD/dunst/dunstrc ~/.config/dunst/

mkdir ~/.config/alacritty
mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
ln -s $PWD/alacritty/alacritty.yml ~/.config/alacritty/

mv ~/scripts ~/scripts.bak
ln -s $PWD/scripts ~/

mv ~/.bgimage ~/.bgimage.bak
ln -s $PWD/.bgimage ~/

feh --bg-scale ~/.bgimage/background.png

