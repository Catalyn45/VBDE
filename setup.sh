#!/bin/bash

export FALLBACK_INSTALL_CMD=

source ./get_pkg_manager.sh

eval $INSTALL_CMD curl
eval $INSTALL_CMD git
eval $INSTALL_CMD zsh
eval $INSTALL_CMD bat || eval $INSTALL_CMD batcat

eval $INSTALL_CMD exa
eval $INSTALL_CMD lf

cd zsh
zsh ./setup.sh

cd ../nvim
zsh ./setup.sh

cd ../tmux
zsh ./setup.sh

# uncomment to install i3wm with configs
#cd ../wm
#eval $INSTALL_CMD ./setup.sh

zsh
