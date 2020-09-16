# vim: set ft=bash:

# Shell
alias l='ls -lah'
alias ll='ls -l'
alias la='la -lAh'

# Git
alias gs='git status'
alias gb='git branch -vv'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
