local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'rhysd/vim-clang-format'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'
vim.call('plug#end')

vim.cmd('source ~/.config/nvim/plugged/switcher/a.vim')

local req_status, p = pcall(require, "nvim-autopairs")
if req_status then
    p.setup {}
end

req_status, p = pcall(require, "colorizer")
if req_status then
    p.setup {}
end
