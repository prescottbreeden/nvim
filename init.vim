call plug#begin()

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Pope Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'

" Files and Search
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'

" Syntax
Plug 'mhartington/vim-typings'
Plug 'elzr/vim-json'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-dtsm'
Plug 'Shougo/unite.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Themes
Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}


" auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'Quramy/tsuquyomi'

" Vimux
Plug 'benmills/vimux'

call plug#end()

execute pathogen#infect()

syntax on
filetype plugin indent on
colorscheme jellybeans

" Files, backups and undo
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" set runtimepath^=~/.vim/bundle/ctrlp.vim " ctrl-p
" set bg=dark            " tell vim using a dark background
set updatetime=100
set history=1000       " Save 1,000 items in history
set ruler              " Show the line and column number of the cursor position
set showcmd            " Display the incomplete commands in the bottom of your screen
set wildmenu           " Display completion matches on your status line
set scrolloff=5        " Show a few lines of context around the cursor
set hlsearch           " Highlight search matches
set incsearch          " Enable incremental searching
set ignorecase         " Ignore case when searching
set smartcase          " Override 'ignorecase' if search pattern has upper characters
set smarttab
set number             " Turn on line numbering
set relativenumber     " Turn on relative line numbering
set nowrap             " Turn off line wrapping
set colorcolumn=80     " column width 80 char default
set expandtab          " Make sure that every file uses real tabs, not spaces
set shiftround         " Round indent to multiple of 'shiftwidth'
set smartindent        " Do smart indenting when starting a new line
set autoindent         " copy indent from current line, over to the new line
set t_Co=256           " Explicityly tell vim that the terminal supoprts 256 colors
set list               " Show invisible characters
set splitbelow         " New splits will be below current buffer
set splitright         " New splits will be to the right of current buffer
set foldmethod=indent
set foldnestmax=10
set nofoldenable

let NERDTreeShowHidden=1
let g:deoplete#enable_at_startup=1
let g:airline_theme='dark'
let g:pymode_python = 'python3'
let g:neomake_open_list=2

" nvim python paths
let g:python_host_prog='/usr/local/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd FileType cshtml EmmetInstall

" emmet settings
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \  'typescript.tsx' : {
    \      'extends' : 'tsx',
    \  },
  \}

" Make a tab equal to x spaces
let s:tabwidth=2
exec 'set tabstop='     .s:tabwidth
exec 'set shiftwidth='  .s:tabwidth
exec 'set softtabstop=' .s:tabwidth


" ========================
" autocorrect basic typos:
" ========================

iabbrev waht what
iabbrev tehn then
iabbrev taht that
iabbrev adn and
iabbrev ot to
iabbrev aling align
iabbrev accross across
iabbrev hte the

" =========================
" Key Mapping Modifications
" =========================

let mapleader=','
inoremap jk <esc>

" Disable arrow key cursor motion
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <space> :
map <leader>k :NERDTreeToggle<cr>
map <leader>c :VimuxPromptCommand<cr>
map <leader>t :15sp +te<cr>
map <C-m> ]m

nnoremap <leader>gfv :vertical <C-w>f<cr>
nnoremap <leader>gff <C-w>f
nnoremap <C-n> :nohl<cr>
nnoremap <C-g> :Gstatus<cr>

nnoremap cp yap<S-}>p
nnoremap <leader>a =ip
nnoremap <leader>s :set spell!<cr>

" change window size
noremap <C-up> <C-w>+
noremap <C-down> <C-w>-
noremap <C-left> <C-w><
noremap <C-right> <C-w>>

" switch between windows with ctrl + h,j,k,l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-n>

" nnoremap <leader>f zc <-- fold code, too buggy
" spellcheck commands
" ]s  Next spelling mistake
" [s  Previous spelling mistake
" z=  Give suggestions (prepent 1, use first suggestions automatically)
" zg  Add mispelled to spellfile
" zug Remove word from spellfile

" Plug 'matthewbdaly/vim-filetype-settings'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'jason0x43/vim-js-indent'
" Plug 'Quramy/vim-js-pretty-template'
" Plug 'mxw/vim-jsx'
" PHP-specific integration
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'phpactor/ncm2-phpactor'
" multi-cursors
" Plug 'terryma/vim-multiple-cursors' <-- buggy

