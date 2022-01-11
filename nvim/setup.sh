sudo pacman -S neovim
mkdir -p ~/.config/nvim
cp -r * ~/.config/nvim/
nvim -c "PlugInstall | qall"
