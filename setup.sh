#!/bin/bash

export FALLBACK_INSTALL_CMD=

source ./get_pkg_manager.sh

eval $INSTALL_CMD curl
eval $INSTALL_CMD git
eval $INSTALL_CMD zsh
eval $INSTALL_CMD bat || eval $INSTALL_CMD batcat

eval $INSTALL_CMD exa

zsh ./zsh/setup.sh

eval $INSTALL_CMD ranger

zsh ./nvim/setup.sh
zsh ./tmux/setup.sh

# uncomment to install i3wm with configs
# eval $INSTALL_CMD ./wm/setup.sh

zsh
