#!/bin/bash

export FALLBACK_INSTALL_CMD=

source ./get_pkg_manager.sh

eval $INSTALL_CMD curl
eval $INSTALL_CMD git
eval $INSTALL_CMD zsh

if [ "$INSTALL_CMD" = "sudo dnf install -y" ]; then
    eval $INSTALL_CMD autojump-zsh
else
    eval $INSTALL_CMD autojump
fi

eval $INSTALL_CMD exa

zsh ./zsh/setup.sh

eval $INSTALL_CMD ranger

zsh ./nvim/setup.sh
zsh ./tmux/setup.sh
