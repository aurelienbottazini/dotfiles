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

[[ -f ~/$XDG_CONFIG_HOME/shell/aliases ]] && source ~/$XDG_CONFIG_HOME/shell/aliases
[[ -f ~/$XDG_CONFIG_HOME/shell/zsh.local ]] && source ~/$XDG_CONFIG_HOME/shell/zsh.local

bindkey -e # C-a and C-e bindings. Must be before fzf shell completion overrides for fzf C-r to work
[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
[ -f /home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh ] && source /home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh
[ -f /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh ] && source /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  export FZF_DEFAULT_OPTS="
   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "
}
_gen_fzf_default_opts

autoload -Uz compinit -d ~/$XDG_CACHE_HOME/zcompdump-$ZSH_VERSION
zstyle ':completion:*:*:git:*' script ~/.config/git/.git-completion.zsh
compdef git-status='git'


[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
eval "$(rbenv init -)"


HOSTNAME=$HOST
[ -f /usr/bin/keychain ] && /usr/bin/keychain --nogui $HOME/.ssh/id_rsa &>/dev/null
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

# Load version control information
autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%b %u %c " enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
precmd() {
  vcs_info
}
setopt prompt_subst
autoload -U colors && colors
PROMPT='%{$fg[blue]%}[%~] %{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}
%{$fg[red]%}%(!.#.$)%{$reset_color%} '
RPROMPT=''

zstyle ':completion:*' menu select

if [ `uname` != "Darwin" ]
then
  sudo /sbin/sysctl -p > /dev/null
fi

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && [ -z "$TERMINAL_EMULATOR" ] && tat >/dev/null
