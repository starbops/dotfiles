"" Remove ALL autocommands for the current group
autocmd!

"" Encoding
set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

"" Tabs
set tabstop=4           " The only command that will affect how text displays
set shiftwidth=4        " Reindent operations (<< and >>)
set softtabstop=4       " When you hit <Tab> in insert mode
set expandtab           " Turn <Tab> into spaces when hitting <Tab>

"" Colorful
set t_Co=256
syntax on
set background=dark

"" Column
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

"" Indentation
set autoindent
filetype plugin indent on

"" Misc
set nocompatible
set nomodeline
set ruler
set number
set relativenumber
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set confirm
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set autoread
set history=700
set ffs=unix,dos,mac

"" Leader
let mapleader=","

"" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <leader><space> :noh<cr>

"" Make < and > as a pair
set showmatch
set matchpairs+=<:>

"" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"" For convenience
nnoremap ; :
vnoremap ; :
inoremap fj <ESC>

"" Tab pages
nnoremap <leader>h gT
nnoremap <leader>l gt
nnoremap <leader>e :tabedit 

"" Split panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Toggle paste mode
nnoremap <F3> :set paste!<CR>

"" Last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
set viminfo^=%

"" Highlight trailing whitespaces, [spaces]+[tab] and [tab]+[space]
autocmd BufNewFile,BufRead * hi ExtraWhitespace ctermbg=red guibg=red
autocmd BufNewFile,BufRead * match ExtraWhitespace /\s\+$\| \+\ze\t\|\t\+\ze /

"" Indentation for HTML syntax
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2

