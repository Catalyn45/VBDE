#!/bin/sh

export INSTALL_CMD="pacman -Sy"

eval $INSTALL_CMD curl

source ./nvim/setup.sh
source ./zsh/setup.sh

