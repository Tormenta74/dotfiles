#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# classic fancy aliases

alias lls="ls -lAhS"
alias ll="ls -lAh"
alias l="ls -l"
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"

# basic git commands

alias gst="git status"
alias gls="git ls-files"
alias grt="git read-tree"

alias ga="git add"
alias gaa="git add -A"
alias gcm="git commit"
alias gft="git fetch"
alias gpl="git pull"
alias gps="git push"
alias gl="git log --decorate"
alias glo="git log --oneline --decorate"
alias graph="git log --oneline --decorate --graph"

# shady git commands

alias gbr="git branch"
alias gch="git checkout"
alias gmg="git merge"
alias grb="git rebase"
alias grem="git remote"
alias gtag="git tag"
alias gshow="git show"
alias garch="git archive --format=zip -v -o"

# useful lab commands

alias psql="psql -U alumnodb si1"
alias vi="vim"
alias mkdirtoday="mkdir $(date +%Y_%m_%d)"
