local u = require('utils')

u.vnoremap('J', ":m '>+1<CR>gv=gv")
u.vnoremap('K', ":m '<-2<CR>gv=gv")

u.noremap('<C-n>', ':NERDTreeToggle<CR>')

u.nnoremap('<C-d>', '<C-d>zz')
u.nnoremap('<C-u>', '<C-u>zz')

u.nnoremap('n', 'nzzzv')
u.nnoremap('N', 'Nzzzv')

u.nnoremap('<A-o>', ':A<CR>')

u.nnoremap('<A-]>', ':bnext<CR>')
u.nnoremap('<A-[>', ':bprev<CR>')

u.inoremap('<A-]>', '<C-\\><C-N>:bnext<CR>')
u.inoremap('<A-[>', '<C-\\><C-N>:bprev<CR>')

u.nnoremap('[q', ':cprev<CR>')
u.nnoremap(']q', ':cnext<CR>')

u.nnoremap('[Q', ':cfirst<CR>')
u.nnoremap(']Q', ':clast<CR>')

u.nnoremap('gb', ':bn<CR>')
u.nnoremap('gB', ':bp<CR>')

u.nnoremap('<C-b>', ':buffers<CR>')

u.nnoremap('S', ':%s//gc<Left><Left><Left>', false)

-- u.nnoremap('g<C-]>',  ':cs find 3 <C-R>=expand("<cword>")<CR><CR>')
-- u.nnoremap('g<C-\\>', ':cs find 0 <C-R>=expand("<cword>")<CR><CR>')

u.noremap('<Up>',    '<Nop>')
u.noremap('<Down>',  '<Nop>')
u.noremap('<Left>',  '<Nop>')
u.noremap('<Right>', '<Nop>')

u.inoremap('<Up>',   '<Nop>')
u.inoremap('<Down>', '<Nop>')
u.inoremap('<Left>', '<Nop>')
u.inoremap('<Right>','<Nop>')

