#!/bin/bash

source ../utils.sh

install vim
install neovim

install curl
install git

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
git clone https://github.com/github/copilot.vim.git && \
git clone https://github.com/norcalli/nvim-colorizer.lua.git && \
git clone https://github.com/windwp/nvim-autopairs.git'

replace_config ~/.config/nvim init.lua

mkdir -p ~/.config/nvim/lua

replace_config ~/.config/nvim/lua plugins.lua
replace_config ~/.config/nvim/lua shortcuts.lua
replace_config ~/.config/nvim/lua utils.lua

nvim -c "PlugInstall | qall" 2> /dev/null

