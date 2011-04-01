export PATH=/usr/local/bin:/usr/local/sbin:"${PATH}"
export CDPATH=".:~:~/projects"

# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
PS1="\[\033[0;34m\]\w\n\[\033[0;31m\]♥\[\033[0m\] "


alias o='open . &'		# finder

alias ..='cd ..'   # up one dir

alias a='ls -A' # -A all except literal . ..
alias c='clear'
alias cdd='cd -'  # goto last dir cd'ed from
alias cl='clear; l'
alias cls='clear; ls'
alias h='history'
alias l.='ls -d .[^.]*'
alias l='ls -lhGt'  # -l long listing, most recent first
alias la="ls -A -l -G"
alias lh="ls -lh"
alias ll='ls -lhG'  # -l long listing, human readable, no group info
alias ls='ls -G'
alias lt='ls -lt' # sort with recently modified first


alias g='git status'
alias ga="git add ."
alias gl='git pull'
alias gp='git push'

# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}
