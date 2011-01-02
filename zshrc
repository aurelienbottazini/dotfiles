# http://www.zsh.org/
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH:~/dotfiles/bin:~/android-sdk-mac_86/tools

setopt promptsubst 		# Expansion for prompt string

autoload -U promptinit		# Loading presintalled themes
promptinit
prompt wunjo			# Using wunjo theme

autoload -U compinit		# Completion
compinit

export EDITOR="emacs"

setopt correctall		# autocorrection for typos

alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export GREP_OPTIONS="--color"	# grep with colors

zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts ) # adding completion for ssh hosts based on known_hosts file

export HISTSIZE=1000		# default history of 30 is not enough nowadays...
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]} # Make CTRL-W delete after other chars, not just spaces

