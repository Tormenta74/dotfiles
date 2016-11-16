
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/tormenta/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#
## Lines added manually by me.
#

# bindkeys for my weird terminals

bindkey '^[[1;5C' forward-word      # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word     # [Ctrl-LeftArrow] - move backward one word
bindkey '^[OH' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete


source  $HOME/zsh-themes/powerlevel9k/powerlevel9k.zsh-theme
#source  ~/zsh-themes/lambda-mod-zsh-theme/lambda-mod.zsh-theme     # Never got this to work with git dirs. Maybe in the future I will work in my own theme.

source $HOME/.env
source $HOME/.functions

# classic fancy aliases

alias ll="ls -lah"
alias l="ls -l"
alias ls="ls --color=auto"
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

# useful general aliases

alias pac="pacman"
alias pacs="sudo pacman -S"
alias pacup="sudo pacman -Syuu"
alias yao="yaourt"

alias susp="systemctl suspend"

alias vimrc="vim $HOME/.vimrc"
alias zshrc="vim $HOME/.zshrc"

alias mv="idiot_mv"

# stop hitting the goddamn ñ key

alias lñ="echo 'LEÑE!'"

# exotic stuff

alias stopeclim="$ECLIPSE_HOME/eclim -command shutdown"

# danger zone

alias yolo="yaourt -Syyuua --noconfirm --devel"


