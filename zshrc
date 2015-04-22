# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Use: export ZSH; ./theme_chooser.sh to get a preview of all themes
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# For my prompt theme. When set hides user and host on local computer
# with corresponding user
export DEFAULT_USER=aurelienbottazzini
export LANG=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8

alias l.="ls -ld .*"
alias tu="tmux -u"
alias tmux="tmux -u"
alias screen="screen -U"
alias o="open ."
alias pd="psql -p 5432 -h localhost -d "
alias funiq="awk '!x[$0]++' "

export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null ||echo"No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/ -/g' && echo
}

alias clean_open_with_list="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew thor rbenv)
export EDITOR="emacs -Q"

# unlimited postgre history
export HISTFILESIZE=
export HISTSIZE=

source $ZSH/oh-my-zsh.sh
source $HOME/projects/dotfiles/bin/bashmarks.sh

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH # for bzr to work properly
export CDPATH=:$HOME:$HOME/projects:$HOME/Documents/projects
# Customize to your needs...
export PATH=/usr/sbin:/usr/local/bin:~/.cabal/bin:/usr/local/share/npm/bin:/usr/local/sbin:$HOME/dotfiles/bin:/usr/local/lib/node_modules:$HOME/node_modules/less/bin:/opt/X11/bin:/sbin:$PATH

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# lscolors generator: http://geoff.greer.fm/lscolors/
export LSCOLORS="cxBxcxdxbaegedabagacad"
export LS_COLORS="di=32;40:ln=1;32;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

export UNITEUS_URL="uniteus.dev:3000"
export UNITEUS_BASE_HOST="uniteus.dev:3000"
export UNITEUS_SAAS_URL="saas.uniteus.dev:3000"
export UNITEUS_PRO_URL="pro.uniteus.dev:3000"
export UNITEUS_ADMIN_URL="admin.uniteus.dev:3000"
export UNITEUS_SETUP_URL="setup.uniteus.dev:3000"

export UNITEUS_REMOTE_IP="78.227.138.242"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/aurelienbottazzini/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Docker (default for Vagrant based boxes)
export DOCKER_HOST=tcp://localhost:2375
