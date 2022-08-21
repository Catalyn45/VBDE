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
[[ -f ~/.config/i3/config ]] && cp ~/.config/i3/config ~/.config/i3/config.bak
rm ~/.config/i3/config
ln -s $PWD/i3/config ~/.config/i3/

mkdir ~/.config/polybar
[[ -f ~/.config/polybar/config.ini ]] && cp ~/.config/polybar/config.ini ~/.config/polybar/config.ini.bak
rm ~/.config/polybar/config.ini
ln -s $PWD/polybar/config.ini ~/.config/polybar/

[[ -f ~/.config/polybar/launch.sh ]] && cp ~/.config/polybar/launch.sh ~/.config/polybar/launch.sh.bak
rm ~/.config/polybar/launch.sh
ln -s $PWD/polybar/launch.sh ~/.config/polybar/

[[ -f ~/.config/picom.conf ]] && cp ~/.config/picom.conf ~/.config/picom.conf.bak
rm ~/.config/picom.conf
ln -s $PWD/picom/picom.conf ~/.config/

mkdir ~/.config/rofi
[[ -f ~/.config/rofi/config.rasi ]] && cp ~/.config/rofi/config.rasi ~/.config/rofi/config.rasi.bak
rm ~/.config/rofi/config.rasi
ln -s $PWD/rofi/config.rasi ~/.config/rofi/

mkdir ~/.config/touchegg
[[ -f ~/.config/touchegg/touchegg.conf ]] && cp ~/.config/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf.bak
rm ~/.config/touchegg/touchegg.conf
ln -s $PWD/touchegg/touchegg.conf ~/.config/touchegg/

mkdir ~/.config/dunst
[[ -f ~/.config/dunst/dunstrc ]] && cp ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.bak
rm ~/.config/dunst/dunstrc
ln -s $PWD/dunst/dunstrc ~/.config/dunst/

mkdir ~/.config/alacritty
[[ -f ~/.config/alacritty/alacritty.yml ]] && cp ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
rm ~/.config/alacritty/alacritty.yml
ln -s $PWD/alacritty/alacritty.yml ~/.config/alacritty/

[[ -d ~/scripts ]] && cp -r ~/scripts ~/scripts.bak
rm -rf ~/scripts
ln -s $PWD/scripts ~/

[[ -f ~/.bgimage ]] && cp ~/.bgimage ~/.bgimage.bak
rm -rf ~/.bgimage
ln -s $PWD/.bgimage ~/

feh --bg-scale ~/.bgimage/background.png

