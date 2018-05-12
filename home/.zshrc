autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(jump shell)"

export PATH=~/.config/yarn/global/node_modules/.bin:~/dotfiles/bin/:/usr/local/sbin:/usr/local/opt/go/libexec/bin:~/Library/Python/3.6/bin:$PATH
export GOPATH=/usr/local/opt/go/libexec/bin
export EDITOR="vim"
export DICPATH=~/dictionaries
export ITERM_24BIT=1

setopt auto_cd
cdpath=($HOME $HOME/projects $HOME/projects/work)

alias em="emacs"
alias ec="tmux rename-window 'emacs' && tmux display-message -p '#S' | xargs -J % emacsclient -s % -ta ''"
alias ef="tmux display-message -p '#S' | xargs -J % emacsclient -s % -ncq -a ''"

alias db='docker-compose build'
alias dr='docker-compose run'
alias delete_docker_containers='docker rm $(docker ps -a -q)'
alias delete_docker_images='docker rmi $(docker images -q)'

#alias tmux="tmux -u"
alias screen="screen -U"
alias pd="psql -p 5432 -h localhost -d "
# alias ls="gls --color"
alias grep="grep --exclude-dir=.git --exclude-dir=vendor --exclude-dir=node_modules --exclude=GTAGS --exclude=GRTAGS --exclude=GPATH"
alias y="yarn"
alias ctags="/usr/local/bin/ctags"

eval "$(rbenv init -)"

# # No arguments: `git status`
# # With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# # Complete g like git
compdef g=git

# # select first option for autocompletion on tab
setopt menu_complete
zstyle ':completion:*' menu select

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && tat
