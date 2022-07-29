#!/bin/bash

eval $INSTALL_CMD vim
eval $INSTALL_CMD neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

old_path=$(pwd)
mkdir -p ~/.config/nvim/plugged

sh -c 'cd ~/.config/nvim/plugged && \
git clone https://github.com/kien/ctrlp.vim.git && \
git clone https://github.com/nikvdp/ejs-syntax.git && \
git clone https://github.com/morhetz/gruvbox.git && \
git clone https://github.com/preservim/nerdtree.git && \
git clone https://github.com/vim-airline/vim-airline.git && \
git clone https://github.com/vim-airline/vim-airline-themes.git && \
git clone https://github.com/rhysd/vim-clang-format.git && \
git clone https://github.com/tpope/vim-fugitive.git && \
git clone https://github.com/airblade/vim-gitgutter.git && \
git clone https://github.com/vim-utils/vim-man.git && \
git clone https://github.com/dense-analysis/ale.git && \
git cline https://github.com/github/copilot.vim.git'

cd $old_path
cp ./nvim/init.vim ~/.config/nvim/
nvim -c "PlugInstall | qall"

