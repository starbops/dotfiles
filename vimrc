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
colorscheme peaksea

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
set nobackup            " no ~ file suffix
set ruler
set number
set relativenumber
set scrolloff=3         " remain number of lines at top and bottom
set showmode
set showcmd
set hidden
set wildmenu            " a better menu
set wildmode=list:longest
set visualbell
set confirm
set cursorline
set ttyfast
set backspace=indent,eol,start
set autoread
set history=700
set ffs=unix,dos,mac

"" Custom highlight groups
hi User1 ctermbg=green  ctermfg=red     guibg=green guifg=red
hi User2 ctermbg=red    ctermfg=blue    guibg=red   guifg=blue
hi User3 ctermbg=blue   ctermfg=green   guibg=blue  guifg=green

"" Status line
set laststatus=2
set statusline=%1*[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%*%2*%y%*%3*%t%*%h%m%r%=%c,%l/%L\ %P

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

"" Remove the Windows ^M - when the encoding gets messed up
nnoremap <leader>m mmHmt:%s/<C-v><CR>//ge<CR>'tzt'm

"" Toggle paste mode
nnoremap <leader>p :setlocal paste!<CR>

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

"" Indentation for Makefile syntax
autocmd BufNewFile,BufRead Makefile setlocal noexpandtab

"" AutoGen for RST files
" If a new ReStructuredText created, generate template for convenience.
function! CreateTimestamp()
    exe 's/$/===\r' .
                \ expand('%:t:r') .
                \ '\r===\r' .
                \ '\r:date: ' . strftime('%Y-%m-%d %H:%M') .
                \ '\r:modified: ' .
                \ '\r:tags: ' .
                \ '\r:category: ' .
                \ '\r:slug: ' .
                \ '\r:authors: Zespre Schmidt' .
                \ '\r:about_author: Bug generator' .
                \ '\r:email: starbops@gmail.com' .
                \ '\r:summary: ' .
                \ '\r\r'
endfun
autocmd BufNewFile *.rst call CreateTimestamp()

" If buffer modified, update any ':modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
    if &modified
        let save_cursor = getpos(".")
        let n = min([20, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}:modified: \).*#\1' .
                    \ strftime('%Y-%m-%d %H:%M') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre * call LastModified()

