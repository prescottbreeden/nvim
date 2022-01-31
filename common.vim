filetype on
filetype plugin indent on

" =============================================================================
" Sets
" =============================================================================

" Files, backups and undo
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set autoindent         " copy indent from current line, over to the new line
set colorcolumn=80     " column width 80 char default
set expandtab          " Make sure that every file uses spaces not tabs
set foldmethod=indent
set foldnestmax=10
set history=1000       " Save 1,000 items in history
set hlsearch           " Highlight search matches
set ignorecase         " Ignore case when searching
set incsearch          " Enable incremental searching
set list               " Show invisible characters
set nofoldenable
set nowrap             " Turn off line wrapping
set number             " Turn on line numbering
set relativenumber     " Turn on relative line numbering
set ruler              " Show the line and column number of the cursor position
set scrolloff=5        " Show a few lines of context around the cursor
set shiftround         " Round indent to multiple of 'shiftwidth'
set showcmd            " Display the incomplete commands in the bottom of your screen
set smartcase          " Override 'ignorecase' if search pattern has upper characters
set smartindent        " Do smart indenting when starting a new line
set splitbelow         " New splits will be below current buffer
set t_Co=256           " Explicityly tell vim that the terminal supoprts 256 colors
set wildmenu           " Display completion matches on your status line
set pyxversion=3

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Clojure 
let g:coc_global_extensions = ['coc-conjure']

" ELM settings
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

let NERDTreeShowHidden=1
let g:deoplete#enable_at_startup=1
let g:airline_theme='simple'
let g:pymode_python = 'python3'
let g:neomake_open_list=2

" nvim python paths
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" utilisnip settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ctrl-p search
let g:ctrlp_max_files=0

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" \ 'typescript': ['/usr/bin/typescript-language-server', '--stdio'],
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

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

" =========================
" Key Mapping Modifications
" =========================

let mapleader=','
inoremap jk <esc>
map <space> :

" Disable arrow key cursor motion
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap <C-n> :nohl<cr>
map <C-m> ]m
nnoremap <leader>a =ip

nnoremap <leader>s :set spell!<cr>

" open cheat sheet window
nnoremap <leader>c :nos botright 40vs ~/.config/nvim/cheats.vim<cr>

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

" spellcheck commands
" ]s  Next spelling mistake
" [s  Previous spelling mistake
" z=  Give suggestions (prepent 1, use first suggestions automatically)
" zg  Add mispelled to spellfile
" zug Remove word from spellfile

