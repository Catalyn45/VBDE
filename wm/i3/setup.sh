#!/bin/bash
source ../../utils.sh

install i3-gaps
install i3lock

replace_config ~/.config/i3 config
replace_config ~/.config/i3 binds.conf
replace_config ~/.config/i3 monitors.conf
replace_config ~/.config/i3 startups.conf
replace_config ~/.config/i3 workspaces.conf

