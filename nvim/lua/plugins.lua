local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'preservim/nerdtree'

-- git commands
Plug 'tpope/vim-fugitive'

Plug 'rhysd/vim-clang-format'

Plug 'morhetz/gruvbox'

-- status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-utils/vim-man'

Plug 'windwp/nvim-autopairs'

-- nice colors
Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-treesitter/nvim-treesitter'

-- lsp
Plug 'neovim/nvim-lspconfig'
Plug "williamboman/mason.nvim"
Plug 'williamboman/mason-lspconfig.nvim'
Plug "VonHeikemen/lsp-zero.nvim"

-- autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'


-- fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug "BurntSushi/ripgrep"
Plug 'nvim-telescope/telescope.nvim'

-- debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'

vim.call('plug#end')

-- move between header and source
vim.cmd('source ~/.config/nvim/plugged/switcher/a.vim')

require("nvim-autopairs").setup()

require("colorizer").setup()
