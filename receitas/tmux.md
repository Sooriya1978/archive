Ver sessões ativas: 

    tmux list-sessions

Acessar uma sessão:

  tmux attach -t thiago_tmux

Sair de uma sessão:

    tmux detach

Matar uma sessão:

    tmux kill-session -t thiago_tmux

Criar nova sessão:

    tmux new -s thiago_work

Trocar de sessão:

    tmux switch -t thiago_work

Nova Janela:

    tmux new-window (prefix + c)

Seleciona janela:

    tmux select-window -t :0-9 (prefix + 0-9)


tmux split-window (prefix + “)`
    splits the window into two vertical panes
`tmux split-window -h (prefix + %)`
    splits the window into two horizontal panes
`tmux swap-pane -[UDLR] (prefix + { or })`
    swaps pane with another in the specified direction
`tmux select-pane -[UDLR]`
    selects the next pane in the specified direction
`tmux select-pane -t :.+`
    selects the next pane in numerical order 
