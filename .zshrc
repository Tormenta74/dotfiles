# Needed by stjerm

export TERM="xterm-256color"

# Generated prompt (by promptline.vim)
#source $HOME/zsh/zsh-airline-prompt/prompt.sh

# 9k

POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history battery time)
POWERLEVEL9K_BATTERY_ICON=" "
POWERLEVEL9K_HOME_ICON=" "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M   %d.%m.%y}"
source $HOME/zsh/powerlevel9k/powerlevel9k.zsh-theme

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/tormenta/.zshrc'

autoload -Uz compinit
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

#autoload -Uz promptinit
#promptinit
#prompt fire red yellow red white white white

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

alias pacss="pacaur -Ss"
alias pacs="pacaur -S"
alias pacsup="time pacaur -Syuua"
alias pacup="time sudo pacman -Syuu"

alias susp="i3lock-fancy -- scrot -q 1 && systemctl suspend"

alias vimrc="$EDITOR $HOME/.vimrc"
alias nvimrc="$EDITOR $HOME/.config/nvim/init.vim"
alias zshrc="$EDITOR $HOME/.zshrc"
alias i3conf="$EDITOR $HOME/.config/i3/config"

# useful specific aliases

alias arduino-ide="sudo /usr/share/arduino/arduino"

# stop hitting the goddamn ñ key

alias lñ="/usr/local/bin/lenye && sleep 1 && ll"
alias ñ="lñ"
alias ññ="lñ"

# danger zone

alias polo="pacaur -Syyuua --noconfirm --devel"


