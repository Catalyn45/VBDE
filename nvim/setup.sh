#!/bin/bash

source ../utils.sh

install vim
install neovim

install curl
install git

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

replace_config ~/.config/nvim init.lua

mkdir -p ~/.config/nvim/lua

replace_config ~/.config/nvim/lua lua/plugins.lua
replace_config ~/.config/nvim/lua lua/shortcuts.lua
replace_config ~/.config/nvim/lua lua/utils.lua
replace_config ~/.config/nvim/lua lua/lsp.lua
replace_config ~/.config/nvim/lua lua/parser.lua
replace_config ~/.config/nvim/lua lua/debugging.lua

nvim -c "PlugInstall | qall" 2> /dev/null

replace_config ~/.config/nvim/plugged/switcher a.vim
