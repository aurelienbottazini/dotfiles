# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
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
[ -f ~/.config/fzf/key-bindings.zsh ] && . ~/.config/fzf/key-bindings.zsh

autoload -Uz compinit -d $XDG_CACHE_HOME/zcompdump-$ZSH_VERSION
compinit
compdef git-status='git'

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=/usr/local/bin:$PATH

autoload -U promptinit; promptinit
PROMPT=$'%F{black}%K{blue}%n@%m:%K{green}%25<...<%d%<<%{\e[0m%}\n$ %k%f'

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"


#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


