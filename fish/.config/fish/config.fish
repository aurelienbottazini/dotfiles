bass source ~/.nvm/nvm.sh
set -gx PATH ~/bin /usr/local/sbin ~/.rbenv/shims (yarn global bin) $PATH
status --is-interactive; and source (rbenv init -|psub)

set -x CDPATH $HOME $HOME/projects $HOME/work

# Effects
# 00	Default colour
# 01	Bold
# 04	Underlined
# 05	Flashing text
# 07	Reversetd
# 08	Concealed
# Colours
# 30	Black
# 31	Red
# 32	Green
# 33	Orange
# 34	Blue
# 35	Purple
# 36	Cyan
# 37	Grey
# Backgrounds
# 40	Black background
# 41	Red background
# 42	Green background
# 43	Orange background
# 44	Blue background
# 45	Purple background
# 46	Cyan background
# 47	Grey background
# Extra colours
# 90	Dark grey
# 91	Light red
# 92	Light green
# 93	Yellow
# 94	Light blue
# 95	Light purple
# 96	Turquoise
# 97	White
# 100	Dark grey background
# 101	Light red background
# 102	Light green background
# 103	Yellow background
# 104	Light blue background
# 105	Light purple background
# 106	Turquoise background
set -x LS_COLORS "rs=0:di=01;34:ln=00;92:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;31:*.tar=
01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=0
1;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;
31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01
;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.
tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01
;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01
;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc
=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

# set -x DOCKER_HOST tcp://ns351672.ip-91-121-70.eu:2376
# set -x DOCKER_TLS_VERIFY 1
# set -x VAGRANT_DEFAULT_PROVIDER parallels

# status --is-interactive; and . (rbenv init -|psub)

alias em "emacs_starter.sh"
alias ec "emacsclient -ta ''"
alias ef "emacsclient -ncq -a ''"

alias db 'docker-compose build'
alias dr 'docker-compose run'
alias drs 'docker-compose run --service-ports'
alias drr 'docker-compose run --service-ports web bundle exec rails s -p 3000 --binding 0.0.0.0'
alias delete_docker_containers 'docker rm (docker ps -a -q)'
alias delete_docker_images 'docker rmi (docker images -q)'

alias tu "tmux -u"
# alias tmux "tmux -u"
alias screen "screen -U"
alias pd "psql -p 5432 -h localhost -d "
alias ls "ls --color"
alias grep "grep --exclude-dir=.git --exclude-dir=vendor --exclude-dir=node_modules --exclude=GTAGS --exclude=GRTAGS --exclude=GPATH"

alias watch_projects "fswatch -0 -r --exclude '\.#' --exclude vendor --exclude .git --exclude Gemfile.lock --exclude GPATH --exclude GRTAGS --exclude GTAGS --exclude tmp --exclude vendor --exclude db/data --exclude db/neo4j (pwd) | xargs -0 -n 1 -I file rsync_sd file"

set --erase fish_greeting
set -gx EDITOR 'vim'
set -gx fish_color_autosuggestion "#949494"
set -gx fish_color_command "#008700"
set -gx fish_color_param "#0000d7"
set -gx fish_color_search_match	"#c82829"

set -gx fish_term24bit 1

# fish_color_comment	eab700
# fish_color_cwd	green
# fish_color_cwd_root	red
# fish_color_end	8959a8
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
# fish_color_command, the color for commands # fish_color_quote, the color for quoted blocks of text
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

if test -e ~/work/dox-compose/helpers.bash
  bass source ~/work/dox-compose/helpers.bash
end

if [ -z "$TMUX" ]
  if [ "$TERM" != "dumb" ]
   if [ -z "$INSIDE_EMACS" ]
     if not string match -r \^com.jetbrains.intellij. $XPC_SERVICE_NAME
       tat
     end
   end
  end
end
