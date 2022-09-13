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

# uncomment to install i3wm with configs
# setup wm

zsh
