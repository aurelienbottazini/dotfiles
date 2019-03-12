set fish_greeting

eval (~/work/dox-compose/bin/dox-init)
set -x PATH ~/bin /usr/local/sbin ~/.rbenv/shims  ~/.nvm/versions/node/v8.11.1/bin  ~/.yarn/bin ~/.cargo/bin ~/.cabal/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

set -x CDPATH $HOME $HOME/projects $HOME/work

# fg Text
# bg Background
# hl Highlighted substrings
# fg+ Text (current line)
# bg+ Background (current line)
# hl+ Highlighted substrings (current line)
# info Info
# prompt Prompt
# pointer Pointer to the current line
# marker Multi-select marker
# spinner Streaming input indicator
# header Header
set -x FZF_DEFAULT_OPTS "--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33,info:136,prompt:136,pointer:230,marker:230,spinner:136"

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
set -x LS_COLORS "rs=0:di=00;34:ln=00;33:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;31:*.tar=
01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=0
1;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;
31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01
;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.
tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01
;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01
;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc
=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

abbr em "emacs_starter.sh"
alias ec "emacsclient -s (tmux display-message -p '#S') -ta ''"
alias ef "emacsclient -ncq -a '' -e '(select-frame-set-input-focus (selected-frame))'"

alias delete_docker_containers 'docker rm (docker ps -a -q)'
alias delete_docker_images 'docker rmi (docker images -q)'

alias tu "tmux -u"
alias screen "screen -U"
abbr pd "psql -p 5432 -h localhost -d "
alias ls "ls --color"
alias l. "ls -d .*"
alias grep "grep --exclude-dir=.git --exclude-dir=vendor --exclude-dir=node_modules --exclude=GTAGS --exclude=GRTAGS --exclude=GPATH"
alias training_neo4j="chromium-browser --app --new-window http://0.0.0.0:7474 and; docker run \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
    --volume=$HOME/neo4j/logs:/logs \
    neo4j:3.0"

alias v. "cd dotfiles;and vim ."

set -x EDITOR 'vim'
set -x VISUAL 'vim'
# https://fishshell.com/docs/2.3index.html#variables-color
if test -n "$TERM"
  set -g fish_color_autosuggestion "#93a1a1"
  set -g fish_color_command "-o" "#268bd2"
  set -g fish_color_param "#268bd2"
  set -g fish_color_search_match	"#073642" "--background=#fccf61"
  set -g fish_color_operator "-o" "#6c71c4"
  set -g fish_color_quote "-i" "#859900"
  set -g fish_color_match "--background=#859900"
  set -g fish_pager_color_prefix "-i" "#268bd2"
  set -g fish_color_error "red"

  if test -e ~/work/dox-compose/helpers.bash
    bass source ~/work/dox-compose/bin/dox-init
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
end

set -g fish_term24bit 1

set -x GTAGSLABEL pygments
set -x XDG_CURRENT_DESKTOP GNOME # for gnome-control-center to work correctly on xmonad
set -x CHROME_BIN /usr/bin/chromium-browser # for karmajs specs
set -x NNN_CONTEXT_COLORS '5173'
set -x NNN_BMS 'd:~/Dropbox;p:~/projects/;f:/media/aurelienbottazini/Files;.:~/dotfiles'
set -x MC_SKIN "$HOME/.config/mc/solarized.ini"
