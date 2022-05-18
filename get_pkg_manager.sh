#!/bin/bash

if command -v apt &> /dev/null
then
    export INSTALL_CMD="sudo apt install -y"
elif command -v apt-get &> /dev/null
then
    export INSTALL_CMD="sudo apt-get install -y"
elif command -v dnf &> /dev/null
then
    export INSTALL_CMD="sudo dnf install -y"
elif command -v yum &> /dev/null
then
    export INSTALL_CMD="sudo yum install -y"
elif command -v pacman &> /dev/null
then
    export INSTALL_CMD="sudo pacman -Sy"
elif command -v apk &> /dev/null
then
    export INSTALL_CMD="sudo apk add"
else
    export INSTALL_CMD=$FALLBACK_INSTALL_CMD
fi
