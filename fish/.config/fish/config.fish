set PATH ~/dotfiles/bin/ $PATH
set -x CDPATH $HOME $HOME/projects $HOME/projects/work

set -x DOCKER_HOST tcp://ns351672.ip-91-121-70.eu:2376
set -x DOCKER_TLS_VERIFY 1
set -x VAGRANT_DEFAULT_PROVIDER parallels

status --is-interactive; and . (rbenv init -|psub)

alias ec "emacsclient -ta ''"
alias dcr 'docker-compose run'
alias dcrs 'docker-compose run --service-ports'
alias delete_docker_containers 'docker rm (docker ps -a -q)'
alias delete_docker_images 'docker rmi (docker images -q)'

alias tu "tmux -u"
alias tmux "tmux -u"
alias screen "screen -U"
alias pd "psql -p 5432 -h localhost -d "

alias watch_projects "fswatch -0 -r --exclude '\.#' --exclude vendor --exclude .git --exclude Gemfile.lock --exclude GPATH --exclude GRTAGS --exclude GTAGS --exclude tmp /Users/aurelienbottazini/projects | xargs -0 -n 1 -I file rsync_sd file"

set --erase fish_greeting
