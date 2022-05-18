#!/bin/bash

export INSTALL_CMD="sudo apt install -y"

eval $INSTALL_CMD curl
eval $INSTALL_CMD git

source ./nvim/setup.sh
source ./zsh/setup.sh

