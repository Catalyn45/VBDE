call plug#begin()
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'rhysd/vim-clang-format'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

source ~/.config/nvim/plugged/switcher/a.vim

if (has("termguicolors"))
    set termguicolors
endif

lua << EOF
local req_status, p = pcall(require, "nvim-autopairs")
if req_status then
    p.setup {}
end

req_status, p = pcall(require, "colorizer")
if req_status then
    p.setup {}
end
EOF

set ts=4
set sw=4
set expandtab
set list
set cursorline
set autoindent
set autoread

set nohlsearch
set clipboard+=unnamedplus
set cscopetag
set nowrap
set nofoldenable

set undodir=~/.undovim
set undofile
set fsync

set number relativenumber

colorscheme gruvbox

highlight Normal ctermbg=none

if has("cscope")
    set csprg=/bin/cscope
    set csto=0
    set cst
    " add any database in current directory
    if filereadable("/usr/include/cscope.out")
        silent cs add /usr/include/cscope.out
    endif
    if filereadable("cscope.out")
        silent cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        silent cs add $CSCOPE_DB
    endif
endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.o\|\.d\|\.venv\|venv\|__pycache__'
let g:ctrlp_working_path_mode = ''

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.o$', '\.d$', '\.so', '\.a', 'GTAGS', 'GRTAGS', 'GPATH']

nmap <A-o> :A<CR>

nnoremap <A-]> :bnext <CR>
nnoremap <A-[> :bprev <CR>

inoremap <A-]> <C-\><C-N>:bnext <CR>
inoremap <A-[> <C-\><C-N>:bprev <CR>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

nnoremap <C-b> :buffers<CR>

nnoremap S :%s//gc<Left><Left>

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

