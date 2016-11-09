export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/tormenta/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# bindkeys for my weird terminals

bindkey '^[[1;5C' forward-word      # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word     # [Ctrl-LeftArrow] - move backward one word
bindkey '^[OH' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete

source ~/.profile

source  ~/zsh-themes/powerlevel9k/powerlevel9k.zsh-theme
#source  ~/zsh-themes/lambda-mod-zsh-theme/lambda-mod.zsh-theme
#source /usr/share/oh-my-zsh/zshrc

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

# danger zone

alias yolo="yaourt -Syyuua --noconfirm --devel"

##
## my custom functions
##

monitor () {
    if [[ $# == 0 ]]; then
        watch -n 2 ls -lah
    else 
        watch -n 2 ls -lah $1
    fi
}

# makes dated archives of directories passed as arguments

backup () {
    fecha=$(date +%Y-%m-%d-%H%M%S)
    if [[ $# == 0 ]]; then
        echo 'usage: backup directory1 [directory2 directory3 ...]'
    else 
        for i;
        do [[ -d $i ]] && tar zcfv $i.$fecha.tar.gz $i;
        done
    fi
}

# default: starts a git repo for a classic Garrido Warriors style C-project
# options: create an html/css/js project ( -html)
# options: create an html/css/js project ( -html)

start () {
    if [[ -d .git ]]; then
        echo 'Error: this is already a git repository. Use this in an empty directory.'
    else
        if [[ $(ls -A) ]]; then
            echo 'Error: there are files in this directory. Use this in an empty directory.'
        else
            git init
            echo 'Git repository intitialized. Remember to add the remote address.'
            if [[ $# == 0 || $1 == "-c" ]]; then
                mkdir -p bin doc includes lib/lobj obj src srclib
                echo "# $USER - $(date +%Y-%m-%d)" >> Makefile
                [[ -a $HOME/Templates/Makefile ]] && cat $HOME/Templates/Makefile >> Makefile
                [[ -a $HOME/Templates/c.gitignore ]] && cp $HOME/Templates/c.gitignore .gitignore

            else
                if [[ $1 == "-html" ]]; then
                    mkdir -p css files/images files/json files/videos js
                    echo -e "<!-- $USER - $(date +%Y-%m-%d) -->\n" >> index.html
                    [[ -a $HOME/Templates/index.html ]] && cat $HOME/Templates/index.html >> index.html
                    [[ -a $HOME/Templates/styles.css ]] && cp $HOME/Templates/styles.css .
                elif [[ $1 == "-cpp" || $1 == "-c++" ]]; then
                    mkdir -p bin doc includes lib/lobj obj src srclib
                    echo "# $USER - $(date +%Y-%m-%d)" >> Makefile
                    [[ -a $HOME/Templates/Makefile.cpp ]] && cat $HOME/Templates/Makefile.cpp >> Makefile   # special cpp Makefile
                    [[ -a $HOME/Templates/c.gitignore ]] && cp $HOME/Templates/c.gitignore .gitignore
                elif [[ $1 == "-java" ]]; then
                    mkdir -p bin doc out src
                    echo -e "<!-- $USER - $(date +%Y-%m-%d) -->\n" >> pom.xml
                    [[ -a $HOME/Templates/pom.xml ]] && cat $HOME/Templates/pom.xml >> pom.xml
                    [[ -a $HOME/Templates/java.gitignore ]] && cp $HOME/Templates/java.gitignore .gitignore
                fi
            fi
        fi
        gaa
    fi
}


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
