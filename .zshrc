# Needed by stjerm

export TERM="xterm-256color"

# THEME

# Generated prompt (by promptline.vim)
#source $HOME/zsh/zsh-airline-prompt/prompt.sh

# 9k
POWERLEVEL9K_MODE="awesome-fontconfig"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs ssh virtualenv go_version host time)

POWERLEVEL9K_GO_VERSION_BACKGROUND="118"
POWERLEVEL9K_GO_VERSION_FOREGROUND="231"

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

POWERLEVEL9K_DIR_HOME_BACKGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

POWERLEVEL9K_BACKGROUND_JOBS_ICON=''

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
source $HOME/zsh/powerlevel9k/powerlevel9k.zsh-theme

# some preinstalled prompt
#autoload -Uz promptinit
#promptinit
#prompt bigfade
#prompt fire red yellow red white white white

# powerless
#powerless_keep_colors=true
#source $HOME/zsh/powerless/powerless.zsh
#source $HOME/zsh/powerless/utilities.zsh

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


#
## Lines added manually by me.
#

# bindkeys for my weird terminals

bindkey -e
bindkey '^[[1;5C' forward-word      # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word     # [Ctrl-LeftArrow] - move backward one word
bindkey '^[OH' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete
#bindkey '^[.' copy-prev-shell-word

source $HOME/.env
source $HOME/.functions

#source <(gopass completion zsh)

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

alias gig="$EDITOR .gitignore"
alias gdiff="git diff"
alias grem="git remote"
alias gtag="git tag"
alias gshow="git show"

# shady git commands

alias gbr="git branch"
alias gch="git checkout"
alias gmg="git merge"
alias grb="git rebase"
alias garch="git archive --format=zip -v -o"

# useful general aliases

alias sudo="sudo "
alias pac="time trizen"
alias pacup="time yay -Syuu"
#alias pac="time yay"
#alias pacs="time pacaur -S"
#alias pacsoup="time pacaur -Syuua"

# lock is i3lock-fancy from meskarune (github)
alias suspend="i3lock-fancy -- maim -m 5 -f jpg -u && systemctl suspend"

alias vimrc="$EDITOR $HOME/.vimrc"
alias nvimrc="$EDITOR $HOME/.config/nvim/init.vim"
alias zshrc="$EDITOR $HOME/.zshrc"
alias i3conf="$EDITOR $HOME/.config/i3/config"

#alias vim="nvim"
alias vi="vim"

# useful specific aliases

alias mkdirtoday="mkdir $(date +%Y_%m_%d)"
alias pdb="python -m pdb"
alias teams="google-chrome-stable -app="https://teams.microsoft.com/""

# stop hitting the goddamn ñ key

#alias lñ="lenye && sleep 1 && ll"
#alias ñ="lñ"
#alias ññ="lñ"

# mistyping is over

alias sl="sl -aFc"
