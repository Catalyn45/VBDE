#!/bin/bash
source ../../utils.sh

install i3-gaps
install i3lock

replace_config ~/.config/i3 config
