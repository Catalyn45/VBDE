#!/bin/sh

export INSTALL_CMD="sudo pacman -Sy"

eval $INSTALL_CMD curl

source ./nvim/setup.sh
source ./zsh/setup.sh

