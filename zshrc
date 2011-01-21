# http://www.zsh.org/
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH:~/dotfiles/bin:~/android-sdk-mac_86/tools
export CDPATH=$HOME:$HOME/projects

export RUBYOPT=rubygems		# make rubygems automatically available for my ruby scripts

setopt promptsubst 		# Expansion for prompt string

autoload -U promptinit		# Loading presintalled themes
promptinit
prompt botta			# Using grb theme

autoload -U compinit		# Completion
compinit
setopt MENU_COMPLETE
zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts ) # adding completion for ssh hosts based on known_hosts file
zstyle ':completion:*' menu select=2 # nice menu for completion selection

export EDITOR="emacs"

setopt correctall		# autocorrection for typos

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export GREP_OPTIONS="--color"	# grep with colors


export HISTSIZE=1000		# default history of 30 is not enough nowadays...
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

REPORTTIME=10 # Show elapsed time if command took more than X seconds
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]} # Make CTRL-W delete after other chars, not just spaces


# find a process easily
function gps() {
    ps -A | grep "$*" | grep -v grep
}

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
alias md='mkdir -p' # create directory with intermediate directory if required


alias g='git status'
alias ga="git add ."
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gm="git mergetool"
alias gp='git push'
alias ungit="find . -name '.git' -exec rm -rf {} \;"

alias bs="bundle exec autotest"

# Quickly clobber a file and checkout
function grf() {
    rm $1
    git checkout $1
}
# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.