# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTFILE=.zhistory
HISTSIZE=1000
HISTFILESIZE=2000

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

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

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="--color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue,info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
}
_gen_fzf_default_opts

zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh
compdef git-status='git'

export EDITOR="vim"
export VISUAL="vim"

export PATH=/usr/local/bin:~/bin:~/bin/DataGrip/bin:~/.config/yarn/global/node_modules/.bin:~/.cabal/bin:~/dotfiles/bin/:/usr/local/sbin:/usr/local/opt/go/libexec/bin:~/Library/Python/3.6/bin:~/idea-IU/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
export N_PREFIX="$HOME/n";
export PATH=$N_PREFIX/bin:$PATH
export BROWSER="browser.sh"

export CDPATH=.:~/:~/projects:~/work

HOSTNAME=$HOST
/usr/bin/keychain --nogui $HOME/.ssh/id_rsa &>/dev/null
source $HOME/.keychain/$HOSTNAME-sh
# sysctl -p 1>/dev/null
#
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
PROMPT='%{$fg[blue]%}[%~] %{$fg[red]%}%(!.#.$)%{$reset_color%} '
RPROMPT='%{$fg[magenta]%}${vcs_info_msg_0_}%{$reset_color%}'

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export GDK_SCALE=2 #retina support

zstyle ':completion:*' menu select

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && tat
