#!/bin/bash

eval $INSTALL_CMD tmux

rm ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/
