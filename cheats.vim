" ========================
"       CHEAT SHEET
" ========================

// fix looker lang
git clean -fd && rm -rf looker-lang/ace_src && bin/prepare looker_lang

" ----
" tmux
" ----
" CL
tmux ls "list sessions
tmux attach -t [name] "attach session
tmux new -s [name] "create session
tmux rename-session -t [target] [name]
tmux kill-session -t [name] "kill/delete session
tmux kill-session -a "kill all session but the current
tmux kill-session -a [name] "kill all but named

" session commands
<C-a> d "detach from session

<C-a> c "create window
<C-a> [index] "select window
<C-a> , "rename window
:swap-window -t -1 "move current window to left by one
:swap-window -s 2 -t 1 "swap window 2 with window 1

<C-a> % " create vertical
<C-a> " <-- create horizontal split
<C-a> q "show pane numbers
<C-a> ! "convert pane to a window
<C-a> [arrow] "move to pane
<C-a> ; "toggle last active pane
<C-a> { or } "move pane left or right
<C-a> x "close current pane
<C-a> [arrow] "hold C to resize
<C-a> [ "enter navigation mode (q to exit)

" -----------
" spell check
" -----------
]s  "Next spelling mistake
[s  "Previous spelling mistake
z=  "Give suggestions (prepend 1, use first suggestions automatically)
zg  "Add misspelled to spell file
zug "Remove word from spell file

