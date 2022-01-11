#!/bin/sh

sudo pacman -S zsh # or `sudo apt install zsh` on ubuntu
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
cp ./.zshrc ~/.zshrc
zsh

