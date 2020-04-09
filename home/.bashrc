# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[[ -f ~/.config/shell/exports ]] && source ~/.config/shell/exports
[[ -f $XDG_CONFIG_HOME/shell/local ]] && source $XDG_CONFIG_HOME/shell/local
[[ -f $XDG_CONFIG_HOME/shell/aliases ]] && . $XDG_CONFIG_HOME/shell/aliases

# append to the history file, don't overwrite it
shopt -s histappend
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
HISTSIZE=1000
HISTFILESIZE=2000

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
      || complete -o default -o nospace -F _git g

# to use with bash_completion version 2 otherwise it makes bash startup very slow
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source $XDG_CONFIG_HOME/git/.git-completion.bash
source $XDG_CONFIG_HOME/git/.git-prompt.sh

export PS1='\[\e[34;4;3;1m\]\w\[\e[0m\]\[\e[35;1m\]$(__git_ps1 " (%s)")\n\[\e[0m\]\[\e[31;1m\]\$\[\e[0m\] '
__git_complete g _git

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/bash-completion/completions/fzf-key-bindings ] && source /usr/share/bash-completion/completions/fzf-key-bindings
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f ~/.config/fzf/.fzf.bash ] && source ~/.config/fzf/.fzf.bash
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash

hash rbenv 2>/dev/null && eval "$(rbenv init -)"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && ! shopt -q login_shell && hash tat 2>/dev/null
