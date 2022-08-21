#!/bin/bash

eval $INSTALL_CMD tmux

[[ -f ~/.tmux.conf ]] && cp ~/.tmux.conf ~/.tmux.conf.bak
rm ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/
