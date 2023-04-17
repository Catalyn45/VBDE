local u = require('utils')

u.vnoremap('J', ":m '>+1<CR>gv=gv")
u.vnoremap('K', ":m '<-2<CR>gv=gv")

u.nnoremap('<leader>p', '<Plug>(GitGutterPreviewHunk)')
u.nnoremap('<leader>u', '<Plug>(GitGutterUndoHunk)')
u.nnoremap('<leader>s', '<Plug>(GitGutterStageHunk)')

u.nnoremap('<leader>j', '<C-w>j')
u.nnoremap('<leader>k', '<C-w>k')
u.nnoremap('<leader>h', '<C-w>h')
u.nnoremap('<leader>l', '<C-w>l')

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

u.noremap('<Up>',    '<Nop>')
u.noremap('<Down>',  '<Nop>')
u.noremap('<Left>',  '<Nop>')
u.noremap('<Right>', '<Nop>')

u.inoremap('<Up>',   '<Nop>')
u.inoremap('<Down>', '<Nop>')
u.inoremap('<Left>', '<Nop>')
u.inoremap('<Right>','<Nop>')

