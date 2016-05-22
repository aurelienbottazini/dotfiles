set -x PATH ~/dotfiles/bin /usr/local/sbin $PATH
rbenv rehash > /dev/null ^&1

set -x CDPATH $HOME $HOME/projects $HOME/projects/work

set -x DOCKER_HOST tcp://ns351672.ip-91-121-70.eu:2376
set -x DOCKER_TLS_VERIFY 1
set -x VAGRANT_DEFAULT_PROVIDER parallels

status --is-interactive; and . (rbenv init -|psub)

alias em "emacs_starter.sh"
alias ec "emacsclient -ta ''"
alias ef "emacsclient -ncq -a ''"

alias db 'docker-compose build'
alias dr 'docker-compose run'
alias drs 'docker-compose run --service-ports'
alias drr 'docker-compose run --service-ports web bundle exec rails s'
alias delete_docker_containers 'docker rm (docker ps -a -q)'
alias delete_docker_images 'docker rmi (docker images -q)'

alias tu "tmux -u"
alias tmux "tmux -u"
alias screen "screen -U"
alias pd "psql -p 5432 -h localhost -d "
alias ls "gls --color"
alias grep "grep --exclude-dir=.git --exclude-dir=vendor --exclude-dir=node_modules --exclude=GTAGS --exclude=GRTAGS --exclude=GPATH"

alias watch_projects "fswatch -0 -r --exclude '\.#' --exclude vendor --exclude .git --exclude Gemfile.lock --exclude GPATH --exclude GRTAGS --exclude GTAGS --exclude tmp --exclude vendor --exclude db/data --exclude db/neo4j (pwd) | xargs -0 -n 1 -I file rsync_sd file"

set --erase fish_greeting
set -gx EDITOR 'emacsclient -t -a ""'
set -gx fish_color_autosuggestion "#6f6f6f"
set -gx fish_color_command "#94bff3"
set -gx fish_color_param "#8cd0d3"

set -gx fish_term24bit 1

# fish_color_comment	eab700
# fish_color_cwd	green
# fish_color_cwd_root	red
# fish_color_end	8959a8
# fish_color_error	c82829
# fish_color_escape	cyan
# fish_color_history_current	cyan
# fish_color_host	'-o' 'cyan'
# fish_color_match	cyan
# fish_color_normal	normal
# fish_color_operator	cyan
# fish_color_quote	718c00
# fish_color_redirection	3e999f
# fish_color_search_match	'--background=#3d3935'
# fish_color_selection	red
# fish_color_status	red
# fish_color_user	'-o' 'green'
# fish_color_valid_path	--underline
# fish_color_normal, the default color
# fish_color_command, the color for commands
# fish_color_quote, the color for quoted blocks of text
# fish_color_redirection, the color for IO redirections
# fish_color_end, the color for process separators like ';' and '&'
# fish_color_error, the color used to highlight potential errors
# fish_color_param, the color for regular command parameters
# fish_color_comment, the color used for code comments
# fish_color_match, the color used to highlight matching parenthesis
# fish_color_search_match, the color used to highlight history search matches
# fish_color_operator, the color for parameter expansion operators like '*' and '~'
# fish_color_escape, the color used to highlight character escapes like '\n' and '\x70'
# fish_color_cwd, the color used for the current working directory in the default prompt

set -x GTAGSLABEL pygments
set -x TERM tmux-256color

if [ -z "$TMUX" ]
  if [ -z "$INSIDE_EMACS" ]
    tat
  end
end
