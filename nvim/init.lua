o = vim.o
g = vim.g
fn = vim.fn

g.mapleader = ""

o.termguicolors = true

require('plugins')
require('lsp')
require('shortcuts')
require('parser')
require('debugging')

-- have some problems for now

--[[ o.foldenable = false
o.foldmethod = "expr"
o.foldexpr="nvim_treesitter#foldexpr()"

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx zR",
}) ]]

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.list = true
o.cursorline = true
o.autoindent = true
o.autoread = true
o.laststatus = 3

o.ignorecase = true
o.smartcase = true


o.pumheight = 6

o.scrolloff = 8

o.hlsearch = false
o.incsearch = true

o.clipboard = 'unnamedplus'
o.wrap = false

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
g.NERDTreeIgnore = { '\\.o$', '\\.d$', '\\.so', '\\.a', '__pycache__', 'GTAGS', 'GRTAGS', 'GPATH' }

local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

-- set make to running the current file if the file is python
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = "python",
    callback = function ()
        vim.cmd('compiler pyunit')
        vim.opt_local.mp = 'python %'
    end
})

-- set make to cargo run if rust
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = "rust",
    callback = function ()
        vim.cmd('compiler rustc')
        vim.opt_local.mp="cargo run"
    end
})

-- set make to gcc if C and not makefile
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = "c",
    callback = function ()
        local makefile_path = vim.fn.getcwd() .. '/Makefile'
        local f = io.open(makefile_path)
        if f ~= nil then
            f:close()
            return
        end

        vim.cmd('compiler gcc')
        vim.opt_local.mp="gcc % && ./a.out"
    end
})

-- set make to gcc if CPP and not makefile
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = "cpp",
    callback = function ()
        local makefile_path = vim.fn.getcwd() .. '/Makefile'
        local f = io.open(makefile_path)
        if f ~= nil then
            f:close()
            return
        end

        vim.cmd('compiler gcc')
        vim.opt_local.mp="gcc % -lstdc++ && ./a.out"
    end
})

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

vim.api.nvim_create_user_command('Q',function()
    vim.cmd('q')
    vim.cmd('q')
end,{})

vim.api.nvim_create_user_command('G',function()
    vim.cmd('tab Git')
end,{})

-- custom user config
local user_config_file = vim.fn.getcwd() .. '/.nvim.lua'
local f = io.open(user_config_file)
if f ~= nil then
    f:close()
    vim.cmd(":luafile " .. user_config_file)
end

