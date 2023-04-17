o = vim.o
g = vim.g
fn = vim.fn

g.mapleader = ""

o.termguicolors = true

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

o.clipboard = 'unnamedplus'
o.wrap = false
o.foldenable = false

o.undodir = fn.getenv("HOME") .. '/.undovim'
o.undofile = true
o.fsync = true

o.updatetime = 50

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd('colorscheme gruvbox')

g.airline_powerline_fonts = 1
g.airline_theme = 'base16_gruvbox_dark_hard'
g.airline_extensions_tabline_enabled = 1
g.airline_extensions_tabline_formatter = 'unique_tail_improved'

g.airline_extensions = {'branch', 'tabline'}

g.airline_section_y = '%{bufnr("%")}'
g.airline_section_z = '%{strftime("%c")}'

g.NERDTreeWinPos = 'left'
g.NERDTreeIgnore = { '\\.o$', '\\.d$', '\\.so', '\\.a', 'GTAGS', 'GRTAGS', 'GPATH' }


local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         vim.cmd "redraw"
      end
   end,
})
