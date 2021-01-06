# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## History file configuration
# export HISTFILE="$XDG_DATA_HOME/zsh/history"
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
# [ -z "$HISTFILE" ] && HISTFILE="$XDG_DATA_HOME/zsh/history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000
#
### History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

stty -ixon # disable legacy c-s scroll-lock

[[ -f ~/.config/shell/exports ]] && . ~/.config/shell/exports
[[ -f $XDG_CONFIG_HOME/shell/aliases ]] && . $XDG_CONFIG_HOME/shell/aliases
[[ -f $XDG_CONFIG_HOME/shell/zsh.local ]] && . $XDG_CONFIG_HOME/shell/zsh.local

bindkey -e # C-a and C-e bindings. Must be before fzf shell completion overrides for fzf C-r to work
[ -f ~/.config/fzf/key-bindings.zsh ] && source ~/.config/fzf/key-bindings.zsh

autoload -Uz compinit -d $XDG_CACHE_HOME/zcompdump-$ZSH_VERSION
zstyle ':completion:*:*:git:*' script $XDG_CONFIG_HOME/git/.git-completion.zsh
compdef git-status='git'

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
[ -f $HOME/.config/autojump.zsh ] && . $HOME/.config/autojump.zsh

# HOSTNAME=$HOST
# if [ -z $SSH_AGENT_PID ]
# then
#   [ -f /usr/bin/keychain ] && /usr/bin/keychain --nogui $HOME/.ssh/id_rsa &>/dev/null
#   [ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
# fi

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL="$"
prompt pure

zstyle ':completion:*' menu select

# sudo /sbin/sysctl -p > /dev/null

## problems trying to run it without sudo with sudoers permission trick.
# %LimitedAdmins ALL=NOPASSWD: /usr/sbin/ntpdate time.windows.com
#
# The things ntpdate seems to need even more authorization
## sudo ntpdate time.windows.com > /dev/null 2>&1 &

# [ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_SUBLIME" ] && [ -z "$INSIDE_EMACS" ] && [ -z "$INTELLIJ" ] && [[ -o interactive ]] && tat 2>/dev/null
