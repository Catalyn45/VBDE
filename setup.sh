#!/bin/bash

export FALLBACK_INSTALL_CMD=

source ./get_pkg_manager.sh

eval $INSTALL_CMD curl
eval $INSTALL_CMD git
eval $INSTALL_CMD zsh

zsh ./zsh/setup.sh
zsh ./nvim/setup.sh
zsh ./tmux/setup.sh
