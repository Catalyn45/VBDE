local u = require('utils')

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local t_utils = require('telescope.utils')

local telescope_mappings = {
    i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<Esc>"] = actions.close
    }
}

require("telescope").setup {
    defaults = {
        mappings = telescope_mappings,
    },
    pickers = {
        find_files = {
            file_ignore_patterns = { "node_modules", "\\.pyc$", "\\.d$", "\\.exe$", "\\.so$", "\\.a$", "\\.o$", "\\.lib$", "__pycache__", "\\.cache" },
            cwd = t_utils.buffer_dir(),
            follow = true
        }
    }
}

local dap = require('dap')

u.nnoremap('<F5>', dap.continue)
u.nnoremap('<F6>', dap.terminate)
u.nnoremap('<F10>', dap.step_over)
u.nnoremap('<F11>', dap.step_into)
u.nnoremap('<F12>', dap.step_out)
u.nnoremap('<space>b', dap.toggle_breakpoint)
u.nnoremap('<space>r', dap.restart)

local dapui = require('dapui')

u.nnoremap('<F4>', dapui.toggle)

u.vnoremap('J', ":m '>+1<CR>gv=gv")
u.vnoremap('K', ":m '<-2<CR>gv=gv")

u.nnoremap('<space>j', '<C-w>j')
u.nnoremap('<space>k', '<C-w>k')
u.nnoremap('<space>h', '<C-w>h')
u.nnoremap('<space>l', '<C-w>l')

u.noremap('gp', ":diffput<CR>")
u.noremap('go', ":diffget<CR>")


u.noremap('<C-p>', builtin.find_files)
u.noremap('<C-k>', builtin.resume)
u.noremap('<C-f>', builtin.live_grep)

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


u.nnoremap('<space>e', ":%!xxd<CR>")
u.nnoremap('<space>w', ":%!xxd -r<CR>")

u.nnoremap('<space>m', ":make<CR>")

u.noremap('<Up>', '<Nop>')
u.noremap('<Down>', '<Nop>')
u.noremap('<Left>', '<Nop>')
u.noremap('<Right>', '<Nop>')

u.inoremap('<Up>', '<Nop>')
u.inoremap('<Down>', '<Nop>')
u.inoremap('<Left>', '<Nop>')
u.inoremap('<Right>', '<Nop>')

