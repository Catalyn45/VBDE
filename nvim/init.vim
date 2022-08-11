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
Plug 'dense-analysis/ale'
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'

" Plug 'github/copilot.vim'
call plug#end()

lua << EOF
require("nvim-autopairs").setup {}
EOF

if (has("termguicolors"))
    set termguicolors
endif

lua require'colorizer'.setup()

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

" set signcolumn=no

let g:ale_linters = {'python': ['flake8']}

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

set number

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.o$', '\.d$', '\.so', '\.a', 'GTAGS', 'GRTAGS', 'GPATH']

nnoremap <C-k> :ClangFormat<CR>
let g:clang_format#detect_style_file = 1

nnoremap <C-f> :cs

"nnoremap <Tab> <C-w>w

set ts=4
set sw=4
set expandtab
set list
set cursorline
set autoindent

colorscheme gruvbox

if (has("nvim"))
	:tnoremap <A-h> <C-\><C-N><C-w>h
	:tnoremap <A-j> <C-\><C-N><C-w>j
	:tnoremap <A-k> <C-\><C-N><C-w>k
	:tnoremap <A-l> <C-\><C-N><C-w>l
	:tnoremap <A-u> <C-\><C-N>:vertical resize +5<CR>
	:tnoremap <A-i> <C-\><C-N>:res +5<CR>
	:tnoremap <A-o> <C-\><C-N>:res -5<CR>
	:tnoremap <A-p> <C-\><C-N>:vertical resize -5<CR>
	:tnoremap <A-1> <C-\><C-N>:buffer 1<CR>
	:tnoremap <A-2> <C-\><C-N>:buffer 2<CR>
	:tnoremap <A-3> <C-\><C-N>:buffer 3<CR>
	:tnoremap <A-4> <C-\><C-N>:buffer 4<CR>
	:tnoremap <A-5> <C-\><C-N>:buffer 5<CR>
	:tnoremap <A-6> <C-\><C-N>:buffer 6<CR>
	:tnoremap <A-7> <C-\><C-N>:buffer 7<CR>
	:tnoremap <A-8> <C-\><C-N>:buffer 8<CR>
	:tnoremap <A-9> <C-\><C-N>:buffer 9<CR>
	:nnoremap <A-t> :term<CR> 
	:tnoremap <C-q> <C-\><C-N>:bd!<CR>
	:tnoremap <A-q> <C-\><C-N>:buffer #<CR>
	:tnoremap <Space><Tab> <C-\><C-N>:buffer #<CR>
	:tnoremap <Space>bd <C-\><C-N>:quit<CR>
en

inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


nnoremap <A-u> :vertical resize +5<CR>
nnoremap <A-i> :res +5<CR>
nnoremap <A-o> :res -5<CR>
nnoremap <A-p> :vertical resize -5<CR>

inoremap <A-u> <C-\><C-N>:vertical resize +5<CR>a
inoremap <A-i> <C-\><C-N>:res +5<CR>a
inoremap <A-o> <C-\><C-N>:res -5<CR>a
inoremap <A-p> <C-\><C-N>:vertical resize -5<CR>a

inoremap jk <Esc>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
nnoremap <C-b> :buffers<CR>

" nnoremap <C-m> :set rnu!<CR>
nnoremap S :%s//g<Left><Left>

set nohlsearch
set clipboard+=unnamedplus
set cscopetag
set nowrap

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

nmap <C-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>

nmap <C-Space><C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space><C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>a :scs find a <C-R>=expand("<cword>")<CR><CR>

highlight Normal ctermbg=none

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set undodir=~/.undovim
set undofile
set fsync
