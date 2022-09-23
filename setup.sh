#!/bin/bash

source utils.sh

# in case your distro is not supported, write the install command
# here. ex: export FALLBACK_INSTALL_CMD="sudo apt install -y"
export FALLBACK_INSTALL_CMD=

get_package_manager

# like cat but pretty
install bat || install batcat

# like ls but pretty
install exa

# very nice shell
setup zsh

# super cool terminal editor
setup nvim

# multiple shells one terminal
setup tmux

# terminal file manager
setup ranger

# install i3wm and other things
if [[ $1 == "-y" ]]; then
    setup wm
else
    while true; do
        read -p "Do you want to install graphics (xorg) configs also? (Y/n): " option

        if [[ $option == "y" || $option == "Y" ]]; then
            setup wm
            break
        fi

        if [[ $option == "n" || $option == "N" ]]; then
            break
        fi
    done
fi

zsh
