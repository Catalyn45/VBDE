#!/bin/bash

source ../utils.sh

install ranger
install fzf

CONFIG_DIR=~/.config/ranger

replace_config $CONFIG_DIR rc.conf
replace_config $CONFIG_DIR rifle.conf
replace_config $CONFIG_DIR scope.sh
replace_config $CONFIG_DIR commands.py
