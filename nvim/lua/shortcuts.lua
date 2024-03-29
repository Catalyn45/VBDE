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
        },
        live_grep = {
            cwd = t_utils.buffer_dir()
        }
    }
}

local dap = require('dap')

u.nnoremap('<F5>', dap.continue)
u.nnoremap('<F6>', dap.terminate)
u.nnoremap('<F10>', dap.step_over)
u.nnoremap('<F12>', dap.step_out)
u.nnoremap('<F11>', dap.step_into)
u.nnoremap('<space>b', dap.toggle_breakpoint)
u.nnoremap('<space>r', dap.restart)

vim.g.copilot_enabled = false
local copilot_toggle = function ()
    if vim.g.copilot_enabled  then
        vim.cmd('Copilot disable')
        print("Copilot OFF")
        vim.g.copilot_enabled = false
        return
    end

    vim.cmd('Copilot enable')
    print("Copilot ON")
    vim.g.copilot_enabled = true
end

u.nnoremap('<space>p', copilot_toggle)

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
u.noremap('<space>o', builtin.resume)
u.noremap('<C-f>', builtin.live_grep)

u.noremap('<A-e>', ':NERDTreeToggle<CR>')

u.nnoremap('<C-d>', '<C-d>zz')
u.nnoremap('<C-u>', '<C-u>zz')
u.nnoremap('zZ', 'zszH')

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

u.nnoremap('S', ':%s//gc<Left><Left><Left>', false)
u.vnoremap('S', ':s//gc<Left><Left><Left>', false)

u.inoremap('<C-j>', '<Down>')
u.inoremap('<C-k>', '<Up>')

u.nnoremap('<space>e', ":%!xxd<CR>")
u.nnoremap('<space>w', ":%!xxd -r<CR>")

u.nnoremap('<space>m', ":make<CR>")

u.noremap('<Up>', ':resize -5<CR>')
u.noremap('<Down>', ':resize +5<CR>')
u.noremap('<Left>', ':vertical resize -5<CR>')
u.noremap('<Right>', ':vertical resize +5<CR>')

u.inoremap('<Up>', '<Nop>')
u.inoremap('<Down>', '<Nop>')
u.inoremap('<Left>', '<Nop>')
u.inoremap('<Right>', '<Nop>')

u.nnoremap('<C-j>', '<Plug>(VM-Add-Cursor-Down)')
u.nnoremap('<C-k>', '<Plug>(VM-Add-Cursor-Up)')

