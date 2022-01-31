" source /usr/share/vim/google/google.vim
source ~/.config/nvim/common.vim

call plug#begin()


" sync paste boards
Plug 'ojroques/vim-oscyank'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Pope Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

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
Plug 'Olical/conjure', {'tag': 'v4.19.0'}
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Harpoon
" Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't
" have it yet!
" Plug 'nvim-lua/popup.nvim'
" Plug 'ThePrimeagen/harpoon'

call plug#end()

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
" nnoremap <C-g> :Git<cr>
" nnoremap <C-c> :Git commit<cr>

" =============================================================================
" CoC Settings
" =============================================================================

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != \"-1" ? \"\<C-y>" :
" \"\<C-g>u\<CR>"

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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current
" paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" " Create mappings for function text object, requires document symbols
" feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <C-d> for select selections ranges, needs server support, like:
" coc-tsserver, coc-python
" " nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand',
" 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h
" coc-status`
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


