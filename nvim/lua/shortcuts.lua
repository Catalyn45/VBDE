local u = require('utils')

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local telescope_mappings = {
    i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<Esc>"] = actions.close
    }
}

require("telescope").setup {
    pickers = {
        find_files = {
            file_ignore_patterns = { "node_modules", ".pyc$", ".d$", ".exe$", ".so$", ".a$", ".o$", ".lib$", "__pycache__" },
            mappings = telescope_mappings
        },
        live_grep = {
            mappings = telescope_mappings
        }
    }
}

u.vnoremap('J', ":m '>+1<CR>gv=gv")
u.vnoremap('K', ":m '<-2<CR>gv=gv")

u.nnoremap('<space>j', '<C-w>j')
u.nnoremap('<space>k', '<C-w>k')
u.nnoremap('<space>h', '<C-w>h')
u.nnoremap('<space>l', '<C-w>l')

u.noremap('<C-p>', builtin.find_files)
u.noremap('gf',    builtin.live_grep)

u.noremap('<C-n>', ':NERDTreeToggle<CR>')

u.nnoremap('<C-d>', '<C-d>zz')
u.nnoremap('<C-u>', '<C-u>zz')

u.nnoremap('n', 'nzzzv')
u.nnoremap('N', 'Nzzzv')

u.nnoremap('<A-o>', ':A<CR>')

u.nnoremap('<A-]>', ':bnext<CR>')
u.nnoremap('<A-[>', ':bprev<CR>')
u.nnoremap('<A-x>', ':bdel<CR>')

u.inoremap('<A-]>', '<C-\\><C-N>:bnext<CR>')
u.inoremap('<A-[>', '<C-\\><C-N>:bprev<CR>')

u.nnoremap('[q', ':cprev<CR>')
u.nnoremap(']q', ':cnext<CR>')

u.nnoremap('[Q', ':cfirst<CR>')
u.nnoremap(']Q', ':clast<CR>')

u.nnoremap('<C-b>', ':buffers<CR>')

u.nnoremap('S', ':%s//gc<Left><Left><Left>', false)

u.inoremap('<C-j>', '<Down>')
u.inoremap('<C-k>', '<Up>')

u.noremap('<Up>',    '<Nop>')
u.noremap('<Down>',  '<Nop>')
u.noremap('<Left>',  '<Nop>')
u.noremap('<Right>', '<Nop>')

u.inoremap('<Up>',   '<Nop>')
u.inoremap('<Down>', '<Nop>')
u.inoremap('<Left>', '<Nop>')
u.inoremap('<Right>','<Nop>')

