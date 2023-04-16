o = vim.o
g = vim.g
fn = vim.fn

if fn.has('termguicolors') then
    o.termguicolors = true
end

require('plugins')

require('lsp')

require('shortcuts')

require('parser')

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.list = true
o.cursorline = true
o.autoindent = true
o.autoread = true

o.pumheight = 6

o.scrolloff = 8

o.hlsearch = false
o.incsearch = true

o.updatetime = 50
o.colorcolumn = "80"

o.clipboard = 'unnamedplus'
o.wrap = false
o.foldenable = false

o.undodir = fn.getenv("HOME") .. '/.undovim'
o.undofile = true
o.fsync = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd('colorscheme gruvbox')

g.ctrlp_custom_ignore = 'node_modules\\|DS_Store\\|git\\|\\.o\\|\\.d\\|\\.venv\\|venv\\|__pycache__'
g.ctrlp_working_path_mode = ''

g.airline_powerline_fonts = 1
g.airline_theme = 'base16_gruvbox_dark_hard'

g.NERDTreeWinPos = 'left'
g.NERDTreeIgnore = { '\\.o$', '\\.d$', '\\.so', '\\.a', 'GTAGS', 'GRTAGS', 'GPATH' }
