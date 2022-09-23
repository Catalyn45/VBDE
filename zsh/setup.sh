#!/bin/bash

source ../utils.sh

install zsh

install git
install curl

sh -c "RUNZSH=no $(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

replace_config ~ .zshrc
replace_config ~ .zsh_aliases
replace_config ~ .zsh_binds
replace_config ~ .p10k.zsh

git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

