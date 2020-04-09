# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.config/shell/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
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
[ -f /home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh ] && source /home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh
[ -f /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh ] && source /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh

autoload -Uz compinit -d $XDG_CACHE_HOME/zcompdump-$ZSH_VERSION
zstyle ':completion:*:*:git:*' script $XDG_CONFIG_HOME/git/.git-completion.zsh
compdef git-status='git'

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"

HOSTNAME=$HOST
if [ -z $SSH_AGENT_PID ]
then
  [ -f /usr/bin/keychain ] && /usr/bin/keychain --nogui $HOME/.ssh/id_rsa &>/dev/null
  [ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
fi
# [ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

setopt prompt_subst
autoload -U colors && colors
PROMPT='%{$fg[blue]%}[%~] %{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}
%{$fg[red]%}%(!.#.$)%{$reset_color%} '
RPROMPT=''

zstyle ':completion:*' menu select

# if [ `uname` != "Darwin" ]
# then
#   sudo /sbin/sysctl -p > /dev/null
# fi

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && [ -z "$TERMINAL_EMULATOR" ] && tat >/dev/null
