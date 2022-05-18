#!/bin/bash

export INSTALL_CMD="sudo apt install -y"

eval $INSTALL_CMD curl
eval $INSTALL_CMD git
eval $INSTALL_CMD zsh

zsh ./zsh/setup.sh
zsh ./nvim/setup.sh

