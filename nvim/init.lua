o = vim.o
g = vim.g
fn = vim.fn

if fn.has('termguicolors') then
    o.termguicolors = true
end

require('plugins')

require('shortcuts')

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.list = true
o.cursorline = true
o.autoindent = true
o.autoread = true

o.hlsearch = false
o.clipboard = 'unnamedplus'
o.cscopetag = true
o.wrap = false
o.foldenable = false

o.undodir = fn.getenv("HOME") .. '/.undovim'
o.undofile = true
o.fsync = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd('colorscheme gruvbox')

-- TODO: find a replacement for this crap
if fn.has('cscope') then
  o.csprg = '/bin/cscope'
  o.csto = 0
  o.cst = true

  if fn.filereadable('/usr/include/cscope.out') == 1 then
    vim.cmd('silent cs add /usr/include/cscope.out')
  end

  if fn.filereadable('cscope.out') == 1 then
    vim.cmd('silent cs add cscope.out')
  elseif vim.env.CSCOPE_DB then
    vim.cmd('silent cs add ' .. vim.env.CSCOPE_DB)
  end
end

g.ctrlp_custom_ignore = 'node_modules\\|DS_Store\\|git\\|\\.o\\|\\.d\\|\\.venv\\|venv\\|__pycache__'
g.ctrlp_working_path_mode = ''

g.airline_powerline_fonts = 1
g.airline_theme = 'base16_gruvbox_dark_hard'

g.NERDTreeWinPos = 'left'
g.NERDTreeIgnore = { '\\.o$', '\\.d$', '\\.so', '\\.a', 'GTAGS', 'GRTAGS', 'GPATH' }
