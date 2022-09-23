#!/bin/bash

source ../utils.sh

install xorg || install xorg-x11-server-Xorg
install xorg-xinit || install xorg-x11-xinit

install unzip
install wget

# install fira code nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip

mkdir -p ~/.local/share/fonts
mv FiraCode.zip ~/.local/share/fonts/
cd ~/.local/share/fonts/
unzip FiraCode.zip
rm FiraCode.zip
cd -

install dbus
install network-manager-applet

# clipboard
install xclip

# screenshots
install maim

# brightness change
install light

# window manager
setup i3

# top bar
setup polybar

# composer (for rounded corners, transparency etc)
setup picom

# applications starter
setup rofi

# touchpad gestures
setup touchegg

# notifications
setup dunst

# cute terminal emulator
setup alacritty

# image viewer and background setter
install feh
replace_config ~ .bgimage

# util scripts
replace_config ~ scripts

replace_config ~ .xinitrc
