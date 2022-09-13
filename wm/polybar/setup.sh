#!/bin/bash
source ../../utils.sh

install polybar
replace_config ~/.config/polybar config.ini
replace_config ~/.config/polybar launch.sh
