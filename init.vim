"source /usr/share/vim/google/google.vim
source ~/.config/nvim/common.vim

call plug#begin()

" sync paste boards
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Pope Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
" Plug 'neomake/neomake'
" Plug 'w0rp/ale'

" Files and Search
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'kien/ctrlp.vim'

" Syntax
Plug 'elmcast/elm-vim'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['rust', 'elm', 'scss', 'css', 'java']
Plug 'rust-lang/rust.vim'

" Prettify stuff
Plug 'avh4/elm-format'

" Themes
Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}

" auto-completion
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" neovim language client
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh'
      \ }

" Clojure
" Plug 'Olical/conjure', {'tag': 'v4.19.0'}

" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Harpoon
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'heavenshell/vim-jsdoc', {
      \ 'for': ['javascript', 'javascript.jsx','typescript'],
      \ 'do': 'make install'
      \}

call plug#end()

let g:oscyank_term = 'default'  " or 'tmux', 'screen', 'kitty', 'default'

augroup clippy
  autocmd!
  autocmd TextYankPost *
        \   if (
        \    v:event.regname is "" ||
        \    v:event.regname is "*" ||
        \    v:event.regname is "+" ||
        \    v:event.regname is "0"
        \   )
        \ | call OSCYankString(join(v:event.regcontents, "\n"))
        \ | endif
augroup END

" execute pathogen#infect()

syntax on
colorscheme jellybeans

" Better display for messages
set cmdheight=2

map <leader>k :NERDTreeToggle<cr>
map <leader>m :NERDTreeFind<cr>
map <leader>t :15sp +te<cr>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd FileType cshtml EmmetInstall
autocmd Filetype fsharp setlocal tabstop=4 shiftwidth=4 softtabstop=4

" =============================================================================
" Telescope Settings
" =============================================================================
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" =============================================================================
" Git Settings
" =============================================================================
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gg :Git<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>ga :Git commit --amend<CR>
nmap <leader>gp :Git push origin HEAD:refs/for/master
" nmap <leader>gh :diffget //3<CR>
" nmap <leader>gu :diffget //2<CR>

" =============================================================================
" Markdown Preview
" =============================================================================

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0
      \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']


" =============================================================================
" CoC Settings
" =============================================================================

" Use <tab> and <S-tab> to navigate completion list: >
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion: >
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use:
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode (requires coc-snippets):
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" " plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "<CR>"

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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current
" paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" " Use <C-d> for select selections ranges, needs server support, like:
" coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h
" coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Coc Pretter
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" JS DOC
nmap <leader>j <Plug>(jsdoc)


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


