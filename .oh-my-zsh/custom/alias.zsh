alias dj='python manage.py'
alias tnew='tmux new -s'
alias tatt='tmux attach -t'
alias psdev='pserve --reload development.ini'
alias findproj='ls $HOME/Projects | fzf'
alias project='echo $HOME/Projects/$(ls $HOME/Projects | fzf)'
alias tstart='tmuxinator start'
alias topen='tmuxinator open'
alias tlist='tmuxinator list'
alias tstop='tmuxinator stop'
alias tcopy='tmuxinator copy'
alias vim='nvim'
alias vi='nvim'
#alias tmux='tmux -2'
# alias yaourt='yay'
alias open='xdg-open'
alias gco='git co $(git branch | fzf)'
alias gpo='git pull origin'
alias gcob='git stash && git co -b $(git branch -a | fzf)'
alias branch='echo $(git branch | fzf)'
alias tp='tmuxp load -y $HOME/.tmuxp/$(exa $HOME/.tmuxp/ | fzf)'
alias cdtp='cd $HOME/.tmuxp/'
alias ls='exa --icons'
alias df='dfc'
