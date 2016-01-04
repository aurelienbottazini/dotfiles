set PATH ~/dotfiles/bin/ $PATH
set -x DOCKER_HOST tcp://ks212069.kimsufi.com:2376
set -x DOCKER_TLS_VERIFY 1

set -x VAGRANT_DEFAULT_PROVIDER parallels

status --is-interactive; and . (rbenv init -|psub)