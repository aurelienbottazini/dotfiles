set PATH ~/dotfiles/bin/ $PATH
set -x DOCKER_HOST tcp://ks212069.kimsufi.com:2376
set -x DOCKER_TLS_VERIFY 1

set -x VAGRANT_DEFAULT_PROVIDER parallels

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1