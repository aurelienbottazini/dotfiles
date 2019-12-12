# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=1000
HISTFILESIZE=2000

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh

zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh
compdef git-status='git'

export EDITOR="vim"
export VISUAL="vim"

export PATH=/usr/local/bin:~/bin:~/bin/DataGrip/bin:~/.config/yarn/global/node_modules/.bin:~/.cabal/bin:~/dotfiles/bin/:/usr/local/sbin:/usr/local/opt/go/libexec/bin:~/Library/Python/3.6/bin:~/idea-IU/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH="$HOME/.rbenv/bin:$PATH"
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

zstyle ':completion:*' menu select
