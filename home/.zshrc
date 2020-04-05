# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
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

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# export GDK_SCALE=2 #retina support
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

autoload -Uz compinit
compinit # on OSX needs to be run before using compdef
zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh
compdef git-status='git'

export EDITOR="vim"
export VISUAL="vim"

export PATH=/usr/local/bin:$HOME/bin:$HOME/.cabal/bin:/usr/local/sbin:/usr/local/opt/go/libexec/bin:$HOME/Library/Python/3.6/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

 [ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
 eval "$(rbenv init -)"
export N_PREFIX="$HOME/n";
export PATH=$N_PREFIX/bin:$PATH
export BROWSER="wslview"
export CHROME_BIN="chromium-browser"
export BAT_THEME="OneHalfLight"

# you can generate that string with `dircolors`
LS_COLORS='rs=0:di=00;34:ln=04;00:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;31:*.tar=01;32:*.tgz=01;32:*.arc=01;32:*.arj=01;32:*.taz=01;32:*.lha=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.tlz=01;32:*.txz=01;32:*.tzo=01;32:*.t7z=01;32:*.zip=01;32:*.z=01;32:*.Z=01;32:*.dz=01;32:*.gz=01;32:*.lrz=01;32:*.lz=01;32:*.lzo=01;32:*.xz=01;32:*.zst=01;32:*.tzst=01;32:*.bz2=01;32:*.bz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tz=01;32:*.deb=01;32:*.rpm=01;32:*.jar=01;32:*.war=01;32:*.ear=01;32:*.sar=01;32:*.rar=01;32:*.alz=01;32:*.ace=01;32:*.zoo=01;32:*.cpio=01;32:*.7z=01;32:*.rz=01;32:*.cab=01;32:*.wim=01;32:*.swm=01;32:*.dwm=01;32:*.esd=01;32:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS;

export CDPATH=.:~/:~/projects:~/work

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

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export GIT_TEMPLATE_DIR=$HOME/.git_template

zstyle ':completion:*' menu select

if [ `uname` != "Darwin" ]
then
  sudo /sbin/sysctl -p > /dev/null
fi

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && [ -z "$TERMINAL_EMULATOR" ] && tat >/dev/null
