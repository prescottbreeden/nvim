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
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Pope Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Files and Search
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'

" Syntax
Plug 'elmcast/elm-vim'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['rust', 'elm', 'scss', 'css']

" Prettify stuff
Plug 'avh4/elm-format'

" Themes
Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}

" auto-completion
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim'

" neovim language client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }

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
set expandtab          " Make sure that every file uses spaces not tabs
set shiftround         " Round indent to multiple of 'shiftwidth'
set smartindent        " Do smart indenting when starting a new line
set autoindent         " copy indent from current line, over to the new line
set t_Co=256           " Explicityly tell vim that the terminal supoprts 256 colors
set list               " Show invisible characters
set splitbelow         " New splits will be below current buffer
" set splitright         " New splits will be to the right of current buffer
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" ELM settings
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
let g:polyglot_disabled = ['elm']

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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd FileType cshtml EmmetInstall
autocmd Filetype fsharp setlocal tabstop=4 shiftwidth=4 softtabstop=4

" ========================
" autocorrect common typos:
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
map <space> :

" Disable arrow key cursor motion
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <leader>k :NERDTreeToggle<cr>
map <leader>t :15sp +te<cr>

" Language Server leader quick keys
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" not sure what these do anymore
" nnoremap <leader>gfv :vertical <C-w>f<cr>
" nnoremap <leader>v :vsplit<cr>
map <C-m> ]m
nnoremap <leader>a =ip

nnoremap <C-n> :nohl<cr>
nnoremap <C-g> :Gstatus<cr>
nnoremap <C-c> :Gcommit<cr>

nnoremap cp yap<S-}>p
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

" =============
" CoC Settings
" =============

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Coc Pretter
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" =========================
" Vim Snippets
" =========================

function! CreateReactFunction()
  let name = 'Name' 
    call append(0, "import React from 'react';")
    call append(1, "")
    call append(2, "interface " . name ."Props {}")
    call append(3, "export const " . name . ": React.FC<" . name . "Props> = (props) => {")
    call append(4, "  return (")
    call append(5, '    <>')
    call append(6, '    </>')
    call append(7, '  );')
    call append(8, '};')
endfunction

map <leader>rf :call CreateReactFunction()<CR>


