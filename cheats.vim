" ========================
"       CHEAT SHEET
" ========================

" Language Server leader quick keys
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" Spell Check Commands
]s  "Next spelling mistake
[s  "Previous spelling mistake
z=  "Give suggestions (prepend 1, use first suggestions automatically)
zg  "Add misspelled to spell file
zug "Remove word from spell file

