#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...

# lscolors generator: http://geoff.greer.fm/lscolors/
export LSCOLORS="cxBxcxdxbaegedabagacad"
export LS_COLORS="di=32;40:ln=1;32;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

export VAGRANT_IP="192.168.33.10"
export DOCKER_HOST="tcp://192.168.33.10:2375"
export VAGRANT_DEFAULT_PROVIDER=parallels

export EDITOR="emacs -Q"

# unlimited postgre history
export HISTFILESIZE=
export HISTSIZE=

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH # for bzr to work properly
export CDPATH=:$HOME:$HOME/projects:$HOME/Documents/projects


export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

source $HOME/projects/dotfiles/bin/bashmarks.sh

alias l.="ls -ld .*"
alias tu="tmux -u"
alias tmux="tmux -u"
alias screen="screen -U"
alias o="open ."
alias pd="psql -p 5432 -h localhost -d "
alias funiq="awk '!x[$0]++' "

# alias delete_docker_containers="docker rm $(docker ps -a -q)"
# alias delete_docker_images="docker rmi $(docker images -q)"
