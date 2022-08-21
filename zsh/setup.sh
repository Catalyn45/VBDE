#!/bin/bash

[[ -f ~/.zshrc ]] && cp ~/.zshrc ~/.zshrc.bak
rm ~/.zshrc
ln -s $PWD/.zshrc ~/

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

[[ -f ~/.p10k.zsh ]] && cp ~/.p10k.zsh ~/.p10k.zsh.bak
rm ~/.p10k.zsh
ln -s $PWD/.p10k.zsh ~/

source ~/.zshrc

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

source ~/.zshrc

