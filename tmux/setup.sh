#!/bin/bash

eval $INSTALL_CMD tmux

mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s $PWD/.tmux.conf ~/
