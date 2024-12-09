# vim: set ft=bash:

# Shell
alias l='ls -lah'
alias ll='ls -l'
alias la='ls -lAh'

alias gi="grep -i"

# Git
alias gb='git branch -vv'
alias gst='git status'
alias gp='git push'
alias gpf='git push --force-with-lease --force-if-includes'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias glo='git log --oneline --decorate'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
